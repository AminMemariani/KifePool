import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:kifepool/core/constants/rpc_config.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';

/// Service for managing RPC node selection and health checking
class RpcNodeService {
  static const String _selectedNodesKey = 'selected_rpc_nodes';
  static final Map<String, RpcNode> _selectedNodes = {};
  static final Map<String, Timer> _healthCheckTimers = {};
  static bool _testMode = false;

  /// Initialize the RPC node service
  static Future<void> initialize() async {
    // Check if we're in test mode
    _testMode = kDebugMode && const bool.fromEnvironment('dart.vm.test');

    if (_testMode) {
      // In test mode, don't load nodes or start health checks
      return;
    }

    await _loadSelectedNodes();
    _startHealthChecks();
  }

  /// Get the selected RPC node for a network
  static RpcNode? getSelectedNode(String network) {
    return _selectedNodes[network.toLowerCase()];
  }

  /// Set the selected RPC node for a network
  static Future<void> setSelectedNode(String network, RpcNode node) async {
    _selectedNodes[network.toLowerCase()] = node;
    await _saveSelectedNodes();

    // Restart health check for this network
    _restartHealthCheck(network);
  }

  /// Get all available RPC nodes for a network
  static List<RpcNode> getAvailableNodes(String network) {
    return RpcConfig.getRpcNodes(network);
  }

  /// Get the RPC URL for a network
  static String? getRpcUrl(String network) {
    if (_testMode) {
      // In test mode, return null to prevent network calls
      return null;
    }
    final node = getSelectedNode(network);
    return node?.url;
  }

  /// Check if a network has a selected RPC node
  static bool hasSelectedNode(String network) {
    return _selectedNodes.containsKey(network.toLowerCase());
  }

  /// Get all selected nodes
  static Map<String, RpcNode> getAllSelectedNodes() {
    return Map.from(_selectedNodes);
  }

  /// Reset to default nodes for all networks
  static Future<void> resetToDefaults() async {
    _selectedNodes.clear();

    // Set default nodes for all supported networks
    for (final network in RpcConfig.getSupportedNetworks()) {
      final defaultNode = RpcConfig.getDefaultRpcNode(network);
      if (defaultNode != null) {
        _selectedNodes[network.toLowerCase()] = defaultNode;
      }
    }

    await _saveSelectedNodes();
    _startHealthChecks();
  }

  /// Check the health of an RPC node
  static Future<RpcNodeHealth> checkNodeHealth(RpcNode node) async {
    WebSocketChannel? channel;
    try {
      final stopwatch = Stopwatch()..start();

      channel = WebSocketChannel.connect(Uri.parse(node.url));

      final request = {
        'jsonrpc': '2.0',
        'id': 1,
        'method': 'system_health',
        'params': [],
      };

      channel.sink.add(jsonEncode(request));

      // Wait for response with timeout
      final response = await channel.stream.first.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
            'RPC request timed out',
            const Duration(seconds: 10),
          );
        },
      );

      stopwatch.stop();
      await channel.sink.close();
      channel = null;

      final responseData = jsonDecode(response) as Map<String, dynamic>;

      if (responseData['result'] != null) {
        return RpcNodeHealth(
          isHealthy: true,
          latency: stopwatch.elapsedMilliseconds,
          lastChecked: DateTime.now(),
          error: null,
        );
      } else {
        return RpcNodeHealth(
          isHealthy: false,
          latency: stopwatch.elapsedMilliseconds,
          lastChecked: DateTime.now(),
          error: 'Invalid response from RPC node',
        );
      }
    } on TimeoutException catch (e) {
      // Ensure channel is closed on timeout
      try {
        await channel?.sink.close();
      } catch (_) {
        // Ignore errors when closing
      }
      return RpcNodeHealth(
        isHealthy: false,
        latency: 0,
        lastChecked: DateTime.now(),
        error: 'Connection timeout: ${e.message}',
      );
    } on SocketException catch (e) {
      // Handle DNS resolution failures and network errors
      try {
        await channel?.sink.close();
      } catch (_) {
        // Ignore errors when closing
      }
      final errorMessage = e.message.contains('Failed host lookup')
          ? 'DNS resolution failed: ${Uri.parse(node.url).host}'
          : 'Network error: ${e.message}';
      return RpcNodeHealth(
        isHealthy: false,
        latency: 0,
        lastChecked: DateTime.now(),
        error: errorMessage,
      );
    } catch (e) {
      // Ensure channel is closed on any other error
      try {
        await channel?.sink.close();
      } catch (_) {
        // Ignore errors when closing
      }
      return RpcNodeHealth(
        isHealthy: false,
        latency: 0,
        lastChecked: DateTime.now(),
        error: e.toString(),
      );
    }
  }

  /// Check health of all nodes for a network
  static Future<List<RpcNode>> checkNetworkHealth(String network) async {
    final nodes = getAvailableNodes(network);
    final updatedNodes = <RpcNode>[];

    for (final node in nodes) {
      final health = await checkNodeHealth(node);
      final updatedNode = node.copyWith(
        latency: health.latency,
        isHealthy: health.isHealthy,
        lastChecked: health.lastChecked,
      );
      updatedNodes.add(updatedNode);
    }

    return updatedNodes;
  }

  /// Start health checks for all selected nodes
  static void _startHealthChecks() {
    for (final network in _selectedNodes.keys) {
      _restartHealthCheck(network);
    }
  }

  /// Restart health check for a specific network
  static void _restartHealthCheck(String network) {
    // Cancel existing timer
    _healthCheckTimers[network]?.cancel();

    // Start new timer
    _healthCheckTimers[network] = Timer.periodic(
      const Duration(minutes: 5), // Check every 5 minutes
      (timer) async {
        try {
          final node = _selectedNodes[network];
          if (node != null) {
            final health = await checkNodeHealth(node);
            if (!health.isHealthy) {
              debugPrint('RPC node $network is unhealthy: ${health.error}');
              // Optionally switch to a backup node
              await _switchToBackupNode(network);
            }
          }
        } catch (e) {
          // Prevent errors from propagating and causing unhandled exceptions
          debugPrint('Error during health check for $network: $e');
        }
      },
    );
  }

  /// Switch to a backup node if the current one is unhealthy
  static Future<void> _switchToBackupNode(String network) async {
    try {
      final availableNodes = getAvailableNodes(network);
      final currentNode = _selectedNodes[network];

      if (currentNode == null) return;

      // Find a healthy backup node
      for (final node in availableNodes) {
        if (node.url != currentNode.url) {
          final health = await checkNodeHealth(node);
          if (health.isHealthy) {
            await setSelectedNode(network, node);
            debugPrint(
              'Switched to backup RPC node for $network: ${node.name}',
            );
            break;
          }
        }
      }
    } catch (e) {
      debugPrint('Error switching to backup node for $network: $e');
    }
  }

  /// Load selected nodes from secure storage
  static Future<void> _loadSelectedNodes() async {
    try {
      final selectedNodesJson = await SecureStorageService.getSetting(
        _selectedNodesKey,
      );
      if (selectedNodesJson != null) {
        final selectedNodesData =
            jsonDecode(selectedNodesJson) as Map<String, dynamic>;

        for (final entry in selectedNodesData.entries) {
          final network = entry.key;
          final nodeData = entry.value as Map<String, dynamic>;

          final node = RpcNode(
            name: nodeData['name'] as String,
            url: nodeData['url'] as String,
            isOfficial: nodeData['isOfficial'] as bool,
            region: nodeData['region'] as String,
            latency: nodeData['latency'] as int? ?? 0,
            isHealthy: nodeData['isHealthy'] as bool? ?? true,
            lastChecked: nodeData['lastChecked'] != null
                ? DateTime.parse(nodeData['lastChecked'] as String)
                : null,
          );

          _selectedNodes[network] = node;
        }
      } else {
        // No saved nodes, use defaults
        await resetToDefaults();
      }
    } catch (e) {
      debugPrint('Failed to load selected RPC nodes: $e');
      await resetToDefaults();
    }
  }

  /// Save selected nodes to secure storage
  static Future<void> _saveSelectedNodes() async {
    try {
      final selectedNodesData = <String, dynamic>{};

      for (final entry in _selectedNodes.entries) {
        final network = entry.key;
        final node = entry.value;

        selectedNodesData[network] = {
          'name': node.name,
          'url': node.url,
          'isOfficial': node.isOfficial,
          'region': node.region,
          'latency': node.latency,
          'isHealthy': node.isHealthy,
          'lastChecked': node.lastChecked?.toIso8601String(),
        };
      }

      await SecureStorageService.storeSetting(
        _selectedNodesKey,
        jsonEncode(selectedNodesData),
      );
    } catch (e) {
      debugPrint('Failed to save selected RPC nodes: $e');
    }
  }

  /// Dispose of the service
  static void dispose() {
    for (final timer in _healthCheckTimers.values) {
      timer.cancel();
    }
    _healthCheckTimers.clear();
  }
}

/// RPC node health information
class RpcNodeHealth {
  final bool isHealthy;
  final int latency; // in milliseconds
  final DateTime lastChecked;
  final String? error;

  const RpcNodeHealth({
    required this.isHealthy,
    required this.latency,
    required this.lastChecked,
    this.error,
  });

  @override
  String toString() {
    return 'RpcNodeHealth(isHealthy: $isHealthy, latency: ${latency}ms, lastChecked: $lastChecked, error: $error)';
  }
}
