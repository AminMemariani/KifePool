import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kifepool/core/models/wallet_models.dart';

/// Secure storage service for wallet data encryption
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: false,
    ),
    mOptions: MacOsOptions(groupId: 'V4SXY52CG3.com.kifepool.app.kifepool'),
  );

  static const String _encryptionKeyKey = 'wallet_encryption_key';
  static const String _saltKey = 'wallet_salt';

  /// Initialize encryption key if not exists
  static Future<void> _initializeEncryption() async {
    final existingKey = await _storage.read(key: _encryptionKeyKey);
    if (existingKey == null) {
      // Generate new encryption key
      final key = Key.fromSecureRandom(32);
      await _storage.write(key: _encryptionKeyKey, value: key.base64);

      // Generate salt
      final salt = _generateSalt();
      await _storage.write(key: _saltKey, value: salt);
    }
  }

  /// Generate random salt
  static String _generateSalt() {
    final random = Random.secure();
    final salt = List<int>.generate(16, (i) => random.nextInt(256));
    return base64Encode(salt);
  }

  /// Get encryption key
  static Future<Key> _getEncryptionKey() async {
    await _initializeEncryption();
    final keyString = await _storage.read(key: _encryptionKeyKey);
    if (keyString == null) {
      throw const WalletException(
        type: WalletErrorType.encryptionFailed,
        message: 'Failed to retrieve encryption key',
      );
    }
    return Key.fromBase64(keyString);
  }

  /// Get salt
  static Future<IV> _getSalt() async {
    await _initializeEncryption();
    final saltString = await _storage.read(key: _saltKey);
    if (saltString == null) {
      throw const WalletException(
        type: WalletErrorType.encryptionFailed,
        message: 'Failed to retrieve salt',
      );
    }
    return IV.fromBase64(saltString);
  }

  /// Encrypt sensitive data
  static Future<String> encryptData(String data) async {
    try {
      final key = await _getEncryptionKey();
      final iv = await _getSalt();
      final encrypter = Encrypter(AES(key));
      final encrypted = encrypter.encrypt(data, iv: iv);
      return encrypted.base64;
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.encryptionFailed,
        message: 'Failed to encrypt data',
        details: e.toString(),
      );
    }
  }

  /// Decrypt sensitive data
  static Future<String> decryptData(String encryptedData) async {
    try {
      final key = await _getEncryptionKey();
      final iv = await _getSalt();
      final encrypter = Encrypter(AES(key));
      final encrypted = Encrypted.fromBase64(encryptedData);
      return encrypter.decrypt(encrypted, iv: iv);
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.decryptionFailed,
        message: 'Failed to decrypt data',
        details: e.toString(),
      );
    }
  }

  /// Store encrypted private key
  static Future<void> storePrivateKey(String address, String privateKey) async {
    try {
      final encryptedKey = await encryptData(privateKey);
      await _storage.write(key: 'private_key_$address', value: encryptedKey);
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.storageError,
        message: 'Failed to store private key',
        details: e.toString(),
      );
    }
  }

  /// Retrieve and decrypt private key
  static Future<String> getPrivateKey(String address) async {
    try {
      final encryptedKey = await _storage.read(key: 'private_key_$address');
      if (encryptedKey == null) {
        throw const WalletException(
          type: WalletErrorType.accountNotFound,
          message: 'Private key not found for address',
        );
      }
      return await decryptData(encryptedKey);
    } catch (e) {
      if (e is WalletException) rethrow;
      throw WalletException(
        type: WalletErrorType.storageError,
        message: 'Failed to retrieve private key',
        details: e.toString(),
      );
    }
  }

  /// Store encrypted mnemonic
  static Future<void> storeMnemonic(String mnemonicId, String mnemonic) async {
    try {
      final encryptedMnemonic = await encryptData(mnemonic);
      await _storage.write(
        key: 'mnemonic_$mnemonicId',
        value: encryptedMnemonic,
      );
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.storageError,
        message: 'Failed to store mnemonic',
        details: e.toString(),
      );
    }
  }

  /// Retrieve and decrypt mnemonic
  static Future<String> getMnemonic(String mnemonicId) async {
    try {
      final encryptedMnemonic = await _storage.read(
        key: 'mnemonic_$mnemonicId',
      );
      if (encryptedMnemonic == null) {
        throw const WalletException(
          type: WalletErrorType.accountNotFound,
          message: 'Mnemonic not found',
        );
      }
      return await decryptData(encryptedMnemonic);
    } catch (e) {
      if (e is WalletException) rethrow;
      throw WalletException(
        type: WalletErrorType.storageError,
        message: 'Failed to retrieve mnemonic',
        details: e.toString(),
      );
    }
  }

  /// Store app settings
  static Future<void> storeSetting(String key, String value) async {
    await _storage.write(key: 'setting_$key', value: value);
  }

  /// Retrieve app setting
  static Future<String?> getSetting(String key) async {
    return await _storage.read(key: 'setting_$key');
  }

  /// Delete private key
  static Future<void> deletePrivateKey(String address) async {
    await _storage.delete(key: 'private_key_$address');
  }

  /// Delete mnemonic
  static Future<void> deleteMnemonic(String mnemonicId) async {
    await _storage.delete(key: 'mnemonic_$mnemonicId');
  }

  /// Clear all wallet data (for logout/reset)
  static Future<void> clearAllWalletData() async {
    final keys = await _storage.readAll();
    for (final key in keys.keys) {
      if (key.startsWith('private_key_') ||
          key.startsWith('mnemonic_') ||
          key.startsWith('setting_')) {
        await _storage.delete(key: key);
      }
    }
  }

  /// Check if wallet data exists
  static Future<bool> hasWalletData() async {
    final keys = await _storage.readAll();
    return keys.keys.any(
      (key) => key.startsWith('private_key_') || key.startsWith('mnemonic_'),
    );
  }

  /// Get all stored addresses
  static Future<List<String>> getAllAddresses() async {
    final keys = await _storage.readAll();
    return keys.keys
        .where((key) => key.startsWith('private_key_'))
        .map((key) => key.replaceFirst('private_key_', ''))
        .toList();
  }

  /// Generate secure random bytes
  static Uint8List generateSecureRandom(int length) {
    final random = Random.secure();
    return Uint8List.fromList(
      List<int>.generate(length, (i) => random.nextInt(256)),
    );
  }

  /// Hash data with SHA-256
  static String hashData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
