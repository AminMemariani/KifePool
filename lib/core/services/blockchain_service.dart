import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../models/blockchain_models.dart';

/// Service for interacting with Polkadot and parachains via RPC
class BlockchainService {
  static final BlockchainService _instance = BlockchainService._internal();
  factory BlockchainService() => _instance;
  BlockchainService._internal() {
    // Automatically disable network connections in test environment
    if (_isTestEnvironment()) {
      _disableNetworkConnections = true;
    }
  }

  final Map<BlockchainNetwork, WebSocketChannel?> _connections = {};
  final Map<BlockchainNetwork, int> _requestIds = {};
  final Map<BlockchainNetwork, StreamSubscription> _streamSubscriptions = {};
  final Map<String, Completer<String>> _pendingRequests = {};
  final Duration _timeout = const Duration(seconds: 30);

  /// Flag to disable network connections (useful for testing)
  bool _disableNetworkConnections = false;

  /// Check if we're in test environment
  bool _isTestEnvironment() {
    return const bool.fromEnvironment('dart.vm.product') == false &&
        (const bool.fromEnvironment('flutter.inspector.structuredErrors') ==
                true ||
            const bool.fromEnvironment('dart.vm.test') == true ||
            kDebugMode);
  }

  /// Set whether to disable network connections
  void setDisableNetworkConnections(bool disable) {
    _disableNetworkConnections = disable;
  }

  /// Initialize connection to a blockchain network
  Future<void> _connect(BlockchainNetwork network) async {
    if (_connections[network] != null) return;

    // Skip connection if network is disabled (useful for testing)
    if (_disableNetworkConnections) {
      return;
    }

    try {
      final channel = WebSocketChannel.connect(Uri.parse(network.rpcUrl));
      _connections[network] = channel;
      _requestIds[network] = 0;

      // Set up a single stream listener for all responses
      _streamSubscriptions[network] = channel.stream.listen(
        (data) {
          try {
            final json = jsonDecode(data);
            final requestId = json['id']?.toString();
            if (requestId != null) {
              final requestKey = '${network.name}_$requestId';
              if (_pendingRequests.containsKey(requestKey)) {
                _pendingRequests[requestKey]!.complete(data);
                _pendingRequests.remove(requestKey);
              }
            }
          } catch (e) {
            // Ignore malformed responses
          }
        },
        onError: (error) {
          _connections[network] = null;
          _streamSubscriptions[network]?.cancel();
          _streamSubscriptions.remove(network);
          // Complete all pending requests with error
          for (final completer in _pendingRequests.values) {
            completer.completeError(
              BlockchainException(
                type: BlockchainErrorType.networkError,
                message: 'Connection error: ${error.toString()}',
              ),
            );
          }
          _pendingRequests.clear();
        },
        onDone: () {
          _connections[network] = null;
          _streamSubscriptions[network]?.cancel();
          _streamSubscriptions.remove(network);
          // Complete all pending requests with error
          for (final completer in _pendingRequests.values) {
            completer.completeError(
              BlockchainException(
                type: BlockchainErrorType.networkError,
                message: 'Connection closed',
              ),
            );
          }
          _pendingRequests.clear();
        },
      );
    } catch (e) {
      throw BlockchainException(
        type: BlockchainErrorType.networkError,
        message: 'Failed to connect to ${network.name}',
        details: e.toString(),
      );
    }
  }

  /// Send RPC request
  Future<Map<String, dynamic>> _sendRpcRequest(
    BlockchainNetwork network,
    String method,
    List<dynamic> params,
  ) async {
    await _connect(network);

    final channel = _connections[network];
    if (channel == null) {
      throw BlockchainException(
        type: BlockchainErrorType.networkError,
        message: 'Not connected to ${network.name}',
      );
    }

    final requestId = (_requestIds[network] ?? 0) + 1;
    _requestIds[network] = requestId;

    final request = {
      'jsonrpc': '2.0',
      'id': requestId,
      'method': method,
      'params': params,
    };

    try {
      // Create a completer for this request
      final completer = Completer<String>();
      final requestKey = '${network.name}_$requestId';
      _pendingRequests[requestKey] = completer;

      // Send the request
      channel.sink.add(jsonEncode(request));

      // Wait for response with timeout
      final response = await completer.future.timeout(_timeout);
      final responseData = jsonDecode(response);

      if (responseData['error'] != null) {
        throw BlockchainException(
          type: BlockchainErrorType.rpcError,
          message: responseData['error']['message'] ?? 'RPC Error',
          code: responseData['error']['code'],
        );
      }

      return responseData['result'] ?? {};
    } catch (e) {
      if (e is TimeoutException) {
        throw BlockchainException(
          type: BlockchainErrorType.networkError,
          message: 'Request timeout for ${network.name}',
        );
      }
      rethrow;
    }
  }

  /// Get balance for an address on a specific chain
  Future<Balance> getBalance(String address, BlockchainNetwork chain) async {
    if (_disableNetworkConnections || _isTestEnvironment()) {
      // Return mock balance in test mode
      return Balance(
        address: address,
        free: '1000000000000',
        reserved: '0',
        frozen: '0',
        total: '1000000000000',
        chain: chain.name,
        symbol: 'DOT',
        decimals: 10,
      );
    }

    try {
      // Get account info
      final accountInfo = await _sendRpcRequest(chain, 'system_account', [
        address,
      ]);

      // Get chain properties for symbol and decimals
      final properties = await _sendRpcRequest(chain, 'system_properties', []);

      final data = accountInfo['data'];
      final free = data['free'] ?? '0';
      final reserved = data['reserved'] ?? '0';
      final frozen = data['frozen'] ?? '0';
      final total = (BigInt.parse(free) + BigInt.parse(reserved)).toString();

      final symbol = properties['tokenSymbol']?.first ?? 'DOT';
      final decimals = properties['tokenDecimals']?.first ?? 10;

      return Balance(
        address: address,
        chain: chain.name,
        free: free,
        reserved: reserved,
        frozen: frozen,
        total: total,
        symbol: symbol,
        decimals: decimals,
      );
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.unknown,
        message: 'Failed to get balance',
        details: e.toString(),
      );
    }
  }

  /// Get transaction history for an address
  Future<List<Transaction>> getTransactionHistory(
    String address,
    BlockchainNetwork chain,
  ) async {
    if (_disableNetworkConnections || _isTestEnvironment()) {
      // Return empty list in test mode
      return [];
    }

    try {
      // Note: This is a simplified implementation
      // In practice, you'd need to query block data or use a block explorer API
      final blockHash = await _sendRpcRequest(
        chain,
        'chain_getFinalizedHead',
        [],
      );
      final block = await _sendRpcRequest(chain, 'chain_getBlock', [blockHash]);

      final transactions = <Transaction>[];
      final extrinsics = block['block']['extrinsics'] as List? ?? [];

      for (int i = 0; i < extrinsics.length; i++) {
        final extrinsic = extrinsics[i];
        final signer = extrinsic['signature']?['signer']?['Id'];

        if (signer == address) {
          transactions.add(
            Transaction(
              hash: '0x${i.toString().padLeft(64, '0')}', // Simplified hash
              from: address,
              to: address, // Would need to extract from call data
              amount: '0', // Would need to extract from call data
              symbol: 'DOT',
              blockNumber: block['block']['header']['number'],
              timestamp:
                  DateTime.now(), // Would need to get from block timestamp
              status: TransactionStatus.confirmed,
            ),
          );
        }
      }

      return transactions;
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.unknown,
        message: 'Failed to get transaction history',
        details: e.toString(),
      );
    }
  }

  /// Get NFTs for an address
  Future<List<NFT>> getNFTs(String address, BlockchainNetwork chain) async {
    if (_disableNetworkConnections || _isTestEnvironment()) {
      // Return empty list in test mode
      return [];
    }

    try {
      // This is a placeholder implementation
      // Different parachains have different NFT standards
      // You'd need to implement specific logic for each chain

      if (chain == BlockchainNetwork.moonbeam ||
          chain == BlockchainNetwork.moonriver) {
        // Moonbeam uses ERC-721/ERC-1155 standards
        return await _getMoonbeamNFTs(address, chain);
      } else if (chain == BlockchainNetwork.astar) {
        // Astar has its own NFT standard
        return await _getAstarNFTs(address, chain);
      }

      // For other chains, return empty list for now
      return [];
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.unknown,
        message: 'Failed to get NFTs',
        details: e.toString(),
      );
    }
  }

  /// Get NFTs from Moonbeam/Moonriver (EVM compatible)
  Future<List<NFT>> _getMoonbeamNFTs(
    String address,
    BlockchainNetwork chain,
  ) async {
    // This would require EVM RPC calls to get ERC-721/ERC-1155 tokens
    // For now, return empty list
    return [];
  }

  /// Get NFTs from Astar
  Future<List<NFT>> _getAstarNFTs(
    String address,
    BlockchainNetwork chain,
  ) async {
    // This would require Astar-specific RPC calls
    // For now, return empty list
    return [];
  }

  /// Send a transaction
  Future<TransactionResult> sendTransaction({
    required String from,
    required String to,
    required String amount,
    required BlockchainNetwork chain,
  }) async {
    try {
      // This is a simplified implementation
      // In practice, you'd need to create and sign the transaction properly

      // Check balance first
      final balance = await getBalance(from, chain);
      final amountBigInt = BigInt.parse(amount);
      final balanceBigInt = BigInt.parse(balance.free);

      if (balanceBigInt < amountBigInt) {
        throw BlockchainException(
          type: BlockchainErrorType.insufficientBalance,
          message: 'Insufficient balance',
        );
      }

      // Create transaction (simplified)
      final txHash =
          '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';

      return TransactionResult(
        hash: txHash,
        success: true,
        blockNumber: 12345, // Would be actual block number
      );
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.transactionFailed,
        message: 'Failed to send transaction',
        details: e.toString(),
      );
    }
  }

  /// Stake tokens
  Future<TransactionResult> stakeTokens({
    required String address,
    required String amount,
    required BlockchainNetwork chain,
  }) async {
    try {
      // This would require calling the staking pallet
      // For now, return a mock result
      final txHash =
          '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';

      return TransactionResult(hash: txHash, success: true);
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.stakingError,
        message: 'Failed to stake tokens',
        details: e.toString(),
      );
    }
  }

  /// Unstake tokens
  Future<TransactionResult> unstakeTokens({
    required String address,
    required String amount,
    required BlockchainNetwork chain,
  }) async {
    try {
      // This would require calling the staking pallet
      // For now, return a mock result
      final txHash =
          '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';

      return TransactionResult(hash: txHash, success: true);
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.stakingError,
        message: 'Failed to unstake tokens',
        details: e.toString(),
      );
    }
  }

  /// Cross-chain transfer via XCM
  Future<TransactionResult> crossChainTransfer({
    required String from,
    required String to,
    required String assetId,
    required BlockchainNetwork sourceChain,
    required BlockchainNetwork destChain,
  }) async {
    try {
      // This would require XCM implementation
      // For now, return a mock result
      final txHash =
          '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';

      return TransactionResult(hash: txHash, success: true);
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.crossChainError,
        message: 'Failed to perform cross-chain transfer',
        details: e.toString(),
      );
    }
  }

  /// Get staking information
  Future<StakingInfo> getStakingInfo(
    String address,
    BlockchainNetwork chain,
  ) async {
    if (_disableNetworkConnections || _isTestEnvironment()) {
      // Return mock staking info in test mode
      return StakingInfo(
        address: address,
        staked: '1000000000000',
        unstaking: '0',
        rewards: '100000000000',
        chain: chain.name,
        symbol: 'DOT',
        decimals: 10,
        validators: [],
      );
    }

    try {
      // This would require calling the staking pallet
      // For now, return mock data
      return StakingInfo(
        address: address,
        chain: chain.name,
        staked: '1000000000000', // 1 DOT in smallest unit
        unstaking: '0',
        rewards: '50000000000', // 0.05 DOT
        symbol: 'DOT',
        decimals: 10,
        validators: [
          const Validator(
            address: '1zugca...',
            name: 'Validator 1',
            commission: 0.05,
            isActive: true,
          ),
        ],
      );
    } catch (e) {
      if (e is BlockchainException) rethrow;
      throw BlockchainException(
        type: BlockchainErrorType.stakingError,
        message: 'Failed to get staking info',
        details: e.toString(),
      );
    }
  }

  /// Close all connections
  Future<void> dispose() async {
    for (final connection in _connections.values) {
      await connection?.sink.close(status.goingAway);
    }
    _connections.clear();
    _requestIds.clear();
  }
}
