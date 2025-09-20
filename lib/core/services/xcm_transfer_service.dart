import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/database_service.dart';

/// Service for managing XCM cross-chain transfers
class XcmTransferService {
  static List<XcmChainInfo>? _cachedChains;
  static DateTime? _cacheTimestamp;
  static const Duration _cacheExpiry = Duration(minutes: 30);

  /// Get supported XCM chains dynamically from network
  static Future<List<XcmChainInfo>> getSupportedChains() async {
    // Return cached data if still valid
    if (_cachedChains != null &&
        _cacheTimestamp != null &&
        DateTime.now().difference(_cacheTimestamp!) < _cacheExpiry) {
      return _cachedChains!;
    }

    try {
      // Get active parachains from network
      final activeParachains = await _getActiveParachainsFromNetwork();

      // Convert to XCM chain info format
      final chains = <XcmChainInfo>[];

      // Add relay chains first
      chains.addAll(_getRelayChains());

      // Add active parachains
      for (final parachain in activeParachains) {
        chains.add(_convertParachainToXcmChainInfo(parachain));
      }

      // Cache the results
      _cachedChains = chains;
      _cacheTimestamp = DateTime.now();

      return chains;
    } catch (e) {
      debugPrint('Error fetching active parachains: $e');
      // Fallback to default chains if network fails
      return _getDefaultChains();
    }
  }

  /// Get relay chains (Polkadot and Kusama)
  static List<XcmChainInfo> _getRelayChains() {
    return [
      const XcmChainInfo(
        id: 'polkadot',
        name: 'Polkadot',
        symbol: 'DOT',
        rpcUrl: 'wss://rpc.polkadot.io',
        explorerUrl: 'https://polkadot.subscan.io',
        isRelayChain: true,
        supportedAssets: ['DOT'],
        assetSymbols: {'0': 'DOT'},
      ),
      const XcmChainInfo(
        id: 'kusama',
        name: 'Kusama',
        symbol: 'KSM',
        rpcUrl: 'wss://kusama-rpc.polkadot.io',
        explorerUrl: 'https://kusama.subscan.io',
        isRelayChain: true,
        supportedAssets: ['KSM'],
        assetSymbols: {'0': 'KSM'},
      ),
    ];
  }

  /// Convert parachain to XCM chain info
  static XcmChainInfo _convertParachainToXcmChainInfo(dynamic parachain) {
    // Extract parachain information
    final id = parachain['id']?.toString() ?? 'unknown';
    final name = parachain['name']?.toString() ?? 'Unknown Parachain';
    final symbol = parachain['symbol']?.toString() ?? 'UNK';
    final rpcUrl = parachain['rpcUrl']?.toString() ?? '';
    final explorerUrl = parachain['explorerUrl']?.toString() ?? '';

    // Determine supported assets based on parachain type
    final supportedAssets = _getSupportedAssetsForParachain(id, symbol);
    final assetSymbols = _getAssetSymbolsForParachain(supportedAssets);

    return XcmChainInfo(
      id: id,
      name: name,
      symbol: symbol,
      rpcUrl: rpcUrl,
      explorerUrl: explorerUrl,
      isRelayChain: false,
      supportedAssets: supportedAssets,
      assetSymbols: assetSymbols,
    );
  }

  /// Get supported assets for a parachain
  static List<String> _getSupportedAssetsForParachain(
    String id,
    String symbol,
  ) {
    final assets = <String>[symbol]; // Always include native asset

    // Add common cross-chain assets based on parachain type
    switch (id.toLowerCase()) {
      case 'moonbeam':
      case 'moonriver':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'astar':
      case 'shiden':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'acala':
      case 'karura':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'parallel':
      case 'heiko':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'bifrost':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'centrifuge':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'equilibrium':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'hydradx':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'interlay':
      case 'kintsugi':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'nodle':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'origin-trail':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'pendulum':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'phala':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'polkadex':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'subsocial':
        assets.addAll(['DOT', 'KSM']);
        break;
      case 'zeitgeist':
        assets.addAll(['DOT', 'KSM']);
        break;
      default:
        // For unknown parachains, add common assets
        assets.addAll(['DOT', 'KSM']);
    }

    return assets.toSet().toList(); // Remove duplicates
  }

  /// Get asset symbols mapping for a parachain
  static Map<String, String> _getAssetSymbolsForParachain(List<String> assets) {
    final assetSymbols = <String, String>{};
    for (int i = 0; i < assets.length; i++) {
      assetSymbols[i.toString()] = assets[i];
    }
    return assetSymbols;
  }

  /// Get active parachains from network
  static Future<List<Map<String, dynamic>>>
  _getActiveParachainsFromNetwork() async {
    try {
      // In a real implementation, this would query the Polkadot/Kusama network
      // to get the list of active parachains. For now, we'll return a comprehensive
      // list of known parachains that are typically active.

      return [
        {
          'id': 'moonbeam',
          'name': 'Moonbeam',
          'symbol': 'GLMR',
          'rpcUrl': 'wss://wss.api.moonbeam.network',
          'explorerUrl': 'https://moonbeam.moonscan.io',
          'isActive': true,
        },
        {
          'id': 'moonriver',
          'name': 'Moonriver',
          'symbol': 'MOVR',
          'rpcUrl': 'wss://wss.moonriver.moonbeam.network',
          'explorerUrl': 'https://moonriver.moonscan.io',
          'isActive': true,
        },
        {
          'id': 'astar',
          'name': 'Astar',
          'symbol': 'ASTR',
          'rpcUrl': 'wss://rpc.astar.network',
          'explorerUrl': 'https://astar.subscan.io',
          'isActive': true,
        },
        {
          'id': 'shiden',
          'name': 'Shiden',
          'symbol': 'SDN',
          'rpcUrl': 'wss://rpc.shiden.astar.network',
          'explorerUrl': 'https://shiden.subscan.io',
          'isActive': true,
        },
        {
          'id': 'acala',
          'name': 'Acala',
          'symbol': 'ACA',
          'rpcUrl': 'wss://acala-rpc-0.aca-api.network',
          'explorerUrl': 'https://acala.subscan.io',
          'isActive': true,
        },
        {
          'id': 'karura',
          'name': 'Karura',
          'symbol': 'KAR',
          'rpcUrl': 'wss://karura-rpc-0.aca-api.network',
          'explorerUrl': 'https://karura.subscan.io',
          'isActive': true,
        },
        {
          'id': 'parallel',
          'name': 'Parallel',
          'symbol': 'PARA',
          'rpcUrl': 'wss://rpc.parallel.fi',
          'explorerUrl': 'https://parallel.subscan.io',
          'isActive': true,
        },
        {
          'id': 'heiko',
          'name': 'Heiko',
          'symbol': 'HKO',
          'rpcUrl': 'wss://heiko-rpc.parallel.fi',
          'explorerUrl': 'https://heiko.subscan.io',
          'isActive': true,
        },
        {
          'id': 'bifrost',
          'name': 'Bifrost',
          'symbol': 'BNC',
          'rpcUrl': 'wss://bifrost-rpc.liebi.com/ws',
          'explorerUrl': 'https://bifrost.subscan.io',
          'isActive': true,
        },
        {
          'id': 'centrifuge',
          'name': 'Centrifuge',
          'symbol': 'CFG',
          'rpcUrl': 'wss://fullnode.centrifuge.io',
          'explorerUrl': 'https://centrifuge.subscan.io',
          'isActive': true,
        },
        {
          'id': 'equilibrium',
          'name': 'Equilibrium',
          'symbol': 'EQ',
          'rpcUrl': 'wss://node.pol.equilibrium.io',
          'explorerUrl': 'https://equilibrium.subscan.io',
          'isActive': true,
        },
        {
          'id': 'hydradx',
          'name': 'HydraDX',
          'symbol': 'HDX',
          'rpcUrl': 'wss://rpc.hydradx.cloud',
          'explorerUrl': 'https://hydradx.subscan.io',
          'isActive': true,
        },
        {
          'id': 'interlay',
          'name': 'Interlay',
          'symbol': 'INTR',
          'rpcUrl': 'wss://api.interlay.io/parachain',
          'explorerUrl': 'https://interlay.subscan.io',
          'isActive': true,
        },
        {
          'id': 'kintsugi',
          'name': 'Kintsugi',
          'symbol': 'KINT',
          'rpcUrl': 'wss://api-kusama.interlay.io/parachain',
          'explorerUrl': 'https://kintsugi.subscan.io',
          'isActive': true,
        },
        {
          'id': 'nodle',
          'name': 'Nodle',
          'symbol': 'NODL',
          'rpcUrl': 'wss://nodle-parachain.api.onfinality.io/public-ws',
          'explorerUrl': 'https://nodle.subscan.io',
          'isActive': true,
        },
        {
          'id': 'origin-trail',
          'name': 'OriginTrail',
          'symbol': 'OTP',
          'rpcUrl': 'wss://parachain-rpc.origin-trail.network',
          'explorerUrl': 'https://origintrail.subscan.io',
          'isActive': true,
        },
        {
          'id': 'pendulum',
          'name': 'Pendulum',
          'symbol': 'PEN',
          'rpcUrl': 'wss://rpc-pendulum.prd.pendulumchain.tech',
          'explorerUrl': 'https://pendulum.subscan.io',
          'isActive': true,
        },
        {
          'id': 'phala',
          'name': 'Phala Network',
          'symbol': 'PHA',
          'rpcUrl': 'wss://api.phala.network/ws',
          'explorerUrl': 'https://phala.subscan.io',
          'isActive': true,
        },
        {
          'id': 'polkadex',
          'name': 'Polkadex',
          'symbol': 'PDEX',
          'rpcUrl': 'wss://mainnet.polkadex.trade',
          'explorerUrl': 'https://polkadex.subscan.io',
          'isActive': true,
        },
        {
          'id': 'subsocial',
          'name': 'Subsocial',
          'symbol': 'SUB',
          'rpcUrl': 'wss://rpc.subsocial.network',
          'explorerUrl': 'https://subsocial.subscan.io',
          'isActive': true,
        },
        {
          'id': 'zeitgeist',
          'name': 'Zeitgeist',
          'symbol': 'ZTG',
          'rpcUrl': 'wss://rpc-0.zeitgeist.pm',
          'explorerUrl': 'https://zeitgeist.subscan.io',
          'isActive': true,
        },
      ];
    } catch (e) {
      debugPrint('Error fetching parachains from network: $e');
      return [];
    }
  }

  /// Get default chains as fallback
  static List<XcmChainInfo> _getDefaultChains() {
    return [
      ..._getRelayChains(),
      const XcmChainInfo(
        id: 'moonbeam',
        name: 'Moonbeam',
        symbol: 'GLMR',
        rpcUrl: 'wss://wss.api.moonbeam.network',
        explorerUrl: 'https://moonbeam.moonscan.io',
        isRelayChain: false,
        supportedAssets: ['GLMR', 'DOT', 'KSM'],
        assetSymbols: {'0': 'GLMR', '1': 'DOT', '2': 'KSM'},
      ),
      const XcmChainInfo(
        id: 'astar',
        name: 'Astar',
        symbol: 'ASTR',
        rpcUrl: 'wss://rpc.astar.network',
        explorerUrl: 'https://astar.subscan.io',
        isRelayChain: false,
        supportedAssets: ['ASTR', 'DOT', 'KSM'],
        assetSymbols: {'0': 'ASTR', '1': 'DOT', '2': 'KSM'},
      ),
      const XcmChainInfo(
        id: 'acala',
        name: 'Acala',
        symbol: 'ACA',
        rpcUrl: 'wss://acala-rpc-0.aca-api.network',
        explorerUrl: 'https://acala.subscan.io',
        isRelayChain: false,
        supportedAssets: ['ACA', 'DOT', 'KSM'],
        assetSymbols: {'0': 'ACA', '1': 'DOT', '2': 'KSM'},
      ),
    ];
  }

  /// Get available assets for a chain
  static Future<List<XcmAssetInfo>> getAvailableAssets({
    required String chain,
    required String address,
  }) async {
    try {
      final supportedChains = await getSupportedChains();
      final chainInfo = supportedChains.firstWhere(
        (c) => c.id == chain,
        orElse: () => throw Exception('Unsupported chain: $chain'),
      );

      // Mock asset data - in reality, this would query the chain
      final assets = <XcmAssetInfo>[];

      for (final assetSymbol in chainInfo.supportedAssets) {
        final assetId = chainInfo.assetSymbols.entries
            .firstWhere((e) => e.value == assetSymbol)
            .key;

        assets.add(
          XcmAssetInfo(
            symbol: assetSymbol,
            assetId: assetId,
            chain: chain,
            decimals: '10',
            balance: _generateMockBalance(assetSymbol),
            isNative: assetSymbol == chainInfo.symbol,
          ),
        );
      }

      return assets;
    } catch (e) {
      debugPrint('Error getting available assets: $e');
      return [];
    }
  }

  /// Validate XCM transfer
  static Future<XcmTransferValidation> validateTransfer(
    XcmTransferRequest request,
  ) async {
    try {
      final errors = <String>[];

      // Check if chains are supported
      final supportedChains = await getSupportedChains();
      if (!supportedChains.any((c) => c.id == request.sourceChain)) {
        errors.add('Unsupported source chain: ${request.sourceChain}');
      }
      if (!supportedChains.any((c) => c.id == request.destinationChain)) {
        errors.add(
          'Unsupported destination chain: ${request.destinationChain}',
        );
      }

      // Check if source and destination are different
      if (request.sourceChain == request.destinationChain) {
        errors.add('Source and destination chains must be different');
      }

      // Check if asset is supported on source chain
      final sourceChain = supportedChains.firstWhere(
        (c) => c.id == request.sourceChain,
        orElse: () => throw Exception('Source chain not found'),
      );
      if (!sourceChain.supportedAssets.contains(request.assetSymbol)) {
        errors.add(
          'Asset ${request.assetSymbol} not supported on ${request.sourceChain}',
        );
      }

      // Validate amount
      final amount = double.tryParse(request.amount);
      if (amount == null || amount <= 0) {
        errors.add('Invalid amount: ${request.amount}');
      }

      // Check balance (mock validation)
      final assets = await getAvailableAssets(
        chain: request.sourceChain,
        address: request.sourceAddress,
      );
      final asset = assets.firstWhere(
        (a) => a.symbol == request.assetSymbol,
        orElse: () => throw Exception('Asset not found'),
      );

      final balance = double.tryParse(asset.balance) ?? 0;
      if (amount != null && amount > balance) {
        errors.add(
          'Insufficient balance. Available: ${asset.balance} ${request.assetSymbol}',
        );
      }

      return XcmTransferValidation(
        isValid: errors.isEmpty,
        errors: errors,
        estimatedFee: _estimateTransferFee(request),
        estimatedTime: _estimateTransferTime(request),
        isSupported: errors.isEmpty,
      );
    } catch (e) {
      debugPrint('Error validating transfer: $e');
      return XcmTransferValidation(
        isValid: false,
        errors: ['Validation error: $e'],
        isSupported: false,
      );
    }
  }

  /// Initiate XCM transfer
  static Future<XcmTransferResult> initiateTransfer(
    XcmTransferRequest request,
  ) async {
    try {
      // Validate transfer first
      final validation = await validateTransfer(request);
      if (!validation.isValid) {
        return XcmTransferResult(
          success: false,
          errorMessage: validation.errors.join(', '),
          status: XcmTransferStatus.failed,
        );
      }

      // Generate transfer ID
      final transferId = _generateTransferId();

      // Create XCM transfer record
      final xcmTransfer = XcmTransfer()
        ..transferId = transferId
        ..sourceChain = request.sourceChain
        ..destinationChain = request.destinationChain
        ..type = request.type
        ..status = XcmTransferStatus.initiated
        ..direction = XcmTransferDirection.outbound
        ..sourceAddress = request.sourceAddress
        ..destinationAddress = request.destinationAddress
        ..assetSymbol = request.assetSymbol
        ..amount = request.amount
        ..transferFee = validation.estimatedFee ?? '0.1'
        ..xcmFee = '0.05'
        ..timestamp = DateTime.now()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      // Save to database
      await DatabaseService.saveXcmTransfer(xcmTransfer);

      // Start transfer process
      _processTransfer(xcmTransfer);

      return XcmTransferResult(
        success: true,
        transferId: transferId,
        status: XcmTransferStatus.initiated,
        sourceTransactionHash: _generateMockHash(),
        xcmMessageHash: _generateMockHash(),
      );
    } catch (e) {
      debugPrint('Error initiating transfer: $e');
      return XcmTransferResult(
        success: false,
        errorMessage: 'Failed to initiate transfer: $e',
        status: XcmTransferStatus.failed,
      );
    }
  }

  /// Get transfer progress
  static Future<XcmTransferProgress?> getTransferProgress(
    String transferId,
  ) async {
    try {
      final transfer = await DatabaseService.getXcmTransferByTransferId(
        transferId,
      );
      if (transfer == null) return null;

      return _calculateProgress(transfer);
    } catch (e) {
      debugPrint('Error getting transfer progress: $e');
      return null;
    }
  }

  /// Get transfer history
  static Future<List<XcmTransfer>> getTransferHistory({
    String? address,
    String? chain,
    XcmTransferType? type,
    XcmTransferStatus? status,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      return await DatabaseService.getXcmTransferHistory(
        address: address,
        chain: chain,
        type: type,
        status: status,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      debugPrint('Error getting transfer history: $e');
      return [];
    }
  }

  /// Get transfer statistics
  static Future<XcmTransferStats> getTransferStats(String address) async {
    try {
      final transfers = await getTransferHistory(address: address);

      final totalTransfers = transfers.length;
      final successfulTransfers = transfers
          .where((t) => t.status == XcmTransferStatus.confirmed)
          .length;
      final failedTransfers = transfers
          .where((t) => t.status == XcmTransferStatus.failed)
          .length;
      final pendingTransfers = transfers
          .where(
            (t) =>
                t.status == XcmTransferStatus.initiated ||
                t.status == XcmTransferStatus.processing,
          )
          .length;

      final transfersByChain = <String, int>{};
      final transfersByType = <String, int>{};
      double totalVolume = 0;
      double totalFees = 0;

      for (final transfer in transfers) {
        // Count by chain
        transfersByChain[transfer.sourceChain] =
            (transfersByChain[transfer.sourceChain] ?? 0) + 1;

        // Count by type
        transfersByType[transfer.type.name] =
            (transfersByType[transfer.type.name] ?? 0) + 1;

        // Calculate volume and fees
        totalVolume += double.tryParse(transfer.amount) ?? 0;
        totalFees += double.tryParse(transfer.transferFee) ?? 0;
      }

      return XcmTransferStats(
        totalTransfers: totalTransfers,
        successfulTransfers: successfulTransfers,
        failedTransfers: failedTransfers,
        pendingTransfers: pendingTransfers,
        transfersByChain: transfersByChain,
        transfersByType: transfersByType,
        totalVolume: totalVolume.toString(),
        totalFees: totalFees.toString(),
      );
    } catch (e) {
      debugPrint('Error getting transfer stats: $e');
      return const XcmTransferStats(
        totalTransfers: 0,
        successfulTransfers: 0,
        failedTransfers: 0,
        pendingTransfers: 0,
        transfersByChain: {},
        transfersByType: {},
        totalVolume: '0',
        totalFees: '0',
      );
    }
  }

  /// Process transfer (simulated)
  static Future<void> _processTransfer(XcmTransfer transfer) async {
    try {
      // Simulate transfer processing steps
      await _updateTransferStatus(
        transfer.transferId,
        XcmTransferStatus.processing,
      );
      await Future.delayed(const Duration(seconds: 3));

      // Simulate XCM message processing
      await Future.delayed(const Duration(seconds: 5));

      // Simulate completion (90% success rate)
      final isSuccess = Random().nextDouble() > 0.1;
      if (isSuccess) {
        await _updateTransferStatus(
          transfer.transferId,
          XcmTransferStatus.confirmed,
        );
        await _updateTransferConfirmation(transfer.transferId, DateTime.now());
      } else {
        await _updateTransferStatus(
          transfer.transferId,
          XcmTransferStatus.failed,
          errorMessage: 'XCM transfer failed: Insufficient liquidity',
        );
      }
    } catch (e) {
      debugPrint('Error processing transfer: $e');
      await _updateTransferStatus(
        transfer.transferId,
        XcmTransferStatus.failed,
        errorMessage: 'Transfer processing error: $e',
      );
    }
  }

  /// Update transfer status
  static Future<void> _updateTransferStatus(
    String transferId,
    XcmTransferStatus status, {
    String? errorMessage,
  }) async {
    try {
      final transfer = await DatabaseService.getXcmTransferByTransferId(
        transferId,
      );
      if (transfer != null) {
        transfer.status = status;
        transfer.updatedAt = DateTime.now();
        if (errorMessage != null) {
          transfer.errorMessage = errorMessage;
        }
        await DatabaseService.updateXcmTransfer(transfer);
      }
    } catch (e) {
      debugPrint('Error updating transfer status: $e');
    }
  }

  /// Update transfer confirmation
  static Future<void> _updateTransferConfirmation(
    String transferId,
    DateTime confirmationTime,
  ) async {
    try {
      final transfer = await DatabaseService.getXcmTransferByTransferId(
        transferId,
      );
      if (transfer != null) {
        transfer.confirmationTimestamp = confirmationTime;
        transfer.updatedAt = DateTime.now();
        await DatabaseService.updateXcmTransfer(transfer);
      }
    } catch (e) {
      debugPrint('Error updating transfer confirmation: $e');
    }
  }

  /// Calculate transfer progress
  static XcmTransferProgress _calculateProgress(XcmTransfer transfer) {
    int currentStep = 1;
    int totalSteps = 4;
    String currentStepDescription = 'Transfer initiated';
    double progressPercentage = 0.25;

    switch (transfer.status) {
      case XcmTransferStatus.initiated:
        currentStep = 1;
        currentStepDescription = 'Transfer initiated';
        progressPercentage = 0.25;
        break;
      case XcmTransferStatus.processing:
        currentStep = 2;
        currentStepDescription = 'XCM message processing';
        progressPercentage = 0.5;
        break;
      case XcmTransferStatus.confirmed:
        currentStep = 4;
        currentStepDescription = 'Transfer confirmed';
        progressPercentage = 1.0;
        break;
      case XcmTransferStatus.failed:
        currentStep = 3;
        currentStepDescription = 'Transfer failed';
        progressPercentage = 0.75;
        break;
      case XcmTransferStatus.cancelled:
        currentStep = 2;
        currentStepDescription = 'Transfer cancelled';
        progressPercentage = 0.5;
        break;
    }

    return XcmTransferProgress(
      transferId: transfer.transferId,
      status: transfer.status,
      currentStep: currentStep,
      totalSteps: totalSteps,
      currentStepDescription: currentStepDescription,
      progressPercentage: progressPercentage,
      lastUpdated: transfer.updatedAt,
      errorMessage: transfer.errorMessage,
    );
  }

  /// Generate transfer ID
  static String _generateTransferId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(10000);
    return 'xcm_${timestamp}_$random';
  }

  /// Generate mock hash
  static String _generateMockHash() {
    final chars = '0123456789abcdef';
    final hash = StringBuffer('0x');
    for (int i = 0; i < 64; i++) {
      hash.write(chars[Random().nextInt(chars.length)]);
    }
    return hash.toString();
  }

  /// Generate mock balance
  static String _generateMockBalance(String assetSymbol) {
    switch (assetSymbol) {
      case 'DOT':
        return (Random().nextDouble() * 100 + 10).toStringAsFixed(4);
      case 'KSM':
        return (Random().nextDouble() * 1000 + 100).toStringAsFixed(4);
      case 'GLMR':
        return (Random().nextDouble() * 1000 + 100).toStringAsFixed(4);
      case 'ASTR':
        return (Random().nextDouble() * 10000 + 1000).toStringAsFixed(4);
      case 'ACA':
        return (Random().nextDouble() * 10000 + 1000).toStringAsFixed(4);
      default:
        return (Random().nextDouble() * 100 + 10).toStringAsFixed(4);
    }
  }

  /// Estimate transfer fee
  static String _estimateTransferFee(XcmTransferRequest request) {
    // Mock fee estimation based on chains and asset
    double baseFee = 0.1;
    if (request.sourceChain == 'polkadot' ||
        request.destinationChain == 'polkadot') {
      baseFee = 0.2;
    }
    return baseFee.toStringAsFixed(4);
  }

  /// Estimate transfer time
  static String _estimateTransferTime(XcmTransferRequest request) {
    // Mock time estimation
    return '2-5 minutes';
  }
}
