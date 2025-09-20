import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/core/models/transfer_models.dart';

/// Database service for managing wallet account metadata
class DatabaseService {
  static Isar? _isar;
  
  /// Initialize Isar database
  static Future<void> initialize() async {
    if (_isar != null) return;
    
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      WalletAccountSchema,
      MnemonicWalletSchema,
      TokenTransferSchema,
      NftTransferSchema,
    ], directory: dir.path);
  }

  /// Get Isar instance
  static Isar get isar {
    if (_isar == null) {
      throw const WalletException(
        type: WalletErrorType.storageError,
        message:
            'Database not initialized. Call DatabaseService.initialize() first.',
      );
    }
    return _isar!;
  }
  
  /// Close database
  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }

  // Wallet Account Operations

  /// Save wallet account
  static Future<void> saveWalletAccount(WalletAccount account) async {
    await isar.writeTxn(() async {
      await isar.walletAccounts.put(account);
    });
  }

  /// Get all wallet accounts
  static Future<List<WalletAccount>> getAllWalletAccounts() async {
    return await isar.walletAccounts.where().findAll();
  }

  /// Get active wallet accounts
  static Future<List<WalletAccount>> getActiveWalletAccounts() async {
    return await isar.walletAccounts.filter().isActiveEqualTo(true).findAll();
  }

  /// Get wallet account by address
  static Future<WalletAccount?> getWalletAccountByAddress(
    String address,
  ) async {
    return await isar.walletAccounts
        .where()
        .addressEqualTo(address)
        .findFirst();
  }

  /// Get wallet account by ID
  static Future<WalletAccount?> getWalletAccountById(int id) async {
    return await isar.walletAccounts.get(id);
  }

  /// Update wallet account
  static Future<void> updateWalletAccount(WalletAccount account) async {
    await isar.writeTxn(() async {
      await isar.walletAccounts.put(account);
    });
  }

  /// Delete wallet account
  static Future<void> deleteWalletAccount(int id) async {
    await isar.writeTxn(() async {
      await isar.walletAccounts.delete(id);
    });
  }

  /// Set active wallet account
  static Future<void> setActiveWalletAccount(String address) async {
    await isar.writeTxn(() async {
      // Deactivate all accounts
      final allAccounts = await isar.walletAccounts.where().findAll();
      for (final account in allAccounts) {
        account.isActive = false;
        await isar.walletAccounts.put(account);
      }

      // Activate selected account
      final targetAccount = await isar.walletAccounts
          .where()
          .addressEqualTo(address)
          .findFirst();

      if (targetAccount != null) {
        targetAccount.isActive = true;
        targetAccount.lastUsed = DateTime.now();
        await isar.walletAccounts.put(targetAccount);
      }
    });
  }

  /// Get active wallet account
  static Future<WalletAccount?> getActiveWalletAccount() async {
    return await isar.walletAccounts.filter().isActiveEqualTo(true).findFirst();
  }

  /// Get accounts by wallet type
  static Future<List<WalletAccount>> getAccountsByType(
    String walletType,
  ) async {
    return await isar.walletAccounts
        .filter()
        .walletTypeEqualTo(walletType)
        .findAll();
  }

  /// Get accounts by mnemonic ID
  static Future<List<WalletAccount>> getAccountsByMnemonicId(
    String mnemonicId,
  ) async {
    return await isar.walletAccounts
        .filter()
        .mnemonicIdEqualTo(mnemonicId)
        .findAll();
  }

  // Mnemonic Wallet Operations

  /// Save mnemonic wallet
  static Future<void> saveMnemonicWallet(MnemonicWallet mnemonicWallet) async {
    await isar.writeTxn(() async {
      await isar.mnemonicWallets.put(mnemonicWallet);
    });
  }

  /// Get all mnemonic wallets
  static Future<List<MnemonicWallet>> getAllMnemonicWallets() async {
    return await isar.mnemonicWallets.where().findAll();
  }
  
  /// Get active mnemonic wallets
  static Future<List<MnemonicWallet>> getActiveMnemonicWallets() async {
    return await isar.mnemonicWallets.filter().isActiveEqualTo(true).findAll();
  }
  
  /// Get mnemonic wallet by ID
  static Future<MnemonicWallet?> getMnemonicWalletById(int id) async {
    return await isar.mnemonicWallets.get(id);
  }
  
  /// Update mnemonic wallet
  static Future<void> updateMnemonicWallet(
    MnemonicWallet mnemonicWallet,
  ) async {
    await isar.writeTxn(() async {
      await isar.mnemonicWallets.put(mnemonicWallet);
    });
  }
  
  /// Delete mnemonic wallet
  static Future<void> deleteMnemonicWallet(int id) async {
    await isar.writeTxn(() async {
      await isar.mnemonicWallets.delete(id);
    });
  }
  
  /// Update account count for mnemonic wallet
  static Future<void> updateMnemonicAccountCount(
    int mnemonicId,
    int count,
  ) async {
    await isar.writeTxn(() async {
      final mnemonicWallet = await isar.mnemonicWallets.get(mnemonicId);
      if (mnemonicWallet != null) {
        mnemonicWallet.accountCount = count;
        mnemonicWallet.lastUsed = DateTime.now();
        await isar.mnemonicWallets.put(mnemonicWallet);
      }
    });
  }
  
  // Utility Operations

  /// Get wallet statistics
  static Future<Map<String, dynamic>> getWalletStatistics() async {
    final totalAccounts = await isar.walletAccounts.count();
    final activeAccounts = await isar.walletAccounts
        .filter()
        .isActiveEqualTo(true)
        .count();
    final mnemonicAccounts = await isar.walletAccounts
        .filter()
        .walletTypeEqualTo('mnemonic')
        .count();
    final privateKeyAccounts = await isar.walletAccounts
        .filter()
        .walletTypeEqualTo('private_key')
        .count();
    final totalMnemonicWallets = await isar.mnemonicWallets.count();

    return {
      'totalAccounts': totalAccounts,
      'activeAccounts': activeAccounts,
      'mnemonicAccounts': mnemonicAccounts,
      'privateKeyAccounts': privateKeyAccounts,
      'totalMnemonicWallets': totalMnemonicWallets,
    };
  }
  
  /// Clear all wallet data
  static Future<void> clearAllWalletData() async {
    await isar.writeTxn(() async {
      await isar.walletAccounts.clear();
      await isar.mnemonicWallets.clear();
    });
  }
  
  /// Export wallet data (for backup)
  static Future<Map<String, dynamic>> exportWalletData() async {
    final accounts = await getAllWalletAccounts();
    final mnemonicWallets = await getAllMnemonicWallets();

    return {
      'accounts': accounts
          .map(
            (a) => {
              'id': a.id,
              'address': a.address,
              'name': a.name,
              'publicKey': a.publicKey,
              'derivationPath': a.derivationPath,
              'accountIndex': a.accountIndex,
              'createdAt': a.createdAt.toIso8601String(),
              'lastUsed': a.lastUsed.toIso8601String(),
              'isActive': a.isActive,
              'walletType': a.walletType,
              'mnemonicId': a.mnemonicId,
            },
          )
          .toList(),
      'mnemonicWallets': mnemonicWallets
          .map(
            (m) => {
              'id': m.id,
              'wordCount': m.wordCount,
              'name': m.name,
              'createdAt': m.createdAt.toIso8601String(),
              'lastUsed': m.lastUsed.toIso8601String(),
              'isActive': m.isActive,
              'accountCount': m.accountCount,
            },
          )
          .toList(),
      'exportedAt': DateTime.now().toIso8601String(),
    };
  }

  /// Search accounts by name or address
  static Future<List<WalletAccount>> searchAccounts(String query) async {
    if (query.isEmpty) return await getAllWalletAccounts();

    final nameResults = await isar.walletAccounts
        .filter()
        .nameContains(query, caseSensitive: false)
        .findAll();

    final addressResults = await isar.walletAccounts
        .filter()
        .addressContains(query, caseSensitive: false)
        .findAll();

    // Combine and remove duplicates
    final allResults = <WalletAccount>[];
    final seenIds = <int>{};

    for (final account in [...nameResults, ...addressResults]) {
      if (!seenIds.contains(account.id)) {
        allResults.add(account);
        seenIds.add(account.id);
      }
    }
    
    return allResults;
  }

  // Token Transfer Operations

  /// Save token transfer
  static Future<void> saveTokenTransfer(TokenTransfer transfer) async {
    await isar.writeTxn(() async {
      await isar.tokenTransfers.put(transfer);
    });
  }

  /// Get token transfer by hash
  static Future<TokenTransfer?> getTokenTransferByHash(
    String transactionHash,
  ) async {
    return await isar.tokenTransfers
        .where()
        .transactionHashEqualTo(transactionHash)
        .findFirst();
  }

  /// Get token transfer history
  static Future<List<TokenTransfer>> getTokenTransferHistory({
    String? address,
    String? chain,
    int limit = 50,
  }) async {
    if (address != null && chain != null) {
      return await isar.tokenTransfers
          .filter()
          .fromAddressEqualTo(address)
          .or()
          .toAddressEqualTo(address)
          .and()
          .chainEqualTo(chain)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else if (address != null) {
      return await isar.tokenTransfers
          .filter()
          .fromAddressEqualTo(address)
          .or()
          .toAddressEqualTo(address)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else if (chain != null) {
      return await isar.tokenTransfers
          .filter()
          .chainEqualTo(chain)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else {
      return await isar.tokenTransfers
          .where()
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    }
  }

  /// Update token transfer
  static Future<void> updateTokenTransfer(TokenTransfer transfer) async {
    await isar.writeTxn(() async {
      await isar.tokenTransfers.put(transfer);
    });
  }

  /// Delete token transfer
  static Future<void> deleteTokenTransfer(int id) async {
    await isar.writeTxn(() async {
      await isar.tokenTransfers.delete(id);
    });
  }

  // NFT Transfer Operations

  /// Save NFT transfer
  static Future<void> saveNftTransfer(NftTransfer transfer) async {
    await isar.writeTxn(() async {
      await isar.nftTransfers.put(transfer);
    });
  }

  /// Get NFT transfer by hash
  static Future<NftTransfer?> getNftTransferByHash(
    String transactionHash,
  ) async {
    return await isar.nftTransfers
        .where()
        .transactionHashEqualTo(transactionHash)
        .findFirst();
  }

  /// Get NFT transfer history
  static Future<List<NftTransfer>> getNftTransferHistory({
    String? address,
    String? chain,
    int limit = 50,
  }) async {
    if (address != null && chain != null) {
      return await isar.nftTransfers
          .filter()
          .fromAddressEqualTo(address)
          .or()
          .toAddressEqualTo(address)
          .and()
          .chainEqualTo(chain)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else if (address != null) {
      return await isar.nftTransfers
          .filter()
          .fromAddressEqualTo(address)
          .or()
          .toAddressEqualTo(address)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else if (chain != null) {
      return await isar.nftTransfers
          .filter()
          .chainEqualTo(chain)
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    } else {
      return await isar.nftTransfers
          .where()
          .sortByTimestampDesc()
          .limit(limit)
          .findAll();
    }
  }

  /// Update NFT transfer
  static Future<void> updateNftTransfer(NftTransfer transfer) async {
    await isar.writeTxn(() async {
      await isar.nftTransfers.put(transfer);
    });
  }

  /// Delete NFT transfer
  static Future<void> deleteNftTransfer(int id) async {
    await isar.writeTxn(() async {
      await isar.nftTransfers.delete(id);
    });
  }

  /// Get all transfers (tokens and NFTs) for an address
  static Future<List<dynamic>> getAllTransfers({
    required String address,
    String? chain,
    int limit = 50,
  }) async {
    final tokenTransfers = await getTokenTransferHistory(
      address: address,
      chain: chain,
      limit: limit,
    );

    final nftTransfers = await getNftTransferHistory(
      address: address,
      chain: chain,
      limit: limit,
    );

    // Combine and sort by timestamp
    final allTransfers = <dynamic>[...tokenTransfers, ...nftTransfers];
    allTransfers.sort((a, b) {
      final aTime = a is TokenTransfer
          ? a.timestamp
          : (a as NftTransfer).timestamp;
      final bTime = b is TokenTransfer
          ? b.timestamp
          : (b as NftTransfer).timestamp;
      return bTime.compareTo(aTime);
    });

    return allTransfers.take(limit).toList();
  }

  /// Get transfer statistics
  static Future<Map<String, dynamic>> getTransferStatistics() async {
    final totalTokenTransfers = await isar.tokenTransfers.count();
    final totalNftTransfers = await isar.nftTransfers.count();

    final pendingTokenTransfers = await isar.tokenTransfers
        .filter()
        .statusEqualTo(TransferStatus.pending)
        .count();

    final pendingNftTransfers = await isar.nftTransfers
        .filter()
        .statusEqualTo(TransferStatus.pending)
        .count();

    return {
      'totalTokenTransfers': totalTokenTransfers,
      'totalNftTransfers': totalNftTransfers,
      'pendingTokenTransfers': pendingTokenTransfers,
      'pendingNftTransfers': pendingNftTransfers,
      'totalTransfers': totalTokenTransfers + totalNftTransfers,
      'pendingTransfers': pendingTokenTransfers + pendingNftTransfers,
    };
  }
}
