import 'dart:convert';
import 'dart:math';
import 'package:bip39/bip39.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed25519;
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/foundation.dart';

/// Wallet service for creating and managing crypto wallets
class WalletService {
  /// Generate a new mnemonic phrase
  static String generateMnemonic({int wordCount = 12}) {
    if (wordCount != 12 && wordCount != 24) {
      throw const WalletException(
        type: WalletErrorType.mnemonicInvalid,
        message: 'Word count must be 12 or 24',
      );
    }

    try {
      // Convert word count to entropy strength in bits
      // 12 words = 128 bits, 24 words = 256 bits
      final strength = wordCount == 12 ? 128 : 256;
      
      // Generate random entropy
      final random = Random.secure();
      final entropyBytes = List<int>.generate(
        strength ~/ 8,
        (_) => random.nextInt(256),
      );
      
      // Convert entropy bytes to hex string
      final entropyHex = entropyBytes
          .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
          .join('');
      
      // Convert entropy to mnemonic using bip39
      return entropyToMnemonic(entropyHex);
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
      // Convert hex string to bytes (2 hex chars = 1 byte)
      final seedBytes = <int>[];
      for (int i = 0; i < seedHex.length; i += 2) {
        final hexByte = seedHex.substring(i, i + 2);
        seedBytes.add(int.parse(hexByte, radix: 16));
      }
      return Uint8List.fromList(seedBytes);
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
    // Use first 32 bytes of seed, or hash seed + derivationPath if needed
    Uint8List privateKeyBytes;
    
    if (seed.length >= 32) {
      // Use first 32 bytes of seed
      privateKeyBytes = seed.sublist(0, 32);
    } else {
      // If seed is shorter than 32 bytes, extend it with derivation path
      final derivationBytes = utf8.encode(derivationPath);
      final combined = Uint8List.fromList([...seed, ...derivationBytes]);
      
      // Hash to get 32 bytes if needed
      if (combined.length >= 32) {
        privateKeyBytes = combined.sublist(0, 32);
      } else {
        // Pad with zeros if still too short (shouldn't happen with proper seed)
        privateKeyBytes = Uint8List(32);
        privateKeyBytes.setRange(0, combined.length, combined);
      }
    }

    final privateKey = ed25519.PrivateKey(privateKeyBytes);
    // For now, use a simplified approach - in production, derive actual public key
    // The ed25519_edwards package requires proper key derivation which we'll implement later
    final publicKeyBytes = privateKeyBytes; // Simplified - replace with proper derivation

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
      // Check if it's a relay chain
      if (chain.toLowerCase() == 'polkadot' ||
          chain.toLowerCase() == 'kusama') {
        return _generateSubstrateAddress(publicKey);
      }

      // Check if it's an Ethereum-compatible parachain
      final ethereumCompatibleChains = [
        'moonbeam',
        'astar',
        'acala',
        'karura',
        'shiden',
        'khala',
        'bifrost',
        'statemint',
        'statemine',
        'centrifuge',
        'equilibrium',
        'composable',
        'hydradx',
        'phala',
        'integritee',
        'darwinia',
        'litentry',
        'crust',
        'origintrail',
        'efinity',
        'nodle',
        'bitgreen',
        'encointer',
        'pendulum',
        'amplitude',
        'interlay',
        'kylin',
        'pichiu',
        'polkadex',
        'coinversation',
        'invarch',
        'oak',
        'robonomics',
        'turing',
        'zeitgeist',
        'subdao',
        'ajuna',
        'altair',
        'basilisk',
        'calamari',
        'heiko',
        'kintsugi',
        'picasso',
        'quartz',
        'unique',
        'genshiro',
        'sakura',
        'shadow',
        'trustbase',
        'subgame',
        'polkasmith',
        'dora',
        'litmus',
        'kabocha',
        'mangata',
        'gm',
        'tinkernet',
        'listen',
        'pioneer',
        'bitcountry',
        'subsocial',
        'parallel',
      ];

      if (ethereumCompatibleChains.contains(chain.toLowerCase())) {
        return _generateEthereumAddress(publicKey);
      }

      // Default to Substrate address for other parachains
      return _generateSubstrateAddress(publicKey);
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
      // Relay chains and most parachains use Ed25519
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
      }

      // Ethereum-compatible parachains use Secp256k1
      final ethereumCompatibleChains = [
        'moonbeam',
        'astar',
        'acala',
        'karura',
        'shiden',
        'khala',
        'bifrost',
        'statemint',
        'statemine',
        'centrifuge',
        'equilibrium',
        'composable',
        'hydradx',
        'phala',
        'integritee',
        'darwinia',
        'litentry',
        'crust',
        'origintrail',
        'efinity',
        'nodle',
        'bitgreen',
        'encointer',
        'pendulum',
        'amplitude',
        'interlay',
        'kylin',
        'pichiu',
        'polkadex',
        'coinversation',
        'invarch',
        'oak',
        'robonomics',
        'turing',
        'zeitgeist',
        'subdao',
        'ajuna',
        'altair',
        'basilisk',
        'calamari',
        'heiko',
        'kintsugi',
        'picasso',
        'quartz',
        'unique',
        'genshiro',
        'sakura',
        'shadow',
        'trustbase',
        'subgame',
        'polkasmith',
        'dora',
        'litmus',
        'kabocha',
        'mangata',
        'gm',
        'tinkernet',
        'listen',
        'pioneer',
        'bitcountry',
        'subsocial',
        'parallel',
      ];

      if (ethereumCompatibleChains.contains(chain.toLowerCase())) {
        // Secp256k1 for Ethereum-compatible chains
        final privateKeyBytes = base64Decode(privateKey);
        final publicKey =
            privateKeyBytes; // Simplified - in production, derive actual public key

        return KeyPair(
          privateKey: privateKey,
          publicKey: base64Encode(publicKey),
        );
      }

      // Default to Ed25519 for other parachains
      final privateKeyBytes = base64Decode(privateKey);
      final publicKeyBytes =
          privateKeyBytes; // Simplified - in production, derive actual public key

      return KeyPair(
        privateKey: privateKey,
        publicKey: base64Encode(publicKeyBytes),
      );
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
    // Relay chains use Substrate derivation
    if (chain.toLowerCase() == 'polkadot' || chain.toLowerCase() == 'kusama') {
      return '//$accountIndex';
    }

    // Ethereum-compatible parachains use BIP44 derivation
    final ethereumCompatibleChains = [
      'moonbeam',
      'astar',
      'acala',
      'karura',
      'shiden',
      'khala',
      'bifrost',
      'statemint',
      'statemine',
      'centrifuge',
      'equilibrium',
      'composable',
      'hydradx',
      'phala',
      'integritee',
      'darwinia',
      'litentry',
      'crust',
      'origintrail',
      'efinity',
      'nodle',
      'bitgreen',
      'encointer',
      'pendulum',
      'amplitude',
      'interlay',
      'kylin',
      'pichiu',
      'polkadex',
      'coinversation',
      'invarch',
      'oak',
      'robonomics',
      'turing',
      'zeitgeist',
      'subdao',
      'ajuna',
      'altair',
      'basilisk',
      'calamari',
      'heiko',
      'kintsugi',
      'picasso',
      'quartz',
      'unique',
      'genshiro',
      'sakura',
      'shadow',
      'trustbase',
      'subgame',
      'polkasmith',
      'dora',
      'litmus',
      'kabocha',
      'mangata',
      'gm',
      'tinkernet',
      'listen',
      'pioneer',
      'bitcountry',
      'subsocial',
      'parallel',
    ];

    if (ethereumCompatibleChains.contains(chain.toLowerCase())) {
      return "m/44'/60'/0'/0/$accountIndex";
    }

    // Default to Substrate derivation for other parachains
    return '//$accountIndex';
  }

  /// Get supported chains (Polkadot, Kusama, and their active parachains)
  static Future<List<String>> getSupportedChains() async {
    try {
      final chains = <String>['polkadot', 'kusama'];

      // Get active parachains for Polkadot
      try {
        final polkadotParachains = await _getActiveParachains('polkadot');
        chains.addAll(polkadotParachains);
      } catch (e) {
        debugPrint('Failed to get Polkadot parachains: $e');
      }

      // Get active parachains for Kusama
      try {
        final kusamaParachains = await _getActiveParachains('kusama');
        chains.addAll(kusamaParachains);
      } catch (e) {
        debugPrint('Failed to get Kusama parachains: $e');
      }

      return chains;
    } catch (e) {
      debugPrint('Failed to get supported chains: $e');
      // Fallback to basic chains if RPC fails
      return ['polkadot', 'kusama'];
    }
  }

  /// Get active parachains for a relay chain
  static Future<List<String>> _getActiveParachains(String relayChain) async {
    try {
      // Get registered parachains
      final registeredResponse = await _sendRpcRequest(
        relayChain,
        'api.query.paras.paraLifecycles',
        [],
      );

      final parachains = <String>[];

      if (registeredResponse['result'] != null) {
        final lifecycles = registeredResponse['result'] as Map<String, dynamic>;

        for (final entry in lifecycles.entries) {
          final paraId = entry.key;
          final lifecycle = entry.value;

          // Only include active parachains
          if (lifecycle == 'Parachain' || lifecycle == 'Parathread') {
            // Get parachain info to determine the chain name
            try {
              final infoResponse = await _sendRpcRequest(
                relayChain,
                'api.query.paras.paras',
                [int.parse(paraId)],
              );

              if (infoResponse['result'] != null) {
                final chainName = _getParachainName(
                  int.parse(paraId),
                  relayChain,
                );
                if (chainName.isNotEmpty) {
                  parachains.add(chainName);
                }
              }
            } catch (e) {
              debugPrint('Failed to get parachain info for $paraId: $e');
            }
          }
        }
      }

      return parachains;
    } catch (e) {
      debugPrint('Failed to get parachains for $relayChain: $e');
      return [];
    }
  }

  /// Get parachain name from para ID
  static String _getParachainName(int paraId, String relayChain) {
    // Map of known parachain IDs to their names
    final parachainMap = {
      'polkadot': {
        1000: 'statemint',
        1001: 'statemine',
        2000: 'acala',
        2002: 'clover',
        2004: 'moonbeam',
        2006: 'astar',
        2007: 'bifrost',
        2008: 'centrifuge',
        2009: 'parallel',
        2011: 'equilibrium',
        2012: 'composable',
        2013: 'hydradx',
        2014: 'phala',
        2015: 'integritee',
        2016: 'darwinia',
        2017: 'litentry',
        2018: 'crust',
        2019: 'origintrail',
        2021: 'efinity',
        2022: 'nodle',
        2023: 'bitgreen',
        2024: 'encointer',
        2025: 'pendulum',
        2026: 'amplitude',
        2027: 'interlay',
        2028: 'kylin',
        2029: 'pichiu',
        2030: 'polkadex',
        2031: 'bifrost',
        2032: 'coinversation',
        2033: 'invarch',
        2034: 'oak',
        2035: 'robonomics',
        2036: 'turing',
        2037: 'zeitgeist',
        2038: 'subdao',
        2039: 'ajuna',
        2040: 'altair',
        2041: 'basilisk',
        2042: 'calamari',
        2043: 'heiko',
        2044: 'kintsugi',
        2045: 'picasso',
        2046: 'quartz',
        2047: 'unique',
        2048: 'genshiro',
        2049: 'karura',
        2050: 'khala',
        2051: 'kilt',
        2052: 'sakura',
        2053: 'shadow',
        2054: 'shiden',
        2055: 'turing',
        2056: 'zeitgeist',
      },
      'kusama': {
        1000: 'statemine',
        2000: 'karura',
        2001: 'bifrost',
        2002: 'khala',
        2003: 'shiden',
        2004: 'robonomics',
        2005: 'trustbase',
        2006: 'altair',
        2007: 'heiko',
        2008: 'kintsugi',
        2009: 'pichiu',
        2010: 'calamari',
        2011: 'basilisk',
        2012: 'turing',
        2013: 'litentry',
        2014: 'kilt',
        2015: 'sakura',
        2016: 'quartz',
        2017: 'unique',
        2018: 'genshiro',
        2019: 'subgame',
        2020: 'zeitgeist',
        2021: 'integritee',
        2022: 'nodle',
        2023: 'polkasmith',
        2024: 'dora',
        2025: 'crust',
        2026: 'litmus',
        2027: 'kabocha',
        2028: 'mangata',
        2029: 'gm',
        2030: 'tinkernet',
        2031: 'listen',
        2032: 'pioneer',
        2033: 'bitcountry',
        2034: 'subsocial',
        2035: 'parallel',
        2036: 'heiko',
        2037: 'picasso',
        2038: 'composable',
        2039: 'amplitude',
        2040: 'pendulum',
        2041: 'invarch',
        2042: 'kylin',
        2043: 'polkadex',
        2044: 'bifrost',
        2045: 'coinversation',
        2046: 'efinity',
        2047: 'centrifuge',
        2048: 'origintrail',
        2049: 'equilibrium',
        2050: 'hydradx',
        2051: 'phala',
        2052: 'darwinia',
        2053: 'litentry',
        2054: 'crust',
        2055: 'origintrail',
        2056: 'efinity',
        2057: 'nodle',
        2058: 'bitgreen',
        2059: 'encointer',
        2060: 'pendulum',
        2061: 'amplitude',
        2062: 'interlay',
        2063: 'kylin',
        2064: 'pichiu',
        2065: 'polkadex',
        2066: 'bifrost',
        2067: 'coinversation',
        2068: 'invarch',
        2069: 'oak',
        2070: 'robonomics',
        2071: 'turing',
        2072: 'zeitgeist',
        2073: 'subdao',
        2074: 'ajuna',
        2075: 'altair',
        2076: 'basilisk',
        2077: 'calamari',
        2078: 'heiko',
        2079: 'kintsugi',
        2080: 'picasso',
        2081: 'quartz',
        2082: 'unique',
        2083: 'genshiro',
        2084: 'karura',
        2085: 'khala',
        2086: 'kilt',
        2087: 'sakura',
        2088: 'shadow',
        2089: 'shiden',
        2090: 'turing',
        2091: 'zeitgeist',
      },
    };

    return parachainMap[relayChain]?[paraId] ?? '';
  }

  /// Send RPC request to blockchain network
  static Future<Map<String, dynamic>> _sendRpcRequest(
    String chain,
    String method,
    List<dynamic> params,
  ) async {
    try {
      final endpoint = RpcNodeService.getRpcUrl(chain);
      if (endpoint == null) {
        throw WalletException(
          type: WalletErrorType.unknown,
          message: 'No RPC node configured for chain: $chain',
        );
      }

      final channel = WebSocketChannel.connect(Uri.parse(endpoint));

      final request = {
        'jsonrpc': '2.0',
        'id': DateTime.now().millisecondsSinceEpoch,
        'method': method,
        'params': params,
      };

      channel.sink.add(jsonEncode(request));

      // Wait for response
      final response = await channel.stream.first;
      final responseData = jsonDecode(response) as Map<String, dynamic>;

      await channel.sink.close();

      return responseData;
    } catch (e) {
      throw WalletException(
        type: WalletErrorType.unknown,
        message: 'RPC request failed: $e',
      );
    }
  }

  /// Validate private key format
  static bool validatePrivateKey(String privateKey, String chain) {
    try {
      // Relay chains and most parachains use Ed25519
      if (chain.toLowerCase() == 'polkadot' ||
          chain.toLowerCase() == 'kusama') {
        // Ed25519 validation
        base64Decode(privateKey);
        return true;
      }

      // Ethereum-compatible parachains use Secp256k1
      final ethereumCompatibleChains = [
        'moonbeam',
        'astar',
        'acala',
        'karura',
        'shiden',
        'khala',
        'bifrost',
        'statemint',
        'statemine',
        'centrifuge',
        'equilibrium',
        'composable',
        'hydradx',
        'phala',
        'integritee',
        'darwinia',
        'litentry',
        'crust',
        'origintrail',
        'efinity',
        'nodle',
        'bitgreen',
        'encointer',
        'pendulum',
        'amplitude',
        'interlay',
        'kylin',
        'pichiu',
        'polkadex',
        'coinversation',
        'invarch',
        'oak',
        'robonomics',
        'turing',
        'zeitgeist',
        'subdao',
        'ajuna',
        'altair',
        'basilisk',
        'calamari',
        'heiko',
        'kintsugi',
        'picasso',
        'quartz',
        'unique',
        'genshiro',
        'sakura',
        'shadow',
        'trustbase',
        'subgame',
        'polkasmith',
        'dora',
        'litmus',
        'kabocha',
        'mangata',
        'gm',
        'tinkernet',
        'listen',
        'pioneer',
        'bitcountry',
        'subsocial',
        'parallel',
      ];

      if (ethereumCompatibleChains.contains(chain.toLowerCase())) {
        // Secp256k1 validation
        base64Decode(privateKey);
        return true;
      }

      // Default to Ed25519 validation for other parachains
      base64Decode(privateKey);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Generate random private key
  static String generateRandomPrivateKey(String chain) {
    final random = Random.secure();

    // Relay chains and most parachains use Ed25519
    if (chain.toLowerCase() == 'polkadot' || chain.toLowerCase() == 'kusama') {
      // Ed25519
      final bytes = List<int>.generate(32, (i) => random.nextInt(256));
      return base64Encode(bytes);
    }

    // Ethereum-compatible parachains use Secp256k1
    final ethereumCompatibleChains = [
      'moonbeam',
      'astar',
      'acala',
      'karura',
      'shiden',
      'khala',
      'bifrost',
      'statemint',
      'statemine',
      'centrifuge',
      'equilibrium',
      'composable',
      'hydradx',
      'phala',
      'integritee',
      'darwinia',
      'litentry',
      'crust',
      'origintrail',
      'efinity',
      'nodle',
      'bitgreen',
      'encointer',
      'pendulum',
      'amplitude',
      'interlay',
      'kylin',
      'pichiu',
      'polkadex',
      'coinversation',
      'invarch',
      'oak',
      'robonomics',
      'turing',
      'zeitgeist',
      'subdao',
      'ajuna',
      'altair',
      'basilisk',
      'calamari',
      'heiko',
      'kintsugi',
      'picasso',
      'quartz',
      'unique',
      'genshiro',
      'sakura',
      'shadow',
      'trustbase',
      'subgame',
      'polkasmith',
      'dora',
      'litmus',
      'kabocha',
      'mangata',
      'gm',
      'tinkernet',
      'listen',
      'pioneer',
      'bitcountry',
      'subsocial',
      'parallel',
    ];

    if (ethereumCompatibleChains.contains(chain.toLowerCase())) {
      // Secp256k1
      final bytes = List<int>.generate(32, (i) => random.nextInt(256));
      return base64Encode(bytes);
    }

    // Default to Ed25519 for other parachains
    final bytes = List<int>.generate(32, (i) => random.nextInt(256));
    return base64Encode(bytes);
  }
}

/// Key pair model
class KeyPair {
  final String privateKey;
  final String publicKey;

  const KeyPair({required this.privateKey, required this.publicKey});
}
