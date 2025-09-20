import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/services/transaction_history_service.dart';
import 'package:kifepool/core/services/mock_data_service.dart';

void main() {
  group('Transaction History Tests', () {
    test('TransactionFilter copyWith works correctly', () {
      const originalFilter = TransactionFilter(
        chain: 'polkadot',
        type: TransactionType.transfer,
        status: TransactionStatus.confirmed,
        limit: 50,
      );

      final updatedFilter = originalFilter.copyWith(
        chain: 'kusama',
        type: TransactionType.staking,
      );

      expect(updatedFilter.chain, 'kusama');
      expect(updatedFilter.type, TransactionType.staking);
      expect(
        updatedFilter.status,
        TransactionStatus.confirmed,
      ); // Should remain unchanged
      expect(updatedFilter.limit, 50); // Should remain unchanged
    });

    test('TransactionFilter fromJson and toJson work correctly', () {
      const filter = TransactionFilter(
        chain: 'polkadot',
        type: TransactionType.transfer,
        status: TransactionStatus.confirmed,
        direction: TransactionDirection.incoming,
        limit: 25,
        offset: 10,
      );

      final json = filter.toJson();
      final restoredFilter = TransactionFilter.fromJson(json);

      expect(restoredFilter.chain, filter.chain);
      expect(restoredFilter.type, filter.type);
      expect(restoredFilter.status, filter.status);
      expect(restoredFilter.direction, filter.direction);
      expect(restoredFilter.limit, filter.limit);
      expect(restoredFilter.offset, filter.offset);
    });

    test('TransactionHistory model works correctly', () {
      final transaction = TransactionHistory()
        ..hash = '0x1234567890abcdef'
        ..blockNumber = 1000000
        ..chain = 'polkadot'
        ..type = TransactionType.transfer
        ..status = TransactionStatus.confirmed
        ..direction = TransactionDirection.incoming
        ..fromAddress = '0xfrom123'
        ..toAddress = '0xto456'
        ..amount = '100.0'
        ..tokenSymbol = 'DOT'
        ..gasFee = '0.1'
        ..gasUsed = '50000'
        ..timestamp = DateTime.now()
        ..blockTimestamp = DateTime.now()
        ..transactionIndex = 0
        ..nonce = 1
        ..explorerUrl =
            'https://polkadot.subscan.io/extrinsic/0x1234567890abcdef'
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      expect(transaction.hash, '0x1234567890abcdef');
      expect(transaction.chain, 'polkadot');
      expect(transaction.type, TransactionType.transfer);
      expect(transaction.status, TransactionStatus.confirmed);
      expect(transaction.direction, TransactionDirection.incoming);
    });

    test('ChainInfo model works correctly', () {
      const chainInfo = ChainInfo(
        id: 'polkadot',
        name: 'Polkadot',
        symbol: 'DOT',
        explorerUrl: 'https://polkadot.subscan.io',
        logoUrl: 'https://example.com/logo.png',
        isTestnet: false,
      );

      expect(chainInfo.id, 'polkadot');
      expect(chainInfo.name, 'Polkadot');
      expect(chainInfo.symbol, 'DOT');
      expect(chainInfo.explorerUrl, 'https://polkadot.subscan.io');
      expect(chainInfo.isTestnet, false);
    });

    test('TransactionStats model works correctly', () {
      const stats = TransactionStats(
        totalTransactions: 100,
        pendingTransactions: 5,
        confirmedTransactions: 90,
        failedTransactions: 5,
        transactionsByChain: {'polkadot': 60, 'kusama': 40},
        transactionsByType: {'transfer': 80, 'staking': 20},
        totalVolume: '1000.0',
        totalFees: '10.0',
      );

      expect(stats.totalTransactions, 100);
      expect(stats.pendingTransactions, 5);
      expect(stats.confirmedTransactions, 90);
      expect(stats.failedTransactions, 5);
      expect(stats.transactionsByChain['polkadot'], 60);
      expect(stats.transactionsByChain['kusama'], 40);
      expect(stats.transactionsByType['transfer'], 80);
      expect(stats.transactionsByType['staking'], 20);
      expect(stats.totalVolume, '1000.0');
      expect(stats.totalFees, '10.0');
    });

    test(
      'TransactionHistoryService.getChainInfo returns correct chain info',
      () {
        final polkadotInfo = TransactionHistoryService.getChainInfo('polkadot');
        expect(polkadotInfo.id, 'polkadot');
        expect(polkadotInfo.name, 'Polkadot');
        expect(polkadotInfo.symbol, 'DOT');

        final kusamaInfo = TransactionHistoryService.getChainInfo('kusama');
        expect(kusamaInfo.id, 'kusama');
        expect(kusamaInfo.name, 'Kusama');
        expect(kusamaInfo.symbol, 'KSM');

        final unknownInfo = TransactionHistoryService.getChainInfo('unknown');
        expect(unknownInfo.id, 'unknown');
        expect(unknownInfo.name, 'Unknown');
        expect(unknownInfo.symbol, 'UNK');
      },
    );

    test('TransactionHistoryResult model works correctly', () {
      final transactions = [
        TransactionHistory()
          ..hash = '0x123'
          ..chain = 'polkadot'
          ..type = TransactionType.transfer
          ..status = TransactionStatus.confirmed
          ..direction = TransactionDirection.incoming
          ..fromAddress = '0xfrom'
          ..toAddress = '0xto'
          ..amount = '100.0'
          ..tokenSymbol = 'DOT'
          ..gasFee = '0.1'
          ..gasUsed = '50000'
          ..timestamp = DateTime.now()
          ..blockTimestamp = DateTime.now()
          ..transactionIndex = 0
          ..nonce = 1
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now(),
      ];

      final result = TransactionHistoryResult(
        transactions: transactions,
        totalCount: transactions.length,
        hasMore: false,
        nextCursor: null,
      );

      expect(result.transactions.length, 1);
      expect(result.transactions.first.hash, '0x123');
      expect(result.transactions.first.chain, 'polkadot');
      expect(result.transactions.first.type, TransactionType.transfer);
      expect(result.totalCount, 1);
      expect(result.hasMore, false);
      expect(result.nextCursor, null);
    });

    test('MockDataService generates realistic transaction data', () {
      final mockTransactions = MockDataService.getMockTransactions(
        address: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        chain: 'polkadot',
        count: 5,
      );

      expect(mockTransactions.length, 5);

      for (final transaction in mockTransactions) {
        expect(transaction.hash, startsWith('0x'));
        expect(transaction.hash.length, 66); // 0x + 64 hex chars
        expect(transaction.chain, 'polkadot');
        expect(transaction.tokenSymbol, 'DOT');
        expect(transaction.amount, isNotEmpty);
        expect(transaction.gasFee, isNotEmpty);
        expect(transaction.explorerUrl, contains('polkadot.subscan.io'));
        expect(transaction.fromAddress, isNotEmpty);
        expect(transaction.toAddress, isNotEmpty);
      }
    });

    test('MockDataService generates realistic transaction stats', () {
      final mockStats = MockDataService.getMockTransactionStats();

      expect(mockStats.totalTransactions, greaterThan(0));
      expect(
        mockStats.totalTransactions,
        equals(100),
      ); // We generate exactly 100 transactions
      expect(
        mockStats.totalTransactions,
        greaterThanOrEqualTo(
          mockStats.pendingTransactions +
              mockStats.confirmedTransactions +
              mockStats.failedTransactions,
        ),
      );
      expect(mockStats.transactionsByChain.isNotEmpty, true);
      expect(mockStats.transactionsByType.isNotEmpty, true);
      expect(mockStats.totalVolume, isNotEmpty);
      expect(mockStats.totalFees, isNotEmpty);
    });
  });
}
