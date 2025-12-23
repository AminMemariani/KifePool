import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/core/services/wallet_service.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/models/wallet_models.dart';

void main() {
  // Initialize Flutter binding for platform channels
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Wallet Creation Integration Tests', () {
    setUp(() async {
      // Clear any existing data before each test
      try {
        await SecureStorageService.clearAllWalletData();
      } catch (e) {
        // Ignore errors during cleanup
      }
    });

    tearDown(() async {
      // Clean up after each test
      try {
        await SecureStorageService.clearAllWalletData();
      } catch (e) {
        // Ignore errors during cleanup
      }
    });

    test('should create wallet with 12-word mnemonic', () async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 12);
        expect(mnemonic, isNotEmpty);
        expect(mnemonic.split(' ').length, equals(12));
        
        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'Test Wallet 12',
          chain: 'polkadot',
        );
        
        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        expect(result.publicKey, isNotEmpty);
        expect(result.mnemonic, equals(mnemonic));
        
        print('✅ 12-word wallet creation test passed');
        print('   Address: ${result.address}');
      } catch (e) {
        print('❌ 12-word wallet creation test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        rethrow;
      }
    });

    test('should create wallet with 24-word mnemonic', () async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 24);
        expect(mnemonic, isNotEmpty);
        expect(mnemonic.split(' ').length, equals(24));
        
        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'Test Wallet 24',
          chain: 'polkadot',
        );
        
        expect(result.success, isTrue);
        expect(result.address, isNotEmpty);
        expect(result.publicKey, isNotEmpty);
        expect(result.mnemonic, equals(mnemonic));
        
        print('✅ 24-word wallet creation test passed');
        print('   Address: ${result.address}');
      } catch (e) {
        print('❌ 24-word wallet creation test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        
        // Check for specific errors
        if (e.toString().contains('Failed to store private key')) {
          print('\n⚠️  Private key storage failed - checking secure storage...');
          await _testSecureStorageDirectly();
        }
        
        rethrow;
      }
    });

    test('should store private key securely after wallet creation', () async {
      try {
        final mnemonic = WalletService.generateMnemonic(wordCount: 12);
        final result = await WalletService.createWalletFromMnemonic(
          mnemonic: mnemonic,
          name: 'Test Wallet Storage',
          chain: 'polkadot',
        );
        
        expect(result.success, isTrue);
        
        // Verify private key was stored
        final storedKey = await SecureStorageService.getPrivateKey(result.address);
        expect(storedKey, isNotEmpty);
        
        print('✅ Private key storage verification passed');
      } catch (e) {
        print('❌ Private key storage verification failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        
        if (e.toString().contains('-34018') || 
            e.toString().contains('entitlement')) {
          print('\n🔍 DIAGNOSIS: iOS Keychain entitlement issue detected');
          print('   This error indicates the app lacks Keychain access permissions.');
          print('   Solutions:');
          print('   1. Verify ios/Runner/Runner.entitlements exists');
          print('   2. Check CODE_SIGN_ENTITLEMENTS in Xcode project');
          print('   3. Ensure app is properly signed');
          print('   4. Try: flutter clean && flutter pub get && flutter run');
        }
        
        rethrow;
      }
    });

    test('should create wallets for different chains', () async {
      final chains = ['polkadot', 'kusama', 'moonbeam'];
      
      for (final chain in chains) {
        try {
          final mnemonic = WalletService.generateMnemonic(wordCount: 12);
          final result = await WalletService.createWalletFromMnemonic(
            mnemonic: mnemonic,
            name: 'Test Wallet $chain',
            chain: chain,
          );
          
          expect(result.success, isTrue);
          expect(result.address, isNotEmpty);
          
          print('✅ Wallet creation for $chain passed');
        } catch (e) {
          print('❌ Wallet creation for $chain failed: $e');
          rethrow;
        }
      }
    });
  });

  group('Wallet Creation Error Handling', () {
    test('should handle invalid mnemonic', () async {
      const invalidMnemonic = 'invalid mnemonic phrase';
      
      final result = await WalletService.createWalletFromMnemonic(
        mnemonic: invalidMnemonic,
        name: 'Invalid Test',
        chain: 'polkadot',
      );
      
      expect(result.success, isFalse);
      expect(result.error, isNotEmpty);
    });

    test('should validate mnemonic before creating wallet', () {
      const invalidMnemonic = 'not a valid mnemonic';
      final isValid = WalletService.validateMnemonic(invalidMnemonic);
      expect(isValid, isFalse);
    });
  });
}

Future<void> _testSecureStorageDirectly() async {
  print('\n🔍 Testing secure storage directly...');
  try {
    const testData = 'test_data_12345';
    final encrypted = await SecureStorageService.encryptData(testData);
    final decrypted = await SecureStorageService.decryptData(encrypted);
    
    if (decrypted == testData) {
      print('✅ Secure storage encryption/decryption works');
    } else {
      print('❌ Secure storage encryption/decryption failed');
    }
  } catch (e) {
    print('❌ Secure storage test failed: $e');
    print('   This indicates a fundamental issue with secure storage');
  }
}

