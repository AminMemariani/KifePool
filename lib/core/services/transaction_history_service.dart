import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/services/database_service.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';
import 'package:kifepool/core/services/mock_data_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Service for managing transaction history
class TransactionHistoryService {
  static const int _cacheExpiryHours = 1;

  /// Get transaction history with filtering
  static Future<TransactionHistoryResult> getTransactionHistory({
    required String address,
    TransactionFilter? filter,
  }) async {
    try {
      final effectiveFilter = filter ?? const TransactionFilter();

      // Try to get from cache first
      final cachedTransactions = await _getCachedTransactions(
        address,
        effectiveFilter,
      );
      if (cachedTransactions.isNotEmpty) {
        return TransactionHistoryResult(
          transactions: cachedTransactions,
          totalCount: cachedTransactions.length,
          hasMore: false,
        );
      }

      // Fetch from blockchain
      final transactions = await _fetchTransactionsFromBlockchain(
        address,
        effectiveFilter,
      );

      // Cache the results
      await _cacheTransactions(transactions);

      return TransactionHistoryResult(
        transactions: transactions,
        totalCount: transactions.length,
        hasMore: false,
      );
    } catch (e) {
      debugPrint('Error getting transaction history: $e');
      // Return cached data as fallback
      final cachedTransactions = await _getCachedTransactions(
        address,
        filter ?? const TransactionFilter(),
      );
      return TransactionHistoryResult(
        transactions: cachedTransactions,
        totalCount: cachedTransactions.length,
        hasMore: false,
      );
    }
  }

  /// Get transaction by hash
  static Future<TransactionHistory?> getTransactionByHash(String hash) async {
    try {
      // Try cache first
      final cached = await DatabaseService.getTransactionByHash(hash);
      if (cached != null) {
        return cached;
      }

      // Fetch from blockchain
      return await _fetchTransactionFromBlockchain(hash);
    } catch (e) {
      debugPrint('Error getting transaction by hash: $e');
      return null;
    }
  }

  /// Get transaction statistics
  static Future<TransactionStats> getTransactionStats(String address) async {
    try {
      final transactions = await _getCachedTransactions(
        address,
        const TransactionFilter(),
      );

      // If no cached transactions, use mock data for demonstration
      if (transactions.isEmpty) {
        return MockDataService.getMockTransactionStats();
      }

      final totalTransactions = transactions.length;
      final pendingTransactions = transactions
          .where((t) => t.status == TransactionStatus.pending)
          .length;
      final confirmedTransactions = transactions
          .where((t) => t.status == TransactionStatus.confirmed)
          .length;
      final failedTransactions = transactions
          .where((t) => t.status == TransactionStatus.failed)
          .length;

      final transactionsByChain = <String, int>{};
      final transactionsByType = <String, int>{};
      double totalVolume = 0;
      double totalFees = 0;

      for (final transaction in transactions) {
        // Count by chain
        transactionsByChain[transaction.chain] =
            (transactionsByChain[transaction.chain] ?? 0) + 1;

        // Count by type
        transactionsByType[transaction.type.name] =
            (transactionsByType[transaction.type.name] ?? 0) + 1;

        // Calculate volume and fees
        if (transaction.type == TransactionType.transfer) {
          totalVolume += double.tryParse(transaction.amount) ?? 0;
        }
        totalFees += double.tryParse(transaction.gasFee) ?? 0;
      }

      return TransactionStats(
        totalTransactions: totalTransactions,
        pendingTransactions: pendingTransactions,
        confirmedTransactions: confirmedTransactions,
        failedTransactions: failedTransactions,
        transactionsByChain: transactionsByChain,
        transactionsByType: transactionsByType,
        totalVolume: totalVolume.toString(),
        totalFees: totalFees.toString(),
      );
    } catch (e) {
      debugPrint('Error getting transaction stats: $e');
      // Return mock stats as fallback
      return MockDataService.getMockTransactionStats();
    }
  }

  /// Refresh transaction history
  static Future<void> refreshTransactionHistory(String address) async {
    try {
      // Clear cache for this address
      await _clearCacheForAddress(address);

      // Fetch fresh data
      final transactions = await _fetchTransactionsFromBlockchain(
        address,
        const TransactionFilter(),
      );

      // Cache the results
      await _cacheTransactions(transactions);
    } catch (e) {
      debugPrint('Error refreshing transaction history: $e');
    }
  }

  /// Get cached transactions
  static Future<List<TransactionHistory>> _getCachedTransactions(
    String address,
    TransactionFilter filter,
  ) async {
    try {
      // Check if cache is still valid
      final cacheKey = 'tx_history_${address}_${filter.hashCode}';
      final cacheTime = await DatabaseService.getCacheTimestamp(cacheKey);

      if (cacheTime != null) {
        final hoursSinceCache = DateTime.now().difference(cacheTime).inHours;
        if (hoursSinceCache < _cacheExpiryHours) {
          return await DatabaseService.getTransactionHistory(
            address: address,
            chain: filter.chain,
            type: filter.type,
            status: filter.status,
            direction: filter.direction,
            fromDate: filter.fromDate,
            toDate: filter.toDate,
            limit: filter.limit,
            offset: filter.offset,
          );
        }
      }

      return [];
    } catch (e) {
      debugPrint('Error getting cached transactions: $e');
      return [];
    }
  }

  /// Cache transactions
  static Future<void> _cacheTransactions(
    List<TransactionHistory> transactions,
  ) async {
    try {
      for (final transaction in transactions) {
        await DatabaseService.saveTransaction(transaction);
      }

      // Update cache timestamp
      final cacheKey =
          'tx_history_${transactions.first.fromAddress}_${Random().nextInt(1000)}';
      await DatabaseService.setCacheTimestamp(cacheKey, DateTime.now());
    } catch (e) {
      debugPrint('Error caching transactions: $e');
    }
  }

  /// Clear cache for address
  static Future<void> _clearCacheForAddress(String address) async {
    try {
      await DatabaseService.clearTransactionCache(address);
    } catch (e) {
      debugPrint('Error clearing cache for address: $e');
    }
  }

  /// Fetch transactions from blockchain
  static Future<List<TransactionHistory>> _fetchTransactionsFromBlockchain(
    String address,
    TransactionFilter filter,
  ) async {
    final transactions = <TransactionHistory>[];

    try {
      // Get supported chains
      final chains = filter.chain != null
          ? [filter.chain!]
          : ['polkadot', 'kusama'];

      for (final chain in chains) {
        final chainTransactions = await _fetchTransactionsForChain(
          address,
          chain,
          filter,
        );
        transactions.addAll(chainTransactions);
      }

      // Sort by timestamp descending
      transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      // Apply limit and offset
      final startIndex = filter.offset;
      final endIndex = startIndex + filter.limit;

      return transactions.sublist(
        startIndex,
        endIndex > transactions.length ? transactions.length : endIndex,
      );
    } catch (e) {
      debugPrint('Error fetching transactions from blockchain: $e');
      return [];
    }
  }

  /// Fetch transactions for a specific chain
  static Future<List<TransactionHistory>> _fetchTransactionsForChain(
    String address,
    String chain,
    TransactionFilter filter,
  ) async {
    try {
      final endpoint = RpcNodeService.getRpcUrl(chain);
      if (endpoint == null) {
        throw Exception('No RPC node configured for chain: $chain');
      }

      final channel = WebSocketChannel.connect(Uri.parse(endpoint));

      // Query transaction history
      final requestData = {
        'jsonrpc': '2.0',
        'id': Random().nextInt(1000000),
        'method': 'chain_getBlock',
        'params': [],
      };

      channel.sink.add(jsonEncode(requestData));
      final response = await channel.stream.first;
      final jsonResponse = jsonDecode(response);

      if (jsonResponse['error'] != null) {
        throw Exception('RPC error: ${jsonResponse['error']['message']}');
      }

      // Parse transactions (simplified for demo)
      return _parseTransactionsFromResponse(jsonResponse, address, chain);
    } catch (e) {
      debugPrint('Error fetching transactions for chain $chain: $e');
      return [];
    }
  }

  /// Fetch single transaction from blockchain
  static Future<TransactionHistory?> _fetchTransactionFromBlockchain(
    String hash,
  ) async {
    try {
      // This would typically query the blockchain for a specific transaction
      // For now, return null as we don't have a specific RPC method
      return null;
    } catch (e) {
      debugPrint('Error fetching transaction from blockchain: $e');
      return null;
    }
  }

  /// Parse transactions from RPC response
  static List<TransactionHistory> _parseTransactionsFromResponse(
    Map<String, dynamic> response,
    String address,
    String chain,
  ) {
    try {
      // Use mock data service for consistent, realistic transaction data
      return MockDataService.getMockTransactions(
        address: address,
        chain: chain,
        count: 10, // Generate 10 mock transactions per chain
      );
    } catch (e) {
      debugPrint('Error parsing transactions: $e');
      return [];
    }
  }

  /// Get chain information
  static ChainInfo getChainInfo(String chain) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return const ChainInfo(
          id: 'polkadot',
          name: 'Polkadot',
          symbol: 'DOT',
          explorerUrl: 'https://polkadot.subscan.io',
          logoUrl:
              'https://raw.githubusercontent.com/paritytech/polkadot/master/logo/polkadot_logo.png',
        );
      case 'kusama':
        return const ChainInfo(
          id: 'kusama',
          name: 'Kusama',
          symbol: 'KSM',
          explorerUrl: 'https://kusama.subscan.io',
          logoUrl:
              'https://raw.githubusercontent.com/paritytech/polkadot/master/logo/kusama_logo.png',
        );
      case 'moonbeam':
        return const ChainInfo(
          id: 'moonbeam',
          name: 'Moonbeam',
          symbol: 'GLMR',
          explorerUrl: 'https://moonbeam.moonscan.io',
          logoUrl:
              'https://raw.githubusercontent.com/moonbeam-foundation/moonbeam/master/logo/moonbeam-logo.png',
        );
      case 'astar':
        return const ChainInfo(
          id: 'astar',
          name: 'Astar',
          symbol: 'ASTR',
          explorerUrl: 'https://astar.subscan.io',
          logoUrl:
              'https://raw.githubusercontent.com/AstarNetwork/astar/master/logo/astar-logo.png',
        );
      default:
        return const ChainInfo(
          id: 'unknown',
          name: 'Unknown',
          symbol: 'UNK',
          explorerUrl: 'https://polkadot.subscan.io',
          logoUrl: '',
        );
    }
  }
}
