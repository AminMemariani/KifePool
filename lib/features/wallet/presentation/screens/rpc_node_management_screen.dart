import 'package:flutter/material.dart';
import 'package:kifepool/core/constants/rpc_config.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/features/wallet/presentation/widgets/rpc_node_selector_widget.dart';

/// RPC node management screen
class RpcNodeManagementScreen extends StatefulWidget {
  const RpcNodeManagementScreen({super.key});

  @override
  State<RpcNodeManagementScreen> createState() =>
      _RpcNodeManagementScreenState();
}

class _RpcNodeManagementScreenState extends State<RpcNodeManagementScreen> {
  List<String> _supportedNetworks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSupportedNetworks();
  }

  Future<void> _loadSupportedNetworks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Get networks that have RPC nodes configured
      final networks = RpcConfig.getSupportedNetworks();
      setState(() {
        _supportedNetworks = networks;
      });
    } catch (e) {
      debugPrint('Failed to load supported networks: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _resetToDefaults() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset to Defaults'),
        content: const Text(
          'This will reset all RPC node selections to their default values. Continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await RpcNodeService.resetToDefaults();
      setState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('RPC nodes reset to defaults'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RPC Node Management'),
        actions: [
          IconButton(
            onPressed: _resetToDefaults,
            icon: const Icon(Icons.restore),
            tooltip: 'Reset to defaults',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header info
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                'RPC Node Configuration',
                                style: AppTypography.titleMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            'Select RPC nodes for each network. The app will automatically switch to backup nodes if the primary node becomes unavailable.',
                            style: AppTypography.bodyMedium.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Network sections
                  ..._supportedNetworks
                      .map(
                        (network) => Column(
                          children: [
                            _buildNetworkSection(network),
                            const SizedBox(height: AppSpacing.lg),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
    );
  }

  Widget _buildNetworkSection(String network) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Network header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Text(
                network.toUpperCase(),
                style: AppTypography.labelMedium.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            // Current node info
            _buildCurrentNodeInfo(network),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        // RPC node selector
        RpcNodeSelectorWidget(
          network: network,
          onNodeSelected: (node) {
            setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('RPC node changed to ${node.name}'),
                backgroundColor: Colors.green,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCurrentNodeInfo(String network) {
    final selectedNode = RpcNodeService.getSelectedNode(network);

    if (selectedNode == null) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Text(
          'No node selected',
          style: AppTypography.bodySmall.copyWith(
            color: Colors.orange,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: selectedNode.isHealthy
            ? Colors.green.withOpacity(0.2)
            : Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedNode.isHealthy ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            selectedNode.name,
            style: AppTypography.bodySmall.copyWith(
              color: selectedNode.isHealthy ? Colors.green : Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (selectedNode.latency > 0) ...[
            const SizedBox(width: AppSpacing.xs),
            Text(
              '(${selectedNode.latency}ms)',
              style: AppTypography.bodySmall.copyWith(
                color: selectedNode.isHealthy ? Colors.green : Colors.red,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
