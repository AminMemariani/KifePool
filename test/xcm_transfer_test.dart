import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';

void main() {
  group('XCM Transfer Tests', () {
    test('XcmTransferRequest model works correctly', () {
      const request = XcmTransferRequest(
        sourceChain: 'polkadot',
        destinationChain: 'moonbeam',
        type: XcmTransferType.token,
        sourceAddress: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        destinationAddress: '0x1234567890123456789012345678901234567890',
        assetSymbol: 'DOT',
        amount: '10.0',
        memo: 'Test transfer',
      );

      expect(request.sourceChain, 'polkadot');
      expect(request.destinationChain, 'moonbeam');
      expect(request.type, XcmTransferType.token);
      expect(request.assetSymbol, 'DOT');
      expect(request.amount, '10.0');
      expect(request.memo, 'Test transfer');
    });

    test('XcmTransferResult model works correctly', () {
      const result = XcmTransferResult(
        success: true,
        transferId: 'xcm_1234567890_1234',
        status: XcmTransferStatus.initiated,
        sourceTransactionHash: '0xabcdef1234567890',
        xcmMessageHash: '0x1234567890abcdef',
      );

      expect(result.success, true);
      expect(result.transferId, 'xcm_1234567890_1234');
      expect(result.status, XcmTransferStatus.initiated);
      expect(result.sourceTransactionHash, '0xabcdef1234567890');
      expect(result.xcmMessageHash, '0x1234567890abcdef');
    });

    test('XcmTransferProgress model works correctly', () {
      final progress = XcmTransferProgress(
        transferId: 'xcm_1234567890_1234',
        status: XcmTransferStatus.processing,
        currentStep: 2,
        totalSteps: 4,
        currentStepDescription: 'XCM message processing',
        progressPercentage: 0.5,
        lastUpdated: DateTime.now(),
      );

      expect(progress.transferId, 'xcm_1234567890_1234');
      expect(progress.status, XcmTransferStatus.processing);
      expect(progress.currentStep, 2);
      expect(progress.totalSteps, 4);
      expect(progress.progressPercentage, 0.5);
    });

    test('XcmChainInfo model works correctly', () {
      const chainInfo = XcmChainInfo(
        id: 'polkadot',
        name: 'Polkadot',
        symbol: 'DOT',
        rpcUrl: 'wss://rpc.polkadot.io',
        explorerUrl: 'https://polkadot.subscan.io',
        isRelayChain: true,
        supportedAssets: ['DOT'],
        assetSymbols: {'0': 'DOT'},
      );

      expect(chainInfo.id, 'polkadot');
      expect(chainInfo.name, 'Polkadot');
      expect(chainInfo.symbol, 'DOT');
      expect(chainInfo.isRelayChain, true);
      expect(chainInfo.supportedAssets, ['DOT']);
      expect(chainInfo.assetSymbols['0'], 'DOT');
    });

    test('XcmAssetInfo model works correctly', () {
      const assetInfo = XcmAssetInfo(
        symbol: 'DOT',
        assetId: '0',
        chain: 'polkadot',
        decimals: '10',
        balance: '100.0',
        isNative: true,
      );

      expect(assetInfo.symbol, 'DOT');
      expect(assetInfo.assetId, '0');
      expect(assetInfo.chain, 'polkadot');
      expect(assetInfo.decimals, '10');
      expect(assetInfo.balance, '100.0');
      expect(assetInfo.isNative, true);
    });

    test('XcmTransferValidation model works correctly', () {
      const validation = XcmTransferValidation(
        isValid: true,
        errors: [],
        estimatedFee: '0.1',
        estimatedTime: '2-5 minutes',
        isSupported: true,
      );

      expect(validation.isValid, true);
      expect(validation.errors, []);
      expect(validation.estimatedFee, '0.1');
      expect(validation.estimatedTime, '2-5 minutes');
      expect(validation.isSupported, true);
    });

    test('XcmTransferStats model works correctly', () {
      const stats = XcmTransferStats(
        totalTransfers: 50,
        successfulTransfers: 45,
        failedTransfers: 3,
        pendingTransfers: 2,
        transfersByChain: {'polkadot': 20, 'moonbeam': 15, 'astar': 15},
        transfersByType: {'token': 40, 'nft': 10},
        totalVolume: '1000.0',
        totalFees: '50.0',
      );

      expect(stats.totalTransfers, 50);
      expect(stats.successfulTransfers, 45);
      expect(stats.failedTransfers, 3);
      expect(stats.pendingTransfers, 2);
      expect(stats.transfersByChain['polkadot'], 20);
      expect(stats.transfersByType['token'], 40);
      expect(stats.totalVolume, '1000.0');
      expect(stats.totalFees, '50.0');
    });

    test(
      'XcmTransferService.getSupportedChains returns correct chains',
      () async {
        final chains = await XcmTransferService.getSupportedChains();

        expect(chains.length, greaterThan(0));

        final polkadot = chains.firstWhere((c) => c.id == 'polkadot');
        expect(polkadot.name, 'Polkadot');
        expect(polkadot.symbol, 'DOT');
        expect(polkadot.isRelayChain, true);
        expect(polkadot.supportedAssets, contains('DOT'));
      },
    );

    test('XcmTransfer model works correctly', () {
      final transfer = XcmTransfer()
        ..transferId = 'xcm_1234567890_1234'
        ..sourceChain = 'polkadot'
        ..destinationChain = 'moonbeam'
        ..type = XcmTransferType.token
        ..status = XcmTransferStatus.initiated
        ..direction = XcmTransferDirection.outbound
        ..sourceAddress = '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY'
        ..destinationAddress = '0x1234567890123456789012345678901234567890'
        ..assetSymbol = 'DOT'
        ..amount = '10.0'
        ..transferFee = '0.1'
        ..xcmFee = '0.05'
        ..timestamp = DateTime.now()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      expect(transfer.transferId, 'xcm_1234567890_1234');
      expect(transfer.sourceChain, 'polkadot');
      expect(transfer.destinationChain, 'moonbeam');
      expect(transfer.type, XcmTransferType.token);
      expect(transfer.status, XcmTransferStatus.initiated);
      expect(transfer.direction, XcmTransferDirection.outbound);
      expect(transfer.assetSymbol, 'DOT');
      expect(transfer.amount, '10.0');
    });
  });
}
