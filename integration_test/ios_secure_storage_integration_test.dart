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
        print('✅ Successfully stored private key');

        // Test retrieving private key
        final retrieved = await SecureStorageService.getPrivateKey(testAddress);
        expect(retrieved, equals(testPrivateKey));
        print('✅ Successfully retrieved private key');

        // Clean up
        await SecureStorageService.deletePrivateKey(testAddress);
        print('✅ Test passed: iOS secure storage is working correctly');
      } catch (e) {
        print('❌ Test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');

        // Check for specific iOS Keychain errors
        if (e.toString().contains('-34018') ||
            e.toString().contains('entitlement') ||
            e.toString().contains('Keychain')) {
          print('\n🔍 DIAGNOSIS: iOS Keychain entitlement issue');
          print(
            '   Error code -34018 means "A required entitlement isn\'t present"',
          );
          print('\n   Solutions to try:');
          print('   1. Verify ios/Runner/Runner.entitlements exists');
          print('   2. Open ios/Runner.xcworkspace in Xcode');
          print('   3. Select Runner target → Signing & Capabilities');
          print('   4. Ensure "Keychain Sharing" capability is enabled');
          print('   5. Clean build: flutter clean && flutter pub get');
          print('   6. Rebuild: flutter run');
          print(
            '   7. If still failing, check CODE_SIGN_ENTITLEMENTS in build settings',
          );
        }

        rethrow;
      }
    });

    testWidgets('should create wallet with 12-word mnemonic on iOS', (
      tester,
    ) async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 12);
        expect(mnemonic.split(' ').length, equals(12));
        print('✅ Generated 12-word mnemonic');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'iOS Test Wallet 12',
          chain: 'polkadot',
        );

        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        print('✅ Wallet created successfully');
        print('   Address: ${result.address}');

        // Verify private key was stored
        final storedKey = await SecureStorageService.getPrivateKey(
          result.address,
        );
        expect(storedKey, isNotEmpty);
        print('✅ Private key stored and retrieved successfully');
      } catch (e) {
        print('❌ Wallet creation test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        rethrow;
      }
    });

    testWidgets('should create wallet with 24-word mnemonic on iOS', (
      tester,
    ) async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 24);
        expect(mnemonic.split(' ').length, equals(24));
        print('✅ Generated 24-word mnemonic');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'iOS Test Wallet 24',
          chain: 'polkadot',
        );

        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        print('✅ Wallet created successfully');
        print('   Address: ${result.address}');

        // Verify private key was stored
        final storedKey = await SecureStorageService.getPrivateKey(
          result.address,
        );
        expect(storedKey, isNotEmpty);
        print('✅ Private key stored and retrieved successfully');
      } catch (e) {
        print('❌ Wallet creation test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        rethrow;
      }
    });
  });
}
