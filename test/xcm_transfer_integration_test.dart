import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kifepool/core/app.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/services/database_service.dart';
import 'test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  initializeTestEnvironment();

  group('XCM Transfer Integration Tests', () {
    setUpAll(() async {
      await DatabaseService.initialize();
    });

    testWidgets('Cross-chain transfer flow works end-to-end', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Verify we're on the cross-chain transfer screen
      expect(find.text('Cross-Chain Transfer'), findsOneWidget);

      // Check that supported chains are loaded
      expect(find.text('Source Chain'), findsOneWidget);
      expect(find.text('Destination Chain'), findsOneWidget);

      // Verify transfer type selector is present
      expect(find.text('Transfer Type'), findsOneWidget);
      expect(find.text('Token'), findsOneWidget);
      expect(find.text('NFT'), findsOneWidget);

      // Check that amount input is present
      expect(find.text('Amount'), findsOneWidget);

      // Check that destination address input is present
      expect(find.text('Destination Address'), findsOneWidget);

      // Check that memo input is present
      expect(find.text('Memo (Optional)'), findsOneWidget);

      // Check that transfer button is present
      expect(find.text('Initiate Cross-Chain Transfer'), findsOneWidget);
    });

    testWidgets('Transfer history screen displays correctly', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Tap on history button
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();

      // Verify we're on the transfer history screen
      expect(find.text('Cross-Chain Transfer History'), findsOneWidget);

      // Check that filter button is present
      expect(find.byIcon(Icons.filter_list), findsOneWidget);

      // Check for empty state message
      expect(
        find.text('Please select a wallet to view transfer history'),
        findsOneWidget,
      );
    });

    testWidgets('Chain selector works correctly', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Tap on source chain dropdown
      await tester.tap(find.text('Source Chain'));
      await tester.pumpAndSettle();

      // Verify chain options are available
      expect(find.text('Polkadot'), findsOneWidget);
      expect(find.text('Kusama'), findsOneWidget);
      expect(find.text('Moonbeam'), findsOneWidget);
      expect(find.text('Astar'), findsOneWidget);
      expect(find.text('Acala'), findsOneWidget);

      // Select a chain
      await tester.tap(find.text('Polkadot'));
      await tester.pumpAndSettle();

      // Verify chain is selected
      expect(find.text('Polkadot'), findsOneWidget);
    });

    testWidgets('Transfer type selection works', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Select NFT transfer type
      await tester.tap(find.text('NFT'));
      await tester.pumpAndSettle();

      // Verify NFT is selected
      expect(find.text('NFT'), findsOneWidget);
    });

    testWidgets('Form validation works correctly', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Try to submit form without filling required fields
      await tester.tap(find.text('Initiate Cross-Chain Transfer'));
      await tester.pumpAndSettle();

      // Verify validation messages appear
      expect(find.text('Please enter an amount'), findsOneWidget);
      expect(find.text('Please enter a destination address'), findsOneWidget);
    });

    testWidgets('Transfer progress modal displays correctly', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(
        find.byType(TextFormField).at(0),
        '10.0',
      ); // Amount
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
      ); // Destination
      await tester.pumpAndSettle();

      // Submit the form
      await tester.tap(find.text('Initiate Cross-Chain Transfer'));
      await tester.pumpAndSettle();

      // Verify progress modal appears
      expect(find.text('Transfer Progress'), findsOneWidget);
      expect(find.text('Transfer initiated'), findsOneWidget);
    });

    testWidgets('Filter dialog works correctly', (tester) async {
      // Start the app
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      // Navigate to cross-chain transfer tab
      await tester.tap(find.text('Cross-Chain'));
      await tester.pumpAndSettle();

      // Navigate to history
      await tester.tap(find.byIcon(Icons.history));
      await tester.pumpAndSettle();

      // Tap filter button
      await tester.tap(find.byIcon(Icons.filter_list));
      await tester.pumpAndSettle();

      // Verify filter dialog appears
      expect(find.text('Filter Transfers'), findsOneWidget);
      expect(find.text('Type'), findsOneWidget);
      expect(find.text('Status'), findsOneWidget);
      expect(find.text('Chain'), findsOneWidget);

      // Test filter options
      await tester.tap(find.text('Type'));
      await tester.pumpAndSettle();
      expect(find.text('TOKEN'), findsOneWidget);
      expect(find.text('NFT'), findsOneWidget);

      // Close dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
    });
  });

  group('XCM Transfer Service Integration Tests', () {
    setUpAll(() async {
      await DatabaseService.initialize();
    });

    test('XCM transfer service can get supported chains', () async {
      final chains = await XcmTransferService.getSupportedChains();

      expect(chains.length, greaterThan(0));
      expect(chains.any((c) => c.id == 'polkadot'), isTrue);
      expect(chains.any((c) => c.id == 'kusama'), isTrue);
    });

    test('XCM transfer service can validate transfers', () async {
      final request = XcmTransferRequest(
        sourceChain: 'polkadot',
        destinationChain: 'moonbeam',
        type: XcmTransferType.token,
        sourceAddress: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        destinationAddress: '0x1234567890123456789012345678901234567890',
        assetSymbol: 'DOT',
        amount: '10.0',
      );

      final validation = await XcmTransferService.validateTransfer(request);

      expect(validation, isNotNull);
      expect(validation.isValid, isTrue);
      expect(validation.errors, isEmpty);
      expect(validation.estimatedFee, isNotNull);
      expect(validation.estimatedTime, isNotNull);
    });

    test('XCM transfer service can initiate transfers', () async {
      final request = XcmTransferRequest(
        sourceChain: 'polkadot',
        destinationChain: 'moonbeam',
        type: XcmTransferType.token,
        sourceAddress: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        destinationAddress: '0x1234567890123456789012345678901234567890',
        assetSymbol: 'DOT',
        amount: '10.0',
      );

      final result = await XcmTransferService.initiateTransfer(request);

      expect(result, isNotNull);
      expect(result.success, isTrue);
      expect(result.transferId, isNotNull);
      expect(result.status, XcmTransferStatus.initiated);
    });

    test('XCM transfer service can track progress', () async {
      // First initiate a transfer
      final request = XcmTransferRequest(
        sourceChain: 'polkadot',
        destinationChain: 'moonbeam',
        type: XcmTransferType.token,
        sourceAddress: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        destinationAddress: '0x1234567890123456789012345678901234567890',
        assetSymbol: 'DOT',
        amount: '10.0',
      );

      final result = await XcmTransferService.initiateTransfer(request);
      expect(result.success, isTrue);

      // Wait a bit for processing to start
      await Future.delayed(const Duration(seconds: 1));

      // Check progress
      final progress = await XcmTransferService.getTransferProgress(
        result.transferId!,
      );

      expect(progress, isNotNull);
      expect(progress!.transferId, result.transferId);
      expect(
        progress.status,
        isIn([XcmTransferStatus.initiated, XcmTransferStatus.processing]),
      );
      expect(progress.currentStep, greaterThan(0));
      expect(progress.totalSteps, equals(4));
    });

    test('XCM transfer service can get transfer history', () async {
      final address = '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY';

      final transfers = await XcmTransferService.getTransferHistory(
        address: address,
      );

      expect(transfers, isA<List<XcmTransfer>>());
      // Should have at least the transfers we created in previous tests
    });

    test('XCM transfer service can get transfer stats', () async {
      final address = '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY';

      final stats = await XcmTransferService.getTransferStats(address);

      expect(stats, isNotNull);
      expect(stats.totalTransfers, greaterThanOrEqualTo(0));
      expect(stats.successfulTransfers, greaterThanOrEqualTo(0));
      expect(stats.failedTransfers, greaterThanOrEqualTo(0));
      expect(stats.pendingTransfers, greaterThanOrEqualTo(0));
    });
  });
}
