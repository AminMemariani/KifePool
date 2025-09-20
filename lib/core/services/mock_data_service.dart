import 'dart:math';
import 'package:kifepool/core/models/transaction_history_models.dart';

/// Service for providing mock transaction data
class MockDataService {
  static final Random _random = Random();

  /// Get mock transactions for testing and development
  static List<TransactionHistory> getMockTransactions({
    String? address,
    String? chain,
    int count = 20,
  }) {
    final transactions = <TransactionHistory>[];
    final now = DateTime.now();

    // Mock addresses
    final mockAddresses = [
      '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
      '5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty',
      '5DAAnrj7VHTznn2AWBemMuyBwZWs6FNFjdyVXUeYum3PTXFy',
      '5HGjWAeFDfFCWPsjFQdVV2Msvz2XtMktvgocEYSj2UaUYVq',
      '5CiPPseXPECbkjWCa6MnjNokrgYjMqmKndv2rSnekmSK2Dj',
    ];

    // Mock chains
    final chains = chain != null
        ? [chain]
        : ['polkadot', 'kusama', 'moonbeam', 'astar'];

    for (int i = 0; i < count; i++) {
      final selectedChain = chains[_random.nextInt(chains.length)];
      final fromAddress =
          address ?? mockAddresses[_random.nextInt(mockAddresses.length)];
      final toAddress = mockAddresses[_random.nextInt(mockAddresses.length)];
      final transactionType = TransactionType
          .values[_random.nextInt(TransactionType.values.length)];
      final direction = _random.nextBool()
          ? TransactionDirection.incoming
          : TransactionDirection.outgoing;
      final status = _getRandomStatus();

      final transaction = TransactionHistory()
        ..hash = _generateMockHash()
        ..blockNumber = 1000000 + i
        ..chain = selectedChain
        ..type = transactionType
        ..status = status
        ..direction = direction
        ..fromAddress = direction == TransactionDirection.incoming
            ? toAddress
            : fromAddress
        ..toAddress = direction == TransactionDirection.incoming
            ? fromAddress
            : toAddress
        ..amount = _generateMockAmount(transactionType)
        ..tokenSymbol = _getTokenSymbol(selectedChain)
        ..gasFee = _generateMockGasFee()
        ..gasUsed = _generateMockGasUsed()
        ..timestamp = now.subtract(Duration(hours: i * 2))
        ..blockTimestamp = now.subtract(Duration(hours: i * 2))
        ..transactionIndex = i % 10
        ..nonce = _random.nextInt(1000)
        ..explorerUrl = _getExplorerUrl(selectedChain, _generateMockHash())
        ..createdAt = now.subtract(Duration(hours: i * 2))
        ..updatedAt = now.subtract(Duration(hours: i * 2));

      transactions.add(transaction);
    }

    return transactions;
  }

  /// Get mock transaction statistics
  static TransactionStats getMockTransactionStats() {
    final mockTransactions = getMockTransactions(count: 100);

    final totalTransactions = mockTransactions.length;
    final pendingTransactions = mockTransactions
        .where((t) => t.status == TransactionStatus.pending)
        .length;
    final confirmedTransactions = mockTransactions
        .where((t) => t.status == TransactionStatus.confirmed)
        .length;
    final failedTransactions = mockTransactions
        .where((t) => t.status == TransactionStatus.failed)
        .length;

    final transactionsByChain = <String, int>{};
    final transactionsByType = <String, int>{};
    double totalVolume = 0;
    double totalFees = 0;

    for (final transaction in mockTransactions) {
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
  }

  /// Generate mock transaction hash
  static String _generateMockHash() {
    final chars = '0123456789abcdef';
    final hash = StringBuffer('0x');
    for (int i = 0; i < 64; i++) {
      hash.write(chars[_random.nextInt(chars.length)]);
    }
    return hash.toString();
  }

  /// Generate mock amount based on transaction type
  static String _generateMockAmount(TransactionType type) {
    switch (type) {
      case TransactionType.transfer:
        return (_random.nextDouble() * 1000 + 1).toStringAsFixed(4);
      case TransactionType.staking:
        return (_random.nextDouble() * 100 + 1).toStringAsFixed(4);
      case TransactionType.unstaking:
        return (_random.nextDouble() * 100 + 1).toStringAsFixed(4);
      case TransactionType.reward:
        return (_random.nextDouble() * 10 + 0.1).toStringAsFixed(4);
      case TransactionType.nftTransfer:
        return '1.0'; // NFTs are typically 1 unit
      case TransactionType.crossChain:
        return (_random.nextDouble() * 500 + 1).toStringAsFixed(4);
      case TransactionType.contractCall:
        return (_random.nextDouble() * 50 + 0.1).toStringAsFixed(4);
      case TransactionType.other:
        return (_random.nextDouble() * 100 + 1).toStringAsFixed(4);
    }
  }

  /// Generate mock gas fee
  static String _generateMockGasFee() {
    return (_random.nextDouble() * 0.1 + 0.001).toStringAsFixed(6);
  }

  /// Generate mock gas used
  static String _generateMockGasUsed() {
    return (_random.nextInt(100000) + 50000).toString();
  }

  /// Get random transaction status
  static TransactionStatus _getRandomStatus() {
    final statuses = TransactionStatus.values;
    // Weight towards confirmed transactions
    final weights = [
      0.8,
      0.15,
      0.04,
      0.01,
    ]; // confirmed, pending, failed, cancelled
    final random = _random.nextDouble();

    double cumulative = 0;
    for (int i = 0; i < statuses.length; i++) {
      cumulative += weights[i];
      if (random <= cumulative) {
        return statuses[i];
      }
    }
    return TransactionStatus.confirmed;
  }

  /// Get token symbol for chain
  static String _getTokenSymbol(String chain) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return 'DOT';
      case 'kusama':
        return 'KSM';
      case 'moonbeam':
        return 'GLMR';
      case 'astar':
        return 'ASTR';
      default:
        return 'TOKEN';
    }
  }

  /// Get explorer URL for chain
  static String _getExplorerUrl(String chain, String hash) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return 'https://polkadot.subscan.io/extrinsic/$hash';
      case 'kusama':
        return 'https://kusama.subscan.io/extrinsic/$hash';
      case 'moonbeam':
        return 'https://moonbeam.moonscan.io/tx/$hash';
      case 'astar':
        return 'https://astar.subscan.io/extrinsic/$hash';
      default:
        return 'https://polkadot.subscan.io/extrinsic/$hash';
    }
  }
}
