import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/core/models/transfer_models.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/models/news_models.dart';

/// Database service for managing wallet account metadata
class DatabaseService {
  static Database? _database;
  
  /// Initialize SQLite database
  static Future<void> initialize() async {
    if (_database != null) return;
    
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'kifepool.db');
    
    _database = await openDatabase(path, version: 1, onCreate: _createTables);
  }

  /// Create database tables
  static Future<void> _createTables(Database db, int version) async {
    // Wallet accounts table
    await db.execute('''
      CREATE TABLE wallet_accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        address TEXT NOT NULL,
        public_key TEXT,
        account_type TEXT NOT NULL,
        is_active INTEGER NOT NULL DEFAULT 1,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Mnemonic wallets table
    await db.execute('''
      CREATE TABLE mnemonic_wallets (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        encrypted_mnemonic TEXT NOT NULL,
        word_count INTEGER NOT NULL,
        name TEXT NOT NULL,
        account_count INTEGER NOT NULL DEFAULT 0,
        is_active INTEGER NOT NULL DEFAULT 1,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Token transfers table
    await db.execute('''
      CREATE TABLE token_transfers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        from_address TEXT NOT NULL,
        to_address TEXT NOT NULL,
        amount TEXT NOT NULL,
        token_symbol TEXT NOT NULL,
        token_name TEXT NOT NULL,
        chain TEXT NOT NULL,
        block_number TEXT,
        transaction_hash TEXT NOT NULL,
        status TEXT NOT NULL,
        direction TEXT NOT NULL,
        gas_fee TEXT,
        gas_used TEXT,
        timestamp TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT
      )
    ''');

    // NFT transfers table
    await db.execute('''
      CREATE TABLE nft_transfers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        from_address TEXT NOT NULL,
        to_address TEXT NOT NULL,
        nft_id TEXT NOT NULL,
        collection_id TEXT NOT NULL,
        nft_name TEXT NOT NULL,
        nft_image TEXT,
        chain TEXT NOT NULL,
        block_number TEXT,
        transaction_hash TEXT NOT NULL,
        status TEXT NOT NULL,
        direction TEXT NOT NULL,
        gas_fee TEXT,
        gas_used TEXT,
        timestamp TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT
      )
    ''');

    // Transaction history table
    await db.execute('''
      CREATE TABLE transaction_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hash TEXT NOT NULL UNIQUE,
        from_address TEXT NOT NULL,
        to_address TEXT NOT NULL,
        amount TEXT NOT NULL,
        token_symbol TEXT NOT NULL,
        transaction_type TEXT NOT NULL,
        status TEXT NOT NULL,
        direction TEXT NOT NULL,
        block_number INTEGER NOT NULL,
        chain TEXT NOT NULL,
        timestamp TEXT NOT NULL,
        gas_used TEXT NOT NULL,
        gas_fee TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT
      )
    ''');

    // XCM transfers table
    await db.execute('''
      CREATE TABLE xcm_transfers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transfer_id TEXT NOT NULL UNIQUE,
        from_chain TEXT NOT NULL,
        to_chain TEXT NOT NULL,
        from_address TEXT NOT NULL,
        to_address TEXT NOT NULL,
        amount TEXT NOT NULL,
        token_symbol TEXT NOT NULL,
        status TEXT NOT NULL,
        type TEXT NOT NULL,
        direction TEXT NOT NULL,
        source_transaction_hash TEXT,
        destination_transaction_hash TEXT,
        xcm_message_hash TEXT,
        transfer_fee TEXT,
        xcm_fee TEXT,
        timestamp TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT
      )
    ''');

    // News articles table
    await db.execute('''
      CREATE TABLE news_articles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        article_id TEXT NOT NULL UNIQUE,
        title TEXT NOT NULL,
        excerpt TEXT,
        content TEXT,
        author TEXT,
        source TEXT,
        source_url TEXT,
        article_url TEXT,
        image_url TEXT,
        published_at TEXT NOT NULL,
        fetched_at TEXT NOT NULL,
        category TEXT NOT NULL,
        news_source TEXT NOT NULL,
        is_read INTEGER NOT NULL DEFAULT 0,
        is_bookmarked INTEGER NOT NULL DEFAULT 0,
        view_count INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Featured projects table
    await db.execute('''
      CREATE TABLE featured_projects (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        project_id TEXT NOT NULL UNIQUE,
        name TEXT NOT NULL,
        description TEXT,
        short_description TEXT,
        logo_url TEXT,
        banner_url TEXT,
        website_url TEXT,
        twitter_url TEXT,
        discord_url TEXT,
        github_url TEXT,
        tags TEXT,
        category TEXT NOT NULL,
        status TEXT NOT NULL,
        chain TEXT,
        featured_at TEXT,
        is_active INTEGER NOT NULL DEFAULT 1,
        priority INTEGER NOT NULL DEFAULT 0,
        view_count INTEGER NOT NULL DEFAULT 0,
        click_count INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');
  }

  /// Get database instance
  static Database get database {
    if (_database == null) {
      throw Exception('Database not initialized. Call initialize() first.');
    }
    return _database!;
  }

  // Wallet Account Methods
  static Future<void> saveWalletAccount(WalletAccount account) async {
    await database.insert('wallet_accounts', {
      'name': account.name,
      'address': account.address,
      'public_key': account.publicKey,
      'account_type': account.walletType,
      'is_active': account.isActive ? 1 : 0,
      'created_at': account.createdAt.toIso8601String(),
      'updated_at': account.lastUsed.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<WalletAccount>> getWalletAccounts() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'wallet_accounts',
    );
    return maps
        .map(
          (map) => WalletAccount()
            ..name = map['name'] as String
            ..address = map['address'] as String
            ..publicKey = map['public_key'] as String? ?? ''
            ..walletType = map['account_type'] as String
            ..isActive = (map['is_active'] as int) == 1
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..lastUsed = DateTime.parse(map['updated_at'] as String),
        )
        .toList();
  }

  static Future<void> deleteWalletAccount(String address) async {
    await database.delete(
      'wallet_accounts',
      where: 'address = ?',
      whereArgs: [address],
    );
  }

  static Future<List<WalletAccount>> getActiveWalletAccounts() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'wallet_accounts',
      where: 'is_active = 1',
    );
    return maps
        .map(
          (map) => WalletAccount()
            ..name = map['name'] as String
            ..address = map['address'] as String
            ..publicKey = map['public_key'] as String? ?? ''
            ..walletType = map['account_type'] as String
            ..isActive = (map['is_active'] as int) == 1
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..lastUsed = DateTime.parse(map['updated_at'] as String),
        )
        .toList();
  }

  static Future<WalletAccount?> getActiveWalletAccount() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'wallet_accounts',
      where: 'is_active = 1',
      limit: 1,
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    return WalletAccount()
      ..name = map['name'] as String
      ..address = map['address'] as String
      ..publicKey = map['public_key'] as String? ?? ''
      ..walletType = map['account_type'] as String
      ..isActive = (map['is_active'] as int) == 1
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..lastUsed = DateTime.parse(map['updated_at'] as String);
  }

  static Future<void> setActiveWalletAccount(String address) async {
    // First, set all accounts to inactive
    await database.update('wallet_accounts', {'is_active': 0});
    
    // Then set the specified account as active
    await database.update(
      'wallet_accounts',
      {'is_active': 1, 'updated_at': DateTime.now().toIso8601String()},
      where: 'address = ?',
      whereArgs: [address],
    );
  }

  static Future<WalletAccount?> getWalletAccountById(String address) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'wallet_accounts',
      where: 'address = ?',
      whereArgs: [address],
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    return WalletAccount()
      ..name = map['name'] as String
      ..address = map['address'] as String
      ..publicKey = map['public_key'] as String? ?? ''
      ..walletType = map['account_type'] as String
      ..isActive = (map['is_active'] as int) == 1
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..lastUsed = DateTime.parse(map['updated_at'] as String);
  }

  static Future<void> updateWalletAccount(WalletAccount account) async {
    await database.update(
      'wallet_accounts',
      {
        'name': account.name,
        'public_key': account.publicKey,
        'account_type': account.walletType,
        'is_active': account.isActive ? 1 : 0,
        'updated_at': account.lastUsed.toIso8601String(),
      },
      where: 'address = ?',
      whereArgs: [account.address],
    );
  }

  static Future<void> clearAllWalletData() async {
    await database.delete('wallet_accounts');
    await database.delete('mnemonic_wallets');
  }

  // Mnemonic Wallet Methods
  static Future<void> saveMnemonicWallet(MnemonicWallet wallet) async {
    await database.insert('mnemonic_wallets', {
      'encrypted_mnemonic': wallet.encryptedMnemonic,
      'word_count': wallet.wordCount,
      'name': wallet.name,
      'account_count': wallet.accountCount,
      'is_active': wallet.isActive ? 1 : 0,
      'created_at': wallet.createdAt.toIso8601String(),
      'updated_at': wallet.lastUsed.toIso8601String(),
    },
      conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<MnemonicWallet?> getMnemonicWallet(String name) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'mnemonic_wallets',
      where: 'name = ?',
      whereArgs: [name],
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    return MnemonicWallet()
      ..encryptedMnemonic = map['encrypted_mnemonic'] as String
      ..wordCount = map['word_count'] as int
      ..name = map['name'] as String
      ..accountCount = map['account_count'] as int
      ..isActive = (map['is_active'] as int) == 1
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..lastUsed = DateTime.parse(map['updated_at'] as String);
  }

  // Token Transfer Methods
  static Future<void> saveTokenTransfer(TokenTransfer transfer) async {
    await database.insert('token_transfers', {
      'from_address': transfer.fromAddress,
      'to_address': transfer.toAddress,
      'amount': transfer.amount,
      'token_symbol': transfer.tokenSymbol,
      'token_name': transfer.tokenName,
      'chain': transfer.chain,
      'block_number': transfer.blockNumber,
      'transaction_hash': transfer.transactionHash,
      'status': transfer.status.name,
      'direction': transfer.direction.name,
      'gas_fee': transfer.gasFee,
      'gas_used': transfer.gasUsed,
      'timestamp': transfer.timestamp.toIso8601String(),
      'created_at': transfer.createdAt.toIso8601String(),
      'updated_at': transfer.updatedAt?.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<TokenTransfer>> getTokenTransfers() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'token_transfers',
      orderBy: 'created_at DESC',
    );
    
    return maps
        .map(
          (map) => TokenTransfer()
            ..fromAddress = map['from_address'] as String
            ..toAddress = map['to_address'] as String
            ..amount = map['amount'] as String
            ..tokenSymbol = map['token_symbol'] as String
            ..tokenName = map['token_name'] as String
            ..chain = map['chain'] as String
            ..blockNumber = map['block_number'] as String?
            ..transactionHash = map['transaction_hash'] as String
            ..status = TransferStatus.values.firstWhere(
              (e) => e.name == map['status'],
              orElse: () => TransferStatus.pending,
            )
            ..direction = TransferDirection.values.firstWhere(
              (e) => e.name == map['direction'],
              orElse: () => TransferDirection.send,
            )
            ..gasFee = map['gas_fee'] as String?
            ..gasUsed = map['gas_used'] as String?
            ..timestamp = DateTime.parse(map['timestamp'] as String)
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = map['updated_at'] != null
                ? DateTime.parse(map['updated_at'] as String)
                : DateTime.now(),
        )
        .toList();
  }

  static Future<List<TokenTransfer>> getTokenTransferHistory({
    String? address,
    String? chain,
    String? type,
    String? status,
    String? direction,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    // For now, just return all transfers
    // TODO: Implement filtering based on parameters
    return getTokenTransfers();
  }

  static Future<TokenTransfer?> getTokenTransferByHash(String hash) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'token_transfers',
      where: 'transaction_hash = ?',
      whereArgs: [hash],
    );

    if (maps.isEmpty) return null;

    final map = maps.first;
    return TokenTransfer()
      ..fromAddress = map['from_address'] as String
      ..toAddress = map['to_address'] as String
      ..amount = map['amount'] as String
      ..tokenSymbol = map['token_symbol'] as String
      ..tokenName = map['token_name'] as String
      ..chain = map['chain'] as String
      ..blockNumber = map['block_number'] as String?
      ..transactionHash = map['transaction_hash'] as String
      ..status = TransferStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => TransferStatus.pending,
      )
      ..direction = TransferDirection.values.firstWhere(
        (e) => e.name == map['direction'],
        orElse: () => TransferDirection.send,
      )
      ..gasFee = map['gas_fee'] as String?
      ..gasUsed = map['gas_used'] as String?
      ..timestamp = DateTime.parse(map['timestamp'] as String)
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..updatedAt = map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : DateTime.now();
  }

  static Future<void> updateTokenTransfer(TokenTransfer transfer) async {
    await database.update(
      'token_transfers',
      {
        'from_address': transfer.fromAddress,
        'to_address': transfer.toAddress,
        'amount': transfer.amount,
        'token_symbol': transfer.tokenSymbol,
        'token_name': transfer.tokenName,
        'chain': transfer.chain,
        'block_number': transfer.blockNumber,
        'status': transfer.status.name,
        'direction': transfer.direction.name,
        'gas_fee': transfer.gasFee,
        'gas_used': transfer.gasUsed,
        'timestamp': transfer.timestamp.toIso8601String(),
        'updated_at': transfer.updatedAt?.toIso8601String(),
      },
      where: 'transaction_hash = ?',
      whereArgs: [transfer.transactionHash],
    );
  }

  // NFT Transfer Methods
  static Future<void> saveNftTransfer(NftTransfer transfer) async {
    await database.insert('nft_transfers', {
      'from_address': transfer.fromAddress,
      'to_address': transfer.toAddress,
      'nft_id': transfer.nftId,
      'collection_id': transfer.collectionId,
      'nft_name': transfer.nftName,
      'nft_image': transfer.nftImage,
      'chain': transfer.chain,
      'block_number': transfer.blockNumber,
      'transaction_hash': transfer.transactionHash,
      'status': transfer.status.name,
      'direction': transfer.direction.name,
      'gas_fee': transfer.gasFee,
      'gas_used': transfer.gasUsed,
      'timestamp': transfer.timestamp.toIso8601String(),
      'created_at': transfer.createdAt.toIso8601String(),
      'updated_at': transfer.updatedAt?.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<NftTransfer>> getNftTransfers() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'nft_transfers',
      orderBy: 'created_at DESC',
    );
    
    return maps
        .map(
          (map) => NftTransfer()
            ..fromAddress = map['from_address'] as String
            ..toAddress = map['to_address'] as String
            ..nftId = map['nft_id'] as String
            ..collectionId = map['collection_id'] as String
            ..nftName = map['nft_name'] as String
            ..nftImage = map['nft_image'] as String?
            ..chain = map['chain'] as String
            ..blockNumber = map['block_number'] as String?
            ..transactionHash = map['transaction_hash'] as String
            ..status = TransferStatus.values.firstWhere(
              (e) => e.name == map['status'],
              orElse: () => TransferStatus.pending,
            )
            ..direction = TransferDirection.values.firstWhere(
              (e) => e.name == map['direction'],
              orElse: () => TransferDirection.send,
            )
            ..gasFee = map['gas_fee'] as String?
            ..gasUsed = map['gas_used'] as String?
            ..timestamp = DateTime.parse(map['timestamp'] as String)
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = map['updated_at'] != null
                ? DateTime.parse(map['updated_at'] as String)
                : DateTime.now(),
        )
        .toList();
  }

  static Future<List<NftTransfer>> getNftTransferHistory({
    String? address,
    String? chain,
    String? type,
    String? status,
    String? direction,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    // For now, just return all transfers
    // TODO: Implement filtering based on parameters
    return getNftTransfers();
  }

  static Future<NftTransfer?> getNftTransferByHash(String hash) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'nft_transfers',
      where: 'transaction_hash = ?',
      whereArgs: [hash],
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    return NftTransfer()
      ..fromAddress = map['from_address'] as String
      ..toAddress = map['to_address'] as String
      ..nftId = map['nft_id'] as String
      ..collectionId = map['collection_id'] as String
      ..nftName = map['nft_name'] as String
      ..nftImage = map['nft_image'] as String?
      ..chain = map['chain'] as String
      ..blockNumber = map['block_number'] as String?
      ..transactionHash = map['transaction_hash'] as String
      ..status = TransferStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => TransferStatus.pending,
      )
      ..direction = TransferDirection.values.firstWhere(
        (e) => e.name == map['direction'],
        orElse: () => TransferDirection.send,
      )
      ..gasFee = map['gas_fee'] as String?
      ..gasUsed = map['gas_used'] as String?
      ..timestamp = DateTime.parse(map['timestamp'] as String)
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..updatedAt = map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : DateTime.now();
  }

  static Future<void> updateNftTransfer(NftTransfer transfer) async {
    await database.update(
      'nft_transfers',
      {
        'from_address': transfer.fromAddress,
        'to_address': transfer.toAddress,
        'nft_id': transfer.nftId,
        'collection_id': transfer.collectionId,
        'nft_name': transfer.nftName,
        'nft_image': transfer.nftImage,
        'chain': transfer.chain,
        'block_number': transfer.blockNumber,
        'status': transfer.status.name,
        'direction': transfer.direction.name,
        'gas_fee': transfer.gasFee,
        'gas_used': transfer.gasUsed,
        'timestamp': transfer.timestamp.toIso8601String(),
        'updated_at': transfer.updatedAt?.toIso8601String(),
      },
      where: 'transaction_hash = ?',
      whereArgs: [transfer.transactionHash],
    );
  }

  static Future<List<dynamic>> getAllTransfers({
    String? address,
    String? chain,
    String? type,
    String? status,
    String? direction,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    // Combine token and NFT transfers
    final tokenTransfers = await getTokenTransfers();
    final nftTransfers = await getNftTransfers();
    
    final allTransfers = <dynamic>[];
    allTransfers.addAll(tokenTransfers);
    allTransfers.addAll(nftTransfers);
    
    // Sort by timestamp
    allTransfers.sort((a, b) {
      DateTime aTime, bTime;
      if (a is TokenTransfer) {
        aTime = a.timestamp;
      } else if (a is NftTransfer) {
        aTime = a.timestamp;
      } else {
        return 0;
      }
      
      if (b is TokenTransfer) {
        bTime = b.timestamp;
      } else if (b is NftTransfer) {
        bTime = b.timestamp;
      } else {
        return 0;
      }
      
      return bTime.compareTo(aTime);
    });
    
    return allTransfers;
  }

  // Transaction History Methods
  static Future<void> saveTransactionHistory(
    TransactionHistory transaction,
  ) async {
    await database.insert('transaction_history', {
      'hash': transaction.hash,
      'from_address': transaction.fromAddress,
      'to_address': transaction.toAddress,
      'amount': transaction.amount,
      'token_symbol': transaction.tokenSymbol,
      'transaction_type': transaction.type.name,
      'status': transaction.status.name,
      'direction': transaction.direction.name,
      'block_number': transaction.blockNumber,
      'chain': transaction.chain,
      'timestamp': transaction.timestamp.toIso8601String(),
      'gas_used': transaction.gasUsed,
      'gas_fee': transaction.gasFee,
      'created_at': transaction.createdAt.toIso8601String(),
      'updated_at': transaction.updatedAt.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<TransactionHistory>> getTransactionHistory() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'transaction_history',
      orderBy: 'timestamp DESC',
    );
    
    return maps
        .map(
          (map) => TransactionHistory()
            ..hash = map['hash'] as String
            ..fromAddress = map['from_address'] as String
            ..toAddress = map['to_address'] as String
            ..amount = map['amount'] as String
            ..tokenSymbol = map['token_symbol'] as String
            ..type = TransactionType.values.firstWhere(
              (e) => e.name == map['transaction_type'],
              orElse: () => TransactionType.transfer,
            )
            ..status = TransactionStatus.values.firstWhere(
              (e) => e.name == map['status'],
              orElse: () => TransactionStatus.pending,
            )
            ..direction = TransactionDirection.values.firstWhere(
              (e) => e.name == map['direction'],
              orElse: () => TransactionDirection.outgoing,
            )
            ..blockNumber = map['block_number'] as int
            ..chain = map['chain'] as String
            ..timestamp = DateTime.parse(map['timestamp'] as String)
            ..gasUsed = map['gas_used'] as String
            ..gasFee = map['gas_fee'] as String
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = map['updated_at'] != null
                ? DateTime.parse(map['updated_at'] as String)
                : DateTime.now(),
        )
        .toList();
  }

  static Future<TransactionHistory?> getTransactionByHash(String hash) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'transaction_history',
      where: 'hash = ?',
      whereArgs: [hash],
    );
    
    if (maps.isEmpty) return null;
    
    final map = maps.first;
    return TransactionHistory()
      ..hash = map['hash'] as String
      ..fromAddress = map['from_address'] as String
      ..toAddress = map['to_address'] as String
      ..amount = map['amount'] as String
      ..tokenSymbol = map['token_symbol'] as String
      ..type = TransactionType.values.firstWhere(
        (e) => e.name == map['transaction_type'],
        orElse: () => TransactionType.transfer,
      )
      ..status = TransactionStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => TransactionStatus.pending,
      )
      ..direction = TransactionDirection.values.firstWhere(
        (e) => e.name == map['direction'],
        orElse: () => TransactionDirection.outgoing,
      )
      ..blockNumber = map['block_number'] as int
      ..chain = map['chain'] as String
      ..timestamp = DateTime.parse(map['timestamp'] as String)
      ..gasUsed = map['gas_used'] as String
      ..gasFee = map['gas_fee'] as String
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..updatedAt = map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : DateTime.now();
  }

  static Future<List<TransactionHistory>> getTransactionHistoryWithFilters({
    String? address,
    String? chain,
    String? type,
    String? status,
    String? direction,
    DateTime? fromDate,
    DateTime? toDate,
    int? limit,
    int? offset,
  }) async {
    // For now, just return all transactions
    // TODO: Implement filtering based on parameters
    return getTransactionHistory();
  }

  static Future<void> saveTransaction(TransactionHistory transaction) async {
    await saveTransactionHistory(transaction);
  }

  static Future<DateTime?> getCacheTimestamp(String key) async {
    // Simple cache timestamp storage
    // TODO: Implement proper cache timestamp storage
    return null;
  }

  static Future<void> setCacheTimestamp(String key, DateTime timestamp) async {
    // Simple cache timestamp storage
    // TODO: Implement proper cache timestamp storage
  }

  static Future<void> clearTransactionCache() async {
    // Clear transaction cache
    // TODO: Implement proper cache clearing
  }

  // XCM Transfer Methods
  static Future<void> saveXcmTransfer(XcmTransfer transfer) async {
    await database.insert('xcm_transfers', {
      'transfer_id': transfer.transferId,
      'from_chain': transfer.sourceChain,
      'to_chain': transfer.destinationChain,
      'from_address': transfer.sourceAddress,
      'to_address': transfer.destinationAddress,
      'amount': transfer.amount,
      'token_symbol': transfer.assetSymbol,
      'status': transfer.status.name,
      'type': transfer.type.name,
      'direction': transfer.direction.name,
      'source_transaction_hash': transfer.sourceTransactionHash,
      'destination_transaction_hash': transfer.destinationTransactionHash,
      'xcm_message_hash': transfer.xcmMessageHash,
      'transfer_fee': transfer.transferFee,
      'xcm_fee': transfer.xcmFee,
      'timestamp': transfer.timestamp.toIso8601String(),
      'created_at': transfer.createdAt.toIso8601String(),
      'updated_at': transfer.updatedAt.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<XcmTransfer>> getXcmTransfers() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'xcm_transfers',
      orderBy: 'created_at DESC',
    );
    
    return maps
        .map(
          (map) => XcmTransfer()
            ..transferId = map['transfer_id'] as String
            ..sourceChain = map['from_chain'] as String
            ..destinationChain = map['to_chain'] as String
            ..sourceAddress = map['from_address'] as String
            ..destinationAddress = map['to_address'] as String
            ..amount = map['amount'] as String
            ..assetSymbol = map['token_symbol'] as String
            ..status = XcmTransferStatus.values.firstWhere(
              (e) => e.name == map['status'],
              orElse: () => XcmTransferStatus.initiated,
            )
            ..type = XcmTransferType.values.firstWhere(
              (e) => e.name == map['type'],
              orElse: () => XcmTransferType.token,
            )
            ..direction = XcmTransferDirection.values.firstWhere(
              (e) => e.name == map['direction'],
              orElse: () => XcmTransferDirection.outbound,
            )
            ..sourceTransactionHash = map['source_transaction_hash'] as String?
            ..destinationTransactionHash =
                map['destination_transaction_hash'] as String?
            ..xcmMessageHash = map['xcm_message_hash'] as String?
            ..transferFee = map['transfer_fee'] as String? ?? ''
            ..xcmFee = map['xcm_fee'] as String? ?? ''
            ..timestamp = DateTime.parse(map['timestamp'] as String)
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = map['updated_at'] != null
                ? DateTime.parse(map['updated_at'] as String)
                : DateTime.now(),
        )
        .toList();
  }

  static Future<XcmTransfer?> getXcmTransferByTransferId(
    String transferId,
  ) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'xcm_transfers',
      where: 'transfer_id = ?',
      whereArgs: [transferId],
    );

    if (maps.isEmpty) return null;

    final map = maps.first;
    return XcmTransfer()
      ..transferId = map['transfer_id'] as String
      ..sourceChain = map['from_chain'] as String
      ..destinationChain = map['to_chain'] as String
      ..sourceAddress = map['from_address'] as String
      ..destinationAddress = map['to_address'] as String
      ..amount = map['amount'] as String
      ..assetSymbol = map['token_symbol'] as String
      ..status = XcmTransferStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => XcmTransferStatus.initiated,
      )
      ..type = XcmTransferType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => XcmTransferType.token,
      )
      ..direction = XcmTransferDirection.values.firstWhere(
        (e) => e.name == map['direction'],
        orElse: () => XcmTransferDirection.outbound,
      )
      ..sourceTransactionHash = map['source_transaction_hash'] as String?
      ..destinationTransactionHash =
          map['destination_transaction_hash'] as String?
      ..xcmMessageHash = map['xcm_message_hash'] as String?
      ..transferFee = map['transfer_fee'] as String? ?? ''
      ..xcmFee = map['xcm_fee'] as String? ?? ''
      ..timestamp = DateTime.parse(map['timestamp'] as String)
      ..createdAt = DateTime.parse(map['created_at'] as String)
      ..updatedAt = map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : DateTime.now();
  }

  static Future<List<XcmTransfer>> getXcmTransferHistory({
    String? address,
    String? chain,
    String? type,
    String? status,
    int? limit,
    int? offset,
  }) async {
    // For now, just return all transfers
    // TODO: Implement filtering based on parameters
    return getXcmTransfers();
  }

  static Future<void> updateXcmTransfer(XcmTransfer transfer) async {
    await database.update(
      'xcm_transfers',
      {
        'from_chain': transfer.sourceChain,
        'to_chain': transfer.destinationChain,
        'from_address': transfer.sourceAddress,
        'to_address': transfer.destinationAddress,
        'amount': transfer.amount,
        'token_symbol': transfer.assetSymbol,
        'status': transfer.status.name,
        'type': transfer.type.name,
        'direction': transfer.direction.name,
        'source_transaction_hash': transfer.sourceTransactionHash,
        'destination_transaction_hash': transfer.destinationTransactionHash,
        'xcm_message_hash': transfer.xcmMessageHash,
        'transfer_fee': transfer.transferFee,
        'xcm_fee': transfer.xcmFee,
        'updated_at': DateTime.now().toIso8601String(),
      },
      where: 'transfer_id = ?',
      whereArgs: [transfer.transferId],
    );
  }

  // News Article Methods
  static Future<void> saveNewsArticles(List<NewsArticle> articles) async {
    final batch = database.batch();
    for (final article in articles) {
      batch.insert('news_articles', {
        'article_id': article.articleId,
        'title': article.title,
        'excerpt': article.excerpt,
        'content': article.content,
        'author': article.author,
        'source': article.source,
        'source_url': article.sourceUrl,
        'article_url': article.articleUrl,
        'image_url': article.imageUrl,
        'published_at': article.publishedAt.toIso8601String(),
        'fetched_at': article.fetchedAt.toIso8601String(),
        'category': article.category.name,
        'news_source': article.newsSource.name,
        'is_read': article.isRead ? 1 : 0,
        'is_bookmarked': article.isBookmarked ? 1 : 0,
        'view_count': article.viewCount,
        'created_at': article.createdAt.toIso8601String(),
        'updated_at': article.updatedAt?.toIso8601String(),
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  static Future<List<NewsArticle>> getNewsArticles({NewsFilter? filter}) async {
    String whereClause = '';
    List<dynamic> whereArgs = [];
    
    if (filter != null) {
      final conditions = <String>[];
      
      if (filter.source != null) {
        conditions.add('news_source = ?');
        whereArgs.add(filter.source!.name);
      }
      
      if (filter.category != null) {
        conditions.add('category = ?');
        whereArgs.add(filter.category!.name);
      }
      
      if (filter.bookmarkedOnly == true) {
        conditions.add('is_bookmarked = 1');
      }
      
      if (filter.unreadOnly == true) {
        conditions.add('is_read = 0');
      }
      
      if (conditions.isNotEmpty) {
        whereClause = 'WHERE ${conditions.join(' AND ')}';
      }
    }
    
    final List<Map<String, dynamic>> maps = await database.rawQuery(
      'SELECT * FROM news_articles $whereClause ORDER BY published_at DESC LIMIT ? OFFSET ?',
      [...whereArgs, filter?.limit ?? 50, filter?.offset ?? 0],
    );
    
    return maps
        .map(
          (map) => NewsArticle()
            ..articleId = map['article_id'] as String
            ..title = map['title'] as String
            ..excerpt = map['excerpt'] as String
            ..content = map['content'] as String
            ..author = map['author'] as String
            ..source = map['source'] as String
            ..sourceUrl = map['source_url'] as String
            ..articleUrl = map['article_url'] as String
            ..imageUrl = map['image_url'] as String?
            ..publishedAt = DateTime.parse(map['published_at'] as String)
            ..fetchedAt = DateTime.parse(map['fetched_at'] as String)
            ..category = NewsCategory.values.firstWhere(
              (e) => e.name == map['category'],
              orElse: () => NewsCategory.ecosystem,
            )
            ..newsSource = NewsSource.values.firstWhere(
              (e) => e.name == map['news_source'],
              orElse: () => NewsSource.polkadotBlog,
            )
            ..isRead = (map['is_read'] as int) == 1
            ..isBookmarked = (map['is_bookmarked'] as int) == 1
            ..viewCount = map['view_count'] as int
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = DateTime.parse(map['updated_at'] as String),
        )
        .toList();
  }

  static Future<void> markNewsArticleAsRead(String articleId) async {
    await database.update(
      'news_articles',
      {'is_read': 1, 'updated_at': DateTime.now().toIso8601String()},
      where: 'article_id = ?',
      whereArgs: [articleId],
    );
  }

  static Future<void> toggleNewsArticleBookmark(String articleId) async {
    final result = await database.query(
      'news_articles',
      columns: ['is_bookmarked'],
      where: 'article_id = ?',
      whereArgs: [articleId],
    );

    if (result.isNotEmpty) {
      final currentValue = (result.first['is_bookmarked'] as int) == 1;
      await database.update(
        'news_articles',
        {
          'is_bookmarked': currentValue ? 0 : 1,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'article_id = ?',
        whereArgs: [articleId],
      );
    }
  }

  // Featured Project Methods
  static Future<void> saveFeaturedProjects(
    List<FeaturedProject> projects,
  ) async {
    final batch = database.batch();
    for (final project in projects) {
      batch.insert('featured_projects', {
        'project_id': project.projectId,
        'name': project.name,
        'description': project.description,
        'short_description': project.shortDescription,
        'logo_url': project.logoUrl,
        'banner_url': project.bannerUrl,
        'website_url': project.websiteUrl,
        'twitter_url': project.twitterUrl,
        'discord_url': project.discordUrl,
        'github_url': project.githubUrl,
        'tags': project.tags.join(','),
        'category': project.category.name,
        'status': project.status.name,
        'chain': project.chain,
        'featured_at': project.featuredAt.toIso8601String(),
        'is_active': project.isActive ? 1 : 0,
        'priority': project.priority,
        'view_count': project.viewCount,
        'click_count': project.clickCount,
        'created_at': project.createdAt.toIso8601String(),
        'updated_at': project.updatedAt?.toIso8601String(),
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }

  static Future<List<FeaturedProject>> getFeaturedProjects() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'featured_projects',
      where: 'is_active = 1',
      orderBy: 'priority ASC, featured_at DESC',
    );
    
    return maps
        .map(
          (map) => FeaturedProject()
            ..projectId = map['project_id'] as String
            ..name = map['name'] as String
            ..description = map['description'] as String
            ..shortDescription = map['short_description'] as String
            ..logoUrl = map['logo_url'] as String?
            ..bannerUrl = map['banner_url'] as String?
            ..websiteUrl = map['website_url'] as String
            ..twitterUrl = map['twitter_url'] as String?
            ..discordUrl = map['discord_url'] as String?
            ..githubUrl = map['github_url'] as String?
            ..tags = (map['tags'] as String?)?.split(',') ?? []
            ..category = ProjectCategory.values.firstWhere(
              (e) => e.name == map['category'],
              orElse: () => ProjectCategory.infrastructure,
            )
            ..status = ProjectStatus.values.firstWhere(
              (e) => e.name == map['status'],
              orElse: () => ProjectStatus.active,
            )
            ..chain = map['chain'] as String
            ..featuredAt = DateTime.parse(map['featured_at'] as String)
            ..isActive = (map['is_active'] as int) == 1
            ..priority = map['priority'] as int
            ..viewCount = map['view_count'] as int
            ..clickCount = map['click_count'] as int
            ..createdAt = DateTime.parse(map['created_at'] as String)
            ..updatedAt = DateTime.parse(map['updated_at'] as String),
        )
        .toList();
  }

  static Future<void> incrementFeaturedProjectViewCount(
    String projectId,
  ) async {
    await database.rawUpdate(
      'UPDATE featured_projects SET view_count = view_count + 1, updated_at = ? WHERE project_id = ?',
      [DateTime.now().toIso8601String(), projectId],
    );
  }

  static Future<void> incrementFeaturedProjectClickCount(
    String projectId,
  ) async {
    await database.rawUpdate(
      'UPDATE featured_projects SET click_count = click_count + 1, updated_at = ? WHERE project_id = ?',
      [DateTime.now().toIso8601String(), projectId],
    );
  }

  /// Close database connection
  static Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
