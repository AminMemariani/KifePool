import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:bip39/bip39.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';

/// Wallet service for creating and managing crypto wallets
class WalletService {
  static const List<String> _supportedChains = [
    'polkadot',
    'kusama',
    'moonbeam',
    'astar',
    'acala',
  ];

  /// Generate a new mnemonic phrase
  static String generateMnemonic({int wordCount = 12}) {
    if (wordCount != 12 && wordCount != 24) {
      throw const WalletException(
        type: WalletErrorType.mnemonicInvalid,
        message: 'Word count must be 12 or 24',
      );
    }

    try {
      return generateMnemonic();
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.mnemonicInvalid,
        message: 'Failed to generate mnemonic',
        details: e.toString(),
      );
    }
  }

  /// Validate mnemonic phrase
  static bool validateMnemonic(String mnemonic) {
    try {
      return mnemonicToEntropy(mnemonic).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Generate seed from mnemonic
  static Uint8List mnemonicToSeed(String mnemonic, {String passphrase = ''}) {
    try {
      final seedHex = mnemonicToSeedHex(mnemonic, passphrase: passphrase);
      return Uint8List.fromList(seedHex.codeUnits);
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.mnemonicInvalid,
        message: 'Failed to generate seed from mnemonic',
        details: e.toString(),
      );
    }
  }

  /// Derive key pair from seed
  static KeyPair deriveKeyPair(Uint8List seed, String derivationPath) {
    try {
      // For Polkadot/Substrate chains, we use Ed25519
      if (derivationPath.startsWith('//')) {
        return _deriveEd25519KeyPair(seed, derivationPath);
      } else {
        // For Ethereum-compatible chains, use Secp256k1
        return _deriveSecp256k1KeyPair(seed, derivationPath);
      }
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.privateKeyInvalid,
        message: 'Failed to derive key pair',
        details: e.toString(),
      );
    }
  }

  /// Derive Ed25519 key pair (for Polkadot/Substrate)
  static KeyPair _deriveEd25519KeyPair(Uint8List seed, String derivationPath) {
    // Simplified derivation - in production, use proper HD key derivation
    final random = Random.secure();
    final privateKeyBytes = Uint8List.fromList([
      ...seed,
      ...utf8.encode(derivationPath),
      ...List.generate(
        32 - seed.length - utf8.encode(derivationPath).length,
        (i) => random.nextInt(256),
      ),
    ]);

    final privateKey = ed25519.PrivateKey(privateKeyBytes.sublist(0, 32));
    // For now, use a simplified approach - in production, derive actual public key
    final publicKeyBytes = privateKeyBytes.sublist(0, 32);

    return KeyPair(
      privateKey: base64Encode(privateKey.bytes),
      publicKey: base64Encode(publicKeyBytes),
    );
  }

  /// Derive Secp256k1 key pair (for Ethereum-compatible chains)
  static KeyPair _deriveSecp256k1KeyPair(
    Uint8List seed,
    String derivationPath,
  ) {
    // Simplified derivation - in production, use proper HD key derivation
    final random = Random.secure();
    final privateKeyBytes = Uint8List.fromList([
      ...seed,
      ...utf8.encode(derivationPath),
      ...List.generate(
        32 - seed.length - utf8.encode(derivationPath).length,
        (i) => random.nextInt(256),
      ),
    ]);

    // For now, use a simplified approach without secp256k1
    final privateKey = privateKeyBytes.sublist(0, 32);
    final publicKey =
        privateKey; // Simplified - in production, derive actual public key

    return KeyPair(
      privateKey: base64Encode(privateKey),
      publicKey: base64Encode(publicKey),
    );
  }

  /// Generate address from public key
  static String generateAddress(String publicKey, String chain) {
    try {
      switch (chain.toLowerCase()) {
        case 'polkadot':
        case 'kusama':
          return _generateSubstrateAddress(publicKey);
        case 'moonbeam':
        case 'astar':
        case 'acala':
          return _generateEthereumAddress(publicKey);
        default:
          throw WalletException(
            type: WalletErrorType.unknown,
            message: 'Unsupported chain: $chain',
          );
      }
    } catch (e) {
      if (e is WalletException) rethrow;
      throw WalletException(
        type: WalletErrorType.unknown,
        message: 'Failed to generate address',
        details: e.toString(),
      );
    }
  }

  /// Generate Substrate address (simplified)
  static String _generateSubstrateAddress(String publicKey) {
    // In production, use proper SS58 encoding
    final hash = SecureStorageService.hashData(publicKey);
    return '1${hash.substring(0, 47)}';
  }

  /// Generate Ethereum address (simplified)
  static String _generateEthereumAddress(String publicKey) {
    // In production, use proper Ethereum address generation
    final hash = SecureStorageService.hashData(publicKey);
    return '0x${hash.substring(0, 40)}';
  }

  /// Create wallet from mnemonic
  static Future<WalletCreationResult> createWalletFromMnemonic({
    required String mnemonic,
    required String name,
    required String chain,
    int accountIndex = 0,
  }) async {
    try {
      if (!validateMnemonic(mnemonic)) {
        throw const WalletException(
          type: WalletErrorType.mnemonicInvalid,
          message: 'Invalid mnemonic phrase',
        );
      }

      final seed = mnemonicToSeed(mnemonic);
      final derivationPath = _getDerivationPath(chain, accountIndex);
      final keyPair = deriveKeyPair(seed, derivationPath);
      final address = generateAddress(keyPair.publicKey, chain);

      // Store encrypted private key
      await SecureStorageService.storePrivateKey(address, keyPair.privateKey);

      return WalletCreationResult(
        address: address,
        publicKey: keyPair.publicKey,
        mnemonic: mnemonic,
        derivationPath: derivationPath,
        success: true,
      );
    } catch (e) {
      if (e is WalletException) rethrow;
      return WalletCreationResult(
        address: '',
        publicKey: '',
        mnemonic: mnemonic,
        derivationPath: '',
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Import wallet from private key
  static Future<WalletImportResult> importWalletFromPrivateKey({
    required String privateKey,
    required String name,
    required String chain,
  }) async {
    try {
      final keyPair = _importKeyPair(privateKey, chain);
      final address = generateAddress(keyPair.publicKey, chain);

      // Store encrypted private key
      await SecureStorageService.storePrivateKey(address, privateKey);

      return WalletImportResult(
        address: address,
        publicKey: keyPair.publicKey,
        success: true,
        importType: 'private_key',
      );
    } catch (e) {
      if (e is WalletException) rethrow;
      return WalletImportResult(
        address: '',
        publicKey: '',
        success: false,
        importType: 'private_key',
        error: e.toString(),
      );
    }
  }

  /// Import key pair from private key
  static KeyPair _importKeyPair(String privateKey, String chain) {
    try {
      if (chain.toLowerCase() == 'polkadot' ||
          chain.toLowerCase() == 'kusama') {
        // Ed25519 for Substrate chains
        final privateKeyBytes = base64Decode(privateKey);
        // For now, use a simplified approach - in production, derive actual public key
        final publicKeyBytes = privateKeyBytes;

        return KeyPair(
          privateKey: privateKey,
          publicKey: base64Encode(publicKeyBytes),
        );
      } else {
        // Simplified for Ethereum-compatible chains
        final privateKeyBytes = base64Decode(privateKey);
        final publicKey =
            privateKeyBytes; // Simplified - in production, derive actual public key

        return KeyPair(
          privateKey: privateKey,
          publicKey: base64Encode(publicKey),
        );
      }
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.privateKeyInvalid,
        message: 'Invalid private key format',
        details: e.toString(),
      );
    }
  }

  /// Get derivation path for chain
  static String _getDerivationPath(String chain, int accountIndex) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return '//$accountIndex';
      case 'kusama':
        return '//$accountIndex';
      case 'moonbeam':
        return "m/44'/60'/0'/0/$accountIndex";
      case 'astar':
        return "m/44'/60'/0'/0/$accountIndex";
      case 'acala':
        return "m/44'/60'/0'/0/$accountIndex";
      default:
        return "m/44'/60'/0'/0/$accountIndex";
    }
  }

  /// Get supported chains
  static List<String> getSupportedChains() {
    return List.from(_supportedChains);
  }

  /// Validate private key format
  static bool validatePrivateKey(String privateKey, String chain) {
    try {
      if (chain.toLowerCase() == 'polkadot' ||
          chain.toLowerCase() == 'kusama') {
        // Ed25519 validation
        base64Decode(privateKey);
        return true;
      } else {
        // Simplified validation for Ethereum-compatible chains
        base64Decode(privateKey);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  /// Generate random private key
  static String generateRandomPrivateKey(String chain) {
    final random = Random.secure();

    if (chain.toLowerCase() == 'polkadot' || chain.toLowerCase() == 'kusama') {
      // Ed25519
      final bytes = List<int>.generate(32, (i) => random.nextInt(256));
      return base64Encode(bytes);
    } else {
      // Simplified for Ethereum-compatible chains
      final bytes = List<int>.generate(32, (i) => random.nextInt(256));
      return base64Encode(bytes);
    }
  }
}

/// Key pair model
class KeyPair {
  final String privateKey;
  final String publicKey;

  const KeyPair({required this.privateKey, required this.publicKey});
}
