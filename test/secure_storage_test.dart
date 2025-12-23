import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/models/wallet_models.dart';

void main() {
  // Initialize Flutter binding for platform channels
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SecureStorageService Tests', () {
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

    test('should encrypt and decrypt data', () async {
      const testData = 'test sensitive data';
      
      try {
        final encrypted = await SecureStorageService.encryptData(testData);
        expect(encrypted, isNotEmpty);
        expect(encrypted, isNot(equals(testData)));
        
        final decrypted = await SecureStorageService.decryptData(encrypted);
        expect(decrypted, equals(testData));
      } catch (e) {
        fail('Encryption/decryption failed: $e');
      }
    });

    test('should store and retrieve private key', () async {
      const testAddress = '1test123456789';
      const testPrivateKey = 'test_private_key_12345';
      
      try {
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        
        final retrievedKey = await SecureStorageService.getPrivateKey(testAddress);
        expect(retrievedKey, equals(testPrivateKey));
      } catch (e) {
        fail('Private key storage failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should store and retrieve mnemonic', () async {
      const testMnemonicId = 'test_mnemonic_1';
      const testMnemonic = 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
      
      try {
        await SecureStorageService.storeMnemonic(testMnemonicId, testMnemonic);
        
        final retrievedMnemonic = await SecureStorageService.getMnemonic(testMnemonicId);
        expect(retrievedMnemonic, equals(testMnemonic));
      } catch (e) {
        fail('Mnemonic storage failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should check if wallet data exists', () async {
      expect(await SecureStorageService.hasWalletData(), isFalse);
      
      const testAddress = '1test123456789';
      const testPrivateKey = 'test_private_key_12345';
      
      try {
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        expect(await SecureStorageService.hasWalletData(), isTrue);
      } catch (e) {
        fail('Wallet data check failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should delete private key', () async {
      const testAddress = '1test123456789';
      const testPrivateKey = 'test_private_key_12345';
      
      try {
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        expect(await SecureStorageService.hasWalletData(), isTrue);
        
        await SecureStorageService.deletePrivateKey(testAddress);
        
        // Should throw an error when trying to retrieve deleted key
        expect(
          () => SecureStorageService.getPrivateKey(testAddress),
          throwsA(isA<WalletException>()),
        );
      } catch (e) {
        fail('Delete private key failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should handle multiple addresses', () async {
      const address1 = '1address1111111';
      const address2 = '1address2222222';
      const key1 = 'key1';
      const key2 = 'key2';
      
      try {
        await SecureStorageService.storePrivateKey(address1, key1);
        await SecureStorageService.storePrivateKey(address2, key2);
        
        final addresses = await SecureStorageService.getAllAddresses();
        expect(addresses.length, greaterThanOrEqualTo(2));
        expect(addresses, contains(address1));
        expect(addresses, contains(address2));
        
        final retrievedKey1 = await SecureStorageService.getPrivateKey(address1);
        final retrievedKey2 = await SecureStorageService.getPrivateKey(address2);
        expect(retrievedKey1, equals(key1));
        expect(retrievedKey2, equals(key2));
      } catch (e) {
        fail('Multiple addresses test failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should handle encryption key initialization', () async {
      // This test verifies that encryption keys are properly initialized
      const testData = 'test data for encryption key test';
      
      try {
        // First encryption should initialize the key
        final encrypted1 = await SecureStorageService.encryptData(testData);
        
        // Second encryption should use the same key
        final encrypted2 = await SecureStorageService.encryptData(testData);
        
        // Both should decrypt to the same value
        final decrypted1 = await SecureStorageService.decryptData(encrypted1);
        final decrypted2 = await SecureStorageService.decryptData(encrypted2);
        
        expect(decrypted1, equals(testData));
        expect(decrypted2, equals(testData));
      } catch (e) {
        fail('Encryption key initialization failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should handle empty string data', () async {
      const emptyData = '';
      
      try {
        final encrypted = await SecureStorageService.encryptData(emptyData);
        final decrypted = await SecureStorageService.decryptData(encrypted);
        expect(decrypted, equals(emptyData));
      } catch (e) {
        fail('Empty string handling failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should handle long data strings', () async {
      final longData = 'a' * 10000; // 10KB string
      
      try {
        final encrypted = await SecureStorageService.encryptData(longData);
        final decrypted = await SecureStorageService.decryptData(encrypted);
        expect(decrypted, equals(longData));
      } catch (e) {
        fail('Long string handling failed: $e\nError details: ${e.toString()}');
      }
    });

    test('should handle special characters in data', () async {
      const specialData = '!@#\$%^&*()_+-=[]{}|;:\'",.<>?/~`';
      
      try {
        final encrypted = await SecureStorageService.encryptData(specialData);
        final decrypted = await SecureStorageService.decryptData(encrypted);
        expect(decrypted, equals(specialData));
      } catch (e) {
        fail('Special characters handling failed: $e\nError details: ${e.toString()}');
      }
    });
  });

  group('SecureStorageService Platform-Specific Tests', () {
    test('should work on iOS simulator/device', () async {
      const testAddress = 'ios_test_address';
      const testPrivateKey = 'ios_test_private_key';
      
      try {
        await SecureStorageService.storePrivateKey(testAddress, testPrivateKey);
        final retrieved = await SecureStorageService.getPrivateKey(testAddress);
        expect(retrieved, equals(testPrivateKey));
        print('✅ iOS secure storage test passed');
      } catch (e) {
        print('❌ iOS secure storage test failed: $e');
        print('Error type: ${e.runtimeType}');
        print('Error details: ${e.toString()}');
        
        // Check if it's the specific entitlement error
        if (e.toString().contains('-34018') || 
            e.toString().contains('entitlement') ||
            e.toString().contains('Keychain')) {
          print('\n⚠️  This appears to be an iOS Keychain entitlement issue.');
          print('   Make sure:');
          print('   1. The entitlements file is properly configured');
          print('   2. The app is properly signed');
          print('   3. Keychain Sharing capability is enabled');
        }
        
        rethrow;
      }
    });
  });
}

