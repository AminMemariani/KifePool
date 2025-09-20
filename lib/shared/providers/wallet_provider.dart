import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/core/services/wallet_service.dart';
import 'package:kifepool/core/services/secure_storage_service.dart';
import 'package:kifepool/core/services/database_service.dart';

/// Wallet provider for managing wallet state
class WalletProvider extends ChangeNotifier {
  List<WalletAccount> _accounts = [];
  WalletAccount? _activeAccount;
  List<ChainBalance> _balances = [];
  bool _isLoading = false;
  String? _error;
  bool _hasWallet = false;
  bool _isInitialized = false;

  // Getters
  List<WalletAccount> get accounts => _accounts;
  WalletAccount? get activeAccount => _activeAccount;
  List<ChainBalance> get balances => _balances;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasWallet => _hasWallet;
  bool get hasActiveWallet => _activeAccount != null;
  bool get isInitialized => _isInitialized;

  /// Initialize wallet provider
  Future<void> initialize() async {
    _setLoading(true);
    try {
      await DatabaseService.initialize();
      await _loadAccounts();
      _hasWallet = await SecureStorageService.hasWalletData();
    } catch (e) {
      _setError('Failed to initialize wallet: $e');
    } finally {
      _setLoading(false);
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Load all accounts from database
  Future<void> _loadAccounts() async {
    try {
      _accounts = await DatabaseService.getActiveWalletAccounts();
      _activeAccount = await DatabaseService.getActiveWalletAccount();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load accounts: $e');
    }
  }

  /// Create new wallet from mnemonic
  Future<WalletCreationResult> createWallet({
    required String name,
    required String chain,
    int wordCount = 12,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      // Generate mnemonic
      final mnemonic = WalletService.generateMnemonic(wordCount: wordCount);

      // Create wallet
      final result = await WalletService.createWalletFromMnemonic(
        mnemonic: mnemonic,
        name: name,
        chain: chain,
      );

      if (result.success) {
        // Save mnemonic to secure storage
        final mnemonicWallet = MnemonicWallet.create(
          encryptedMnemonic: await SecureStorageService.encryptData(mnemonic),
          wordCount: wordCount,
          name: name,
        );
        await DatabaseService.saveMnemonicWallet(mnemonicWallet);

        // Save account to database
        final account = WalletAccount.create(
          address: result.address,
          name: name,
          publicKey: result.publicKey,
          encryptedPrivateKey: await SecureStorageService.encryptData(
            result.mnemonic,
          ),
          derivationPath: result.derivationPath,
          accountIndex: 0,
          walletType: 'mnemonic',
          mnemonicId: mnemonicWallet.name,
        );

        await DatabaseService.saveWalletAccount(account);
        await DatabaseService.setActiveWalletAccount(result.address);

        // Reload accounts
        await _loadAccounts();
        _hasWallet = true;
      }

      return result;
    } catch (e) {
      _setError('Failed to create wallet: $e');
      return WalletCreationResult(
        address: '',
        publicKey: '',
        mnemonic: '',
        derivationPath: '',
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Import wallet from mnemonic
  Future<WalletImportResult> importWalletFromMnemonic({
    required String mnemonic,
    required String name,
    required String chain,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await WalletService.createWalletFromMnemonic(
        mnemonic: mnemonic,
        name: name,
        chain: chain,
      );

      if (result.success) {
        // Save mnemonic to secure storage
        final mnemonicWallet = MnemonicWallet.create(
          encryptedMnemonic: await SecureStorageService.encryptData(mnemonic),
          wordCount: mnemonic.split(' ').length,
          name: name,
        );
        await DatabaseService.saveMnemonicWallet(mnemonicWallet);

        // Save account to database
        final account = WalletAccount.create(
          address: result.address,
          name: name,
          publicKey: result.publicKey,
          encryptedPrivateKey: await SecureStorageService.encryptData(
            result.mnemonic,
          ),
          derivationPath: result.derivationPath,
          accountIndex: 0,
          walletType: 'mnemonic',
          mnemonicId: mnemonicWallet.name,
        );

        await DatabaseService.saveWalletAccount(account);
        await DatabaseService.setActiveWalletAccount(result.address);

        // Reload accounts
        await _loadAccounts();
        _hasWallet = true;
      }

      return WalletImportResult(
        address: result.address,
        publicKey: result.publicKey,
        success: result.success,
        importType: 'mnemonic',
        error: result.error,
      );
    } catch (e) {
      _setError('Failed to import wallet: $e');
      return WalletImportResult(
        address: '',
        publicKey: '',
        success: false,
        importType: 'mnemonic',
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Import wallet from private key
  Future<WalletImportResult> importWalletFromPrivateKey({
    required String privateKey,
    required String name,
    required String chain,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await WalletService.importWalletFromPrivateKey(
        privateKey: privateKey,
        name: name,
        chain: chain,
      );

      if (result.success) {
        // Save account to database
        final account = WalletAccount.create(
          address: result.address,
          name: name,
          publicKey: result.publicKey,
          encryptedPrivateKey: await SecureStorageService.encryptData(
            privateKey,
          ),
          derivationPath: '',
          accountIndex: 0,
          walletType: 'private_key',
        );

        await DatabaseService.saveWalletAccount(account);
        await DatabaseService.setActiveWalletAccount(result.address);

        // Reload accounts
        await _loadAccounts();
        _hasWallet = true;
      }

      return result;
    } catch (e) {
      _setError('Failed to import wallet: $e');
      return WalletImportResult(
        address: '',
        publicKey: '',
        success: false,
        importType: 'private_key',
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Switch active account
  Future<void> switchAccount(String address) async {
    _setLoading(true);
    try {
      await DatabaseService.setActiveWalletAccount(address);
      await _loadAccounts();
    } catch (e) {
      _setError('Failed to switch account: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Delete account
  Future<void> deleteAccount(int accountId) async {
    _setLoading(true);
    try {
      final account = await DatabaseService.getWalletAccountById(
        accountId.toString(),
      );
      if (account != null) {
        // Delete private key from secure storage
        await SecureStorageService.deletePrivateKey(account.address);

        // Delete from database
        await DatabaseService.deleteWalletAccount(accountId.toString());

        // Reload accounts
        await _loadAccounts();

        // Check if we still have wallets
        _hasWallet = await SecureStorageService.hasWalletData();
      }
    } catch (e) {
      _setError('Failed to delete account: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Update account name
  Future<void> updateAccountName(int accountId, String newName) async {
    _setLoading(true);
    try {
      final account = await DatabaseService.getWalletAccountById(
        accountId.toString(),
      );
      if (account != null) {
        account.name = newName;
        await DatabaseService.updateWalletAccount(account);
        await _loadAccounts();
      }
    } catch (e) {
      _setError('Failed to update account name: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Load balances for active account
  Future<void> loadBalances() async {
    if (_activeAccount == null) return;

    _setLoading(true);
    try {
      // This would integrate with your blockchain service
      // For now, we'll create mock balances
      _balances = [
        const ChainBalance(
          chain: 'Polkadot',
          symbol: 'DOT',
          balance: '0.0',
          usdValue: '0.00',
          decimals: 10,
        ),
        const ChainBalance(
          chain: 'Moonbeam',
          symbol: 'GLMR',
          balance: '0.0',
          usdValue: '0.00',
          decimals: 18,
        ),
        const ChainBalance(
          chain: 'Astar',
          symbol: 'ASTR',
          balance: '0.0',
          usdValue: '0.00',
          decimals: 18,
        ),
      ];
    } catch (e) {
      _setError('Failed to load balances: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Get account by address
  WalletAccount? getAccountByAddress(String address) {
    try {
      return _accounts.firstWhere((account) => account.address == address);
    } catch (e) {
      return null;
    }
  }

  /// Get supported chains
  Future<List<String>> getSupportedChains() async {
    return await WalletService.getSupportedChains();
  }

  /// Validate mnemonic
  bool validateMnemonic(String mnemonic) {
    return WalletService.validateMnemonic(mnemonic);
  }

  /// Validate private key
  bool validatePrivateKey(String privateKey, String chain) {
    return WalletService.validatePrivateKey(privateKey, chain);
  }

  /// Clear all wallet data
  Future<void> clearAllWalletData() async {
    _setLoading(true);
    try {
      await SecureStorageService.clearAllWalletData();
      await DatabaseService.clearAllWalletData();
      _accounts.clear();
      _activeAccount = null;
      _balances.clear();
      _hasWallet = false;
      notifyListeners();
    } catch (e) {
      _setError('Failed to clear wallet data: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Set error message
  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  /// Clear error message
  void _clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
