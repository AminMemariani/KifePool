import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/services/wallet_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Secure Storage Integration Tests', () {
    testWidgets('should store and retrieve private key', (tester) async {
      const testAddress = 'test_address_123';
      const testPrivateKey = 'test_private_key_456';

      try {
        print('🔍 Testing secure storage...');

        // Test storing private key
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        print('✅ Successfully stored private key');

        // Test retrieving private key
        final retrieved = await SecureStorageService.getPrivateKey(testAddress);
        expect(retrieved, equals(testPrivateKey));
        print('✅ Successfully retrieved private key');

        // Clean up
        await SecureStorageService.deletePrivateKey(testAddress);
        print('✅ Test PASSED: Secure storage is working correctly');
      } catch (e) {
        print('❌ Test FAILED: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');

        // Check for specific iOS Keychain errors
        if (e.toString().contains('-34018') ||
            e.toString().contains('entitlement') ||
            e.toString().contains('Keychain')) {
          print('\n🔍 DIAGNOSIS: iOS Keychain entitlement issue detected');
          print(
            '   Error code -34018 means "A required entitlement isn\'t present"',
          );
          print('\n   ✅ Verify these fixes are applied:');
          print('   1. ios/Runner/Runner.entitlements exists');
          print('   2. CODE_SIGN_ENTITLEMENTS is set in Xcode project');
          print('   3. Keychain Sharing capability is enabled in Xcode');
          print('\n   📝 Next steps:');
          print('   1. Open ios/Runner.xcworkspace in Xcode');
          print('   2. Select Runner target → Signing & Capabilities');
          print('   3. Add "Keychain Sharing" capability if not present');
          print('   4. Clean build: flutter clean && flutter pub get');
          print('   5. Rebuild: flutter run');
        }

        rethrow;
      }
    });

    testWidgets('should create wallet with 12-word mnemonic', (tester) async {
      try {
        print('🔍 Testing wallet creation with 12-word mnemonic...');

        final mnemonic = WalletService.generateMnemonic(wordCount: 12);
        expect(mnemonic.split(' ').length, equals(12));
        print('✅ Generated 12-word mnemonic: ${mnemonic.substring(0, 20)}...');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'Test Wallet 12',
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
        print('✅ Test PASSED: 12-word wallet creation works');
      } catch (e) {
        print('❌ Test FAILED: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        rethrow;
      }
    });

    testWidgets('should create wallet with 24-word mnemonic', (tester) async {
      try {
        print('🔍 Testing wallet creation with 24-word mnemonic...');

        final mnemonic = WalletService.generateMnemonic(wordCount: 24);
        expect(mnemonic.split(' ').length, equals(24));
        print('✅ Generated 24-word mnemonic: ${mnemonic.substring(0, 20)}...');

        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'Test Wallet 24',
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
        print('✅ Test PASSED: 24-word wallet creation works');
      } catch (e) {
        print('❌ Test FAILED: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        rethrow;
      }
    });
  });
}
