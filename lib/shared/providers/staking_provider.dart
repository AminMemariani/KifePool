import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;
import 'package:kifepool/core/services/staking_service.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';

/// Provider for managing staking state and operations
class StakingProvider with ChangeNotifier {
  // State variables
  List<staking.Validator> _validators = [];
  List<staking.NominationPool> _nominationPools = [];
  List<staking.StakingPosition> _stakingPositions = [];
  List<staking.StakingReward> _stakingRewards = [];
  staking.StakingStats? _stakingStats;

  bool _isLoading = false;
  String? _error;
  String _selectedChain = 'polkadot';
  String _searchQuery = '';
  String _filterType = 'all'; // 'all', 'validators', 'pools'
  String _sortBy = 'apy'; // 'apy', 'commission', 'stake', 'name'

  // Getters
  List<staking.Validator> get validators => _validators;
  List<staking.NominationPool> get nominationPools => _nominationPools;
  List<staking.StakingPosition> get stakingPositions => _stakingPositions;
  List<staking.StakingReward> get stakingRewards => _stakingRewards;
  staking.StakingStats? get stakingStats => _stakingStats;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedChain => _selectedChain;
  String get searchQuery => _searchQuery;
  String get filterType => _filterType;
  String get sortBy => _sortBy;

  // Filtered and sorted data
  List<staking.Validator> get filteredValidators {
    var filtered = _validators.where((validator) {
      final matchesSearch =
          validator.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          validator.address.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesChain = validator.chain == _selectedChain;
      return matchesSearch && matchesChain;
    }).toList();

    // Sort validators
    switch (_sortBy) {
      case 'apy':
        filtered.sort((a, b) => b.apy.compareTo(a.apy));
        break;
      case 'commission':
        filtered.sort((a, b) => a.commission.compareTo(b.commission));
        break;
      case 'stake':
        filtered.sort((a, b) => b.totalStake.compareTo(a.totalStake));
        break;
      case 'name':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
    }

    return filtered;
  }

  List<staking.NominationPool> get filteredNominationPools {
    var filtered = _nominationPools.where((pool) {
      final matchesSearch =
          pool.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          pool.poolId.toString().contains(_searchQuery);
      final matchesChain = pool.chain == _selectedChain;
      return matchesSearch && matchesChain;
    }).toList();

    // Sort pools
    switch (_sortBy) {
      case 'apy':
        filtered.sort((a, b) => b.apy.compareTo(a.apy));
        break;
      case 'stake':
        filtered.sort((a, b) => b.totalStake.compareTo(a.totalStake));
        break;
      case 'name':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
    }

    return filtered;
  }

  List<staking.StakingPosition> get filteredStakingPositions {
    return _stakingPositions.where((position) {
      return position.chain == _selectedChain;
    }).toList();
  }

  List<staking.StakingReward> get filteredStakingRewards {
    return _stakingRewards.where((reward) {
      return reward.chain == _selectedChain;
    }).toList();
  }

  /// Initialize staking provider
  Future<void> initialize() async {
    await loadStakingData();
  }

  /// Load all staking data
  Future<void> loadStakingData() async {
    _setLoading(true);
    _clearError();

    try {
      // Use Future.wait with eagerError: false to prevent one failure from stopping others
      await Future.wait([
        loadValidators(),
        loadNominationPools(),
        loadStakingPositions(),
        loadStakingRewards(),
        loadStakingStats(),
      ], eagerError: false);
    } catch (e) {
      debugPrint('Error in loadStakingData: $e');
      // Don't set error here - individual methods handle their own errors
    } finally {
      _setLoading(false);
    }
  }

  /// Load validators for selected chain
  Future<void> loadValidators() async {
    try {
      _validators = await StakingService.getValidators(_selectedChain);
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load validators: $e');
      // Don't set error here, just keep empty list
      _validators = [];
      notifyListeners();
    }
  }

  /// Load nomination pools for selected chain
  Future<void> loadNominationPools() async {
    try {
      _nominationPools = await StakingService.getNominationPools(
        _selectedChain,
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load nomination pools: $e');
      // Network errors are expected - just keep empty list and continue
      // Don't crash the app or set a global error for network issues
      _nominationPools = [];
      notifyListeners();
    }
  }

  /// Load user's staking positions
  Future<void> loadStakingPositions() async {
    try {
      // In a real app, get the current user's address
      const accountAddress = 'user_account_address';
      _stakingPositions = await StakingService.getUserStakingPositions(
        accountAddress,
        _selectedChain,
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load staking positions: $e');
      // Don't set error here, just keep empty list
      _stakingPositions = [];
      notifyListeners();
    }
  }

  /// Load user's staking rewards
  Future<void> loadStakingRewards() async {
    try {
      // In a real app, get the current user's address
      const accountAddress = 'user_account_address';
      _stakingRewards = await StakingService.getStakingRewards(
        accountAddress,
        _selectedChain,
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load staking rewards: $e');
      // Don't set error here, just keep empty list
      _stakingRewards = [];
      notifyListeners();
    }
  }

  /// Load staking statistics
  Future<void> loadStakingStats() async {
    try {
      // In a real app, get the current user's address
      const accountAddress = 'user_account_address';
      _stakingStats = await StakingService.getStakingStats(accountAddress);
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Failed to load staking statistics: $e');
      debugPrint('Stack trace: $stackTrace');
      // Don't set error here, just keep stats as null
      // Network errors are expected and shouldn't crash the app
      _stakingStats = null;
      notifyListeners();
    }
  }

  /// Set selected chain
  void setSelectedChain(String chain) {
    if (_selectedChain != chain) {
      _selectedChain = chain;
      notifyListeners();
      loadStakingData(); // Reload data for new chain
    }
  }

  /// Set search query
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// Set filter type
  void setFilterType(String type) {
    _filterType = type;
    notifyListeners();
  }

  /// Set sort option
  void setSortBy(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  /// Stake to validator
  Future<staking.StakingOperationResult> stakeToValidator({
    required String accountAddress,
    required String validatorAddress,
    required int amount,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await StakingService.stakeToValidator(
        accountAddress: accountAddress,
        validatorAddress: validatorAddress,
        amount: amount,
        chain: _selectedChain,
      );

      if (result.success) {
        // Reload positions after successful stake
        await loadStakingPositions();
        await loadStakingStats();
      } else {
        _setError(result.error ?? 'Staking operation failed');
      }

      return result;
    } catch (e) {
      _setError('Failed to stake to validator: $e');
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Stake to nomination pool
  Future<staking.StakingOperationResult> stakeToPool({
    required String accountAddress,
    required int poolId,
    required int amount,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await StakingService.stakeToPool(
        accountAddress: accountAddress,
        poolId: poolId,
        amount: amount,
        chain: _selectedChain,
      );

      if (result.success) {
        // Reload positions after successful stake
        await loadStakingPositions();
        await loadStakingStats();
      } else {
        _setError(result.error ?? 'Staking operation failed');
      }

      return result;
    } catch (e) {
      _setError('Failed to stake to pool: $e');
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Unstake from validator
  Future<staking.StakingOperationResult> unstakeFromValidator({
    required String accountAddress,
    required String validatorAddress,
    required int amount,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await StakingService.unstakeFromValidator(
        accountAddress: accountAddress,
        validatorAddress: validatorAddress,
        amount: amount,
        chain: _selectedChain,
      );

      if (result.success) {
        // Reload positions after successful unstake
        await loadStakingPositions();
        await loadStakingStats();
      } else {
        _setError(result.error ?? 'Unstaking operation failed');
      }

      return result;
    } catch (e) {
      _setError('Failed to unstake from validator: $e');
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Unstake from nomination pool
  Future<staking.StakingOperationResult> unstakeFromPool({
    required String accountAddress,
    required int poolId,
    required int amount,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await StakingService.unstakeFromPool(
        accountAddress: accountAddress,
        poolId: poolId,
        amount: amount,
        chain: _selectedChain,
      );

      if (result.success) {
        // Reload positions after successful unstake
        await loadStakingPositions();
        await loadStakingStats();
      } else {
        _setError(result.error ?? 'Unstaking operation failed');
      }

      return result;
    } catch (e) {
      _setError('Failed to unstake from pool: $e');
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Claim rewards
  Future<staking.StakingOperationResult> claimRewards({
    required String accountAddress,
    String? validatorAddress,
    int? poolId,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final result = await StakingService.claimRewards(
        accountAddress: accountAddress,
        chain: _selectedChain,
        validatorAddress: validatorAddress,
        poolId: poolId,
      );

      if (result.success) {
        // Reload rewards and positions after successful claim
        await loadStakingRewards();
        await loadStakingPositions();
        await loadStakingStats();
      } else {
        _setError(result.error ?? 'Claim operation failed');
      }

      return result;
    } catch (e) {
      _setError('Failed to claim rewards: $e');
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    } finally {
      _setLoading(false);
    }
  }

  /// Refresh all data
  Future<void> refresh() async {
    await loadStakingData();
  }

  /// Get supported chains
  Future<List<String>> getSupportedChains() async {
    debugPrint('🔵 StakingProvider: getSupportedChains() called');
    try {
      debugPrint('🔵 StakingProvider: Calling StakingService.getSupportedChains()');
      final chains = await StakingService.getSupportedChains()
          .timeout(const Duration(seconds: 15), onTimeout: () {
        debugPrint('⚠️ StakingProvider: getSupportedChains timed out');
        return ['polkadot', 'kusama'];
      });
      debugPrint('✅ StakingProvider: getSupportedChains() returned: $chains');
      return chains;
    } on SocketException catch (e, stackTrace) {
      debugPrint('❌ StakingProvider: SocketException getting supported chains: $e');
      debugPrint('Stack trace: $stackTrace');
      return ['polkadot', 'kusama'];
    } on TimeoutException catch (e, stackTrace) {
      debugPrint('❌ StakingProvider: TimeoutException getting supported chains: $e');
      debugPrint('Stack trace: $stackTrace');
      return ['polkadot', 'kusama'];
    } catch (e, stackTrace) {
      debugPrint('❌ StakingProvider: Failed to get supported chains: $e');
      debugPrint('Stack trace: $stackTrace');
      // Return default chains if RPC fails
      return ['polkadot', 'kusama'];
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
    RpcNodeService.dispose();
    super.dispose();
  }
}
