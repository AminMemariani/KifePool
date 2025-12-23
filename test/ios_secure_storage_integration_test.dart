import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/services/wallet_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('iOS Secure Storage Integration Tests', () {
    testWidgets('should store and retrieve private key on iOS', (tester) async {
      const testAddress = 'ios_test_address_123';
      const testPrivateKey = 'ios_test_private_key_456';

      try {
        // Test storing private key
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        debugPrint('✅ Successfully stored private key');

        // Test retrieving private key
        final retrieved = await SecureStorageService.getPrivateKey(testAddress);
        expect(retrieved, equals(testPrivateKey));
        debugPrint('✅ Successfully retrieved private key');

        // Clean up
        await SecureStorageService.deletePrivateKey(testAddress);
        debugPrint('✅ Test passed: iOS secure storage is working correctly');
      } catch (e) {
        debugPrint('❌ Test failed: $e');
        debugPrint('Error type: ${e.runtimeType}');
        debugPrint('Error details: ${e.toString()}');

        // Check for specific iOS Keychain errors
        if (e.toString().contains('-34018') ||
            e.toString().contains('entitlement') ||
            e.toString().contains('Keychain')) {
          debugPrint('\n🔍 DIAGNOSIS: iOS Keychain entitlement issue');
          debugPrint(
            '   Error code -34018 means "A required entitlement isn\'t present"',
          );
          debugPrint('\n   Solutions to try:');
          debugPrint('   1. Verify ios/Runner/Runner.entitlements exists');
          debugPrint('   2. Open ios/Runner.xcworkspace in Xcode');
          debugPrint('   3. Select Runner target → Signing & Capabilities');
          debugPrint('   4. Ensure "Keychain Sharing" capability is enabled');
          debugPrint('   5. Clean build: flutter clean && flutter pub get');
          debugPrint('   6. Rebuild: flutter run');
          debugPrint(
            '   7. If still failing, check CODE_SIGN_ENTITLEMENTS in build settings',
          );
        }

        rethrow;
      }
    });

    testWidgets('should create wallet with 12-word mnemonic on iOS', (tester) async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 12);
        expect(mnemonic.split(' ').length, equals(12));
        debugPrint('✅ Generated 12-word mnemonic');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'iOS Test Wallet 12',
          chain: 'polkadot',
        );

        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        debugPrint('✅ Wallet created successfully');
        debugPrint('   Address: ${result.address}');

        // Verify private key was stored
        final storedKey = await SecureStorageService.getPrivateKey(result.address);
        expect(storedKey, isNotEmpty);
        debugPrint('✅ Private key stored and retrieved successfully');
      } catch (e) {
        debugPrint('❌ Wallet creation test failed: $e');
        debugPrint('Error type: ${e.runtimeType}');
        debugPrint('Error details: ${e.toString()}');
        rethrow;
      }
    });

    testWidgets('should create wallet with 24-word mnemonic on iOS', (tester) async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 24);
        expect(mnemonic.split(' ').length, equals(24));
        debugPrint('✅ Generated 24-word mnemonic');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'iOS Test Wallet 24',
          chain: 'polkadot',
        );

        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        debugPrint('✅ Wallet created successfully');
        debugPrint('   Address: ${result.address}');

        // Verify private key was stored
        final storedKey = await SecureStorageService.getPrivateKey(result.address);
        expect(storedKey, isNotEmpty);
        debugPrint('✅ Private key stored and retrieved successfully');
      } catch (e) {
        debugPrint('❌ Wallet creation test failed: $e');
        debugPrint('Error type: ${e.runtimeType}');
        debugPrint('Error details: ${e.toString()}');
        rethrow;
      }
    });
  });
}

