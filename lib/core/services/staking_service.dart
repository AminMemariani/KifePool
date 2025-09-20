import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Service for managing staking operations across supported parachains
class StakingService {
  static const Map<String, String> _rpcEndpoints = {
    'polkadot': 'wss://rpc.polkadot.io',
    'kusama': 'wss://kusama-rpc.polkadot.io',
    'moonbeam': 'wss://wss.api.moonbeam.network',
    'astar': 'wss://rpc.astar.network',
    'acala': 'wss://acala-rpc-0.aca-api.network',
  };

  static final Map<String, WebSocketChannel?> _connections = {};

  /// Initialize connection to a chain
  static Future<void> _initializeConnection(String chain) async {
    if (_connections[chain] != null) return;

    final endpoint = _rpcEndpoints[chain];
    if (endpoint == null) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Unsupported chain: $chain',
      );
    }

    try {
      _connections[chain] = WebSocketChannel.connect(Uri.parse(endpoint));
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Failed to connect to $chain',
        details: e.toString(),
      );
    }
  }

  /// Send RPC request
  static Future<Map<String, dynamic>> _sendRpcRequest(
    String chain,
    String method,
    List<dynamic> params,
  ) async {
    await _initializeConnection(chain);
    final connection = _connections[chain]!;

    final request = {
      'jsonrpc': '2.0',
      'id': Random().nextInt(1000000),
      'method': method,
      'params': params,
    };

    connection.sink.add(jsonEncode(request));

    // Wait for response (simplified - in production use proper async handling)
    await Future.delayed(const Duration(seconds: 2));

    // Mock response for now
    return _getMockResponse(method, chain);
  }

  /// Get mock response for development
  static Map<String, dynamic> _getMockResponse(String method, String chain) {
    switch (method) {
      case 'api.query.staking.validators':
        return {
          'result': {'validators': _generateMockValidators(chain)},
        };
      case 'api.query.nominationPools.pools':
        return {'result': _generateMockPools(chain)};
      default:
        return {'result': {}};
    }
  }

  /// Generate mock validators
  static List<Map<String, dynamic>> _generateMockValidators(String chain) {
    final validators = <Map<String, dynamic>>[];
    final random = Random();

    for (int i = 0; i < 20; i++) {
      validators.add({
        'address': '${chain}_validator_${i.toString().padLeft(3, '0')}',
        'name': 'Validator ${i + 1}',
        'commission': (random.nextDouble() * 0.1).toStringAsFixed(4), // 0-10%
        'apy': (random.nextDouble() * 0.15 + 0.05).toStringAsFixed(4), // 5-20%
        'totalStake': (random.nextInt(1000000) + 100000).toString(),
        'nominatorCount': random.nextInt(1000) + 50,
        'isActive': random.nextBool(),
        'isOversubscribed': random.nextDouble() < 0.1, // 10% chance
        'identity': 'Identity ${i + 1}',
        'website': 'https://validator${i + 1}.com',
        'description': 'Professional validator with high uptime and security.',
      });
    }

    return validators;
  }

  /// Generate mock nomination pools
  static List<Map<String, dynamic>> _generateMockPools(String chain) {
    final pools = <Map<String, dynamic>>[];
    final random = Random();

    for (int i = 0; i < 10; i++) {
      pools.add({
        'poolId': i + 1,
        'name': 'Pool ${i + 1}',
        'state': 'Active',
        'apy': (random.nextDouble() * 0.12 + 0.06).toStringAsFixed(4), // 6-18%
        'totalStake': (random.nextInt(500000) + 50000).toString(),
        'memberCount': random.nextInt(500) + 20,
        'poolAccount': '${chain}_pool_${i.toString().padLeft(3, '0')}',
        'description':
            'Community-driven nomination pool with competitive rewards.',
      });
    }

    return pools;
  }

  /// Get validators for a chain
  static Future<List<staking.Validator>> getValidators(String chain) async {
    try {
      // Get current validators from RPC
      final validatorsResponse = await _sendRpcRequest(
        chain,
        'api.query.session.validators',
        [],
      );

      // Get validator info for each validator
      final validatorsData = validatorsResponse['result'] as List;
      final validators = <staking.Validator>[];

      for (int i = 0; i < validatorsData.length; i++) {
        final validatorAddress = validatorsData[i] as String;

        try {
          // Get validator preferences (commission)
          final prefsResponse = await _sendRpcRequest(
            chain,
            'api.query.staking.validators',
            [validatorAddress],
          );

          // Get validator exposure (total stake)
          final exposureResponse = await _sendRpcRequest(
            chain,
            'api.query.staking.stakers',
            [validatorAddress],
          );

          final validator = staking.Validator();
          validator.address = validatorAddress;
          validator.name =
              'Validator ${i + 1}'; // Could be enhanced with identity lookup
          validator.chain = chain;

          // Parse commission from preferences
          if (prefsResponse['result'] != null) {
            final prefs = prefsResponse['result'];
            validator.commission =
                double.tryParse(prefs['commission']?.toString() ?? '0') ?? 0.0;
          }

          // Parse total stake from exposure
          if (exposureResponse['result'] != null) {
            final exposure = exposureResponse['result'];
            validator.totalStake =
                int.tryParse(exposure['total']?.toString() ?? '0') ?? 0;
            validator.nominatorCount =
                (exposure['others'] as List?)?.length ?? 0;
          }

          validator.apy = 0.0; // Would need to calculate from historical data
          validator.isActive = true; // Current validators are active
          validator.isOversubscribed =
              validator.nominatorCount > 256; // Polkadot limit
          validator.lastUpdated = DateTime.now();
          validator.identity = '';
          validator.website = '';
          validator.description = '';

          validators.add(validator);
        } catch (validatorError) {
          debugPrint(
            'Failed to get validator info for $validatorAddress: $validatorError',
          );
          continue;
        }
      }

      return validators;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Failed to fetch validators for $chain',
        details: e.toString(),
      );
    }
  }

  /// Get nomination pools for a chain
  static Future<List<staking.NominationPool>> getNominationPools(
    String chain,
  ) async {
    try {
      // Get all pool IDs
      final poolsResponse = await _sendRpcRequest(
        chain,
        'api.query.nominationPools.counterForPools',
        [],
      );

      final poolCount =
          int.tryParse(poolsResponse['result']?.toString() ?? '0') ?? 0;
      final pools = <staking.NominationPool>[];

      // Get pool info for each pool
      for (int poolId = 1; poolId <= poolCount; poolId++) {
        try {
          // Get pool info
          final poolInfoResponse = await _sendRpcRequest(
            chain,
            'api.query.nominationPools.poolMembers',
            [poolId],
          );

          // Get pool metadata
          final metadataResponse = await _sendRpcRequest(
            chain,
            'api.query.nominationPools.metadata',
            [poolId],
          );

          final pool = staking.NominationPool();
          pool.poolId = poolId;
          pool.chain = chain;

          // Parse pool state and info
          if (poolInfoResponse['result'] != null) {
            final poolInfo = poolInfoResponse['result'];
            pool.state = poolInfo['state']?.toString() ?? 'Unknown';
            pool.totalStake =
                int.tryParse(poolInfo['totalStake']?.toString() ?? '0') ?? 0;
            pool.memberCount =
                int.tryParse(poolInfo['memberCount']?.toString() ?? '0') ?? 0;
            pool.poolAccount = poolInfo['poolAccount']?.toString() ?? '';
          }

          // Parse metadata
          if (metadataResponse['result'] != null) {
            final metadata = metadataResponse['result'];
            pool.name = metadata['name']?.toString() ?? 'Pool $poolId';
            pool.description = metadata['description']?.toString() ?? '';
          } else {
            pool.name = 'Pool $poolId';
            pool.description = '';
          }

          pool.apy = 0.0; // Would need to calculate from historical data
          pool.lastUpdated = DateTime.now();

          pools.add(pool);
        } catch (poolError) {
          debugPrint('Failed to get pool info for pool $poolId: $poolError');
          continue;
        }
      }

      return pools;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Failed to fetch nomination pools for $chain',
        details: e.toString(),
      );
    }
  }

  /// Get user's staking positions
  static Future<List<staking.StakingPosition>> getUserStakingPositions(
    String accountAddress,
    String chain,
  ) async {
    try {
      final positions = <staking.StakingPosition>[];

      // Get staking ledger for the account
      final ledgerResponse = await _sendRpcRequest(
        chain,
        'api.query.staking.ledger',
        [accountAddress],
      );

      if (ledgerResponse['result'] != null) {
        final ledger = ledgerResponse['result'];

        // Get nominator info
        final nominatorResponse = await _sendRpcRequest(
          chain,
          'api.query.staking.nominators',
          [accountAddress],
        );

        if (nominatorResponse['result'] != null) {
          final nominator = nominatorResponse['result'];
          final targets = nominator['targets'] as List? ?? [];

          for (final target in targets) {
            final position = staking.StakingPosition();
            position.accountAddress = accountAddress;
            position.chain = chain;
            position.stakingType = 'validator';
            position.targetAddress = target.toString();
            position.targetName =
                'Validator ${target.toString().substring(0, 8)}...';
            position.stakedAmount =
                int.tryParse(ledger['total']?.toString() ?? '0') ?? 0;
            position.pendingRewards =
                0; // Would need to calculate from reward history
            position.totalRewards =
                0; // Would need to calculate from reward history
            position.stakedAt =
                DateTime.now(); // Would need to get from historical data
            position.lastClaimed =
                DateTime.now(); // Would need to get from historical data
            position.isActive = true;
            position.status = 'Active';
            position.unbondingAmount = 0;
            position.unbondingEndsAt = DateTime.now();
            position.apy = 0.0; // Would need to calculate from historical data
            position.poolId = 0;
            position.validatorAddress = target.toString();

            positions.add(position);
          }
        }
      }

      // Check for nomination pool positions
      try {
        final poolMembersResponse = await _sendRpcRequest(
          chain,
          'api.query.nominationPools.poolMembers',
          [accountAddress],
        );

        if (poolMembersResponse['result'] != null) {
          final poolMember = poolMembersResponse['result'];
          final poolId = poolMember['poolId'];

          if (poolId != null) {
            final position = staking.StakingPosition();
            position.accountAddress = accountAddress;
            position.chain = chain;
            position.stakingType = 'pool';
            position.targetAddress = poolId.toString();
            position.targetName = 'Pool $poolId';
            position.stakedAmount =
                int.tryParse(poolMember['points']?.toString() ?? '0') ?? 0;
            position.pendingRewards =
                0; // Would need to calculate from reward history
            position.totalRewards =
                0; // Would need to calculate from reward history
            position.stakedAt =
                DateTime.now(); // Would need to get from historical data
            position.lastClaimed =
                DateTime.now(); // Would need to get from historical data
            position.isActive = true;
            position.status = 'Active';
            position.unbondingAmount = 0;
            position.unbondingEndsAt = DateTime.now();
            position.apy = 0.0; // Would need to calculate from historical data
            position.poolId = int.tryParse(poolId.toString()) ?? 0;
            position.validatorAddress = '';

            positions.add(position);
          }
        }
      } catch (poolError) {
        debugPrint('Failed to get pool membership: $poolError');
      }

      return positions;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Failed to fetch staking positions',
        details: e.toString(),
      );
    }
  }

  /// Get staking rewards for an account
  static Future<List<staking.StakingReward>> getStakingRewards(
    String accountAddress,
    String chain,
  ) async {
    try {
      final rewards = <staking.StakingReward>[];

      // Get current era
      final eraResponse = await _sendRpcRequest(
        chain,
        'api.query.staking.currentEra',
        [],
      );

      final currentEra =
          int.tryParse(eraResponse['result']?.toString() ?? '0') ?? 0;

      // Get reward history for the last 10 eras
      final startEra = (currentEra - 10).clamp(0, currentEra);

      for (int era = startEra; era < currentEra; era++) {
        try {
          // Get era rewards for this account
          final eraRewardsResponse = await _sendRpcRequest(
            chain,
            'api.query.staking.erasRewardPoints',
            [era],
          );

          if (eraRewardsResponse['result'] != null) {
            final eraRewards = eraRewardsResponse['result'];
            final individual =
                eraRewards['individual'] as Map<String, dynamic>?;

            if (individual != null && individual.containsKey(accountAddress)) {
              final rewardPoints = individual[accountAddress];

              // Get era payout info
              final payoutResponse = await _sendRpcRequest(
                chain,
                'api.query.staking.erasValidatorReward',
                [era],
              );

              if (payoutResponse['result'] != null) {
                final eraPayout =
                    int.tryParse(payoutResponse['result']?.toString() ?? '0') ??
                    0;

                // Calculate reward amount (simplified calculation)
                final rewardAmount =
                    (eraPayout * rewardPoints) ~/
                    1000000; // Simplified calculation

                if (rewardAmount > 0) {
                  final reward = staking.StakingReward();
                  reward.accountAddress = accountAddress;
                  reward.chain = chain;
                  reward.validatorAddress =
                      ''; // Would need to get from validator info
                  reward.amount = rewardAmount;
                  reward.earnedAt = DateTime.now().subtract(
                    Duration(days: (currentEra - era) * 6),
                  ); // Approximate
                  reward.claimedAt = DateTime.fromMillisecondsSinceEpoch(
                    0,
                  ); // Would need to check claim status
                  reward.isClaimed = false; // Would need to check claim status
                  reward.era = 'Era $era';
                  reward.symbol = 'DOT'; // Would need to get from chain info
                  reward.timestamp = reward.earnedAt;

                  rewards.add(reward);
                }
              }
            }
          }
        } catch (eraError) {
          debugPrint('Failed to get rewards for era $era: $eraError');
          continue;
        }
      }

      return rewards;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.networkError,
        message: 'Failed to fetch staking rewards',
        details: e.toString(),
      );
    }
  }

  /// Stake tokens to a validator
  static Future<staking.StakingOperationResult> stakeToValidator({
    required String accountAddress,
    required String validatorAddress,
    required int amount,
    required String chain,
  }) async {
    try {
      // Validate amount
      if (amount <= 0) {
        throw staking.StakingException(
          type: staking.StakingErrorType.invalidAmount,
          message: 'Stake amount must be greater than 0',
        );
      }

      // Mock staking operation
      await Future.delayed(const Duration(seconds: 2));

      final transactionHash =
          '0x${Random().nextInt(1000000000).toRadixString(16).padLeft(8, '0')}';

      return staking.StakingOperationResult(
        success: true,
        transactionHash: transactionHash,
        data: {'amount': amount, 'validator': validatorAddress, 'chain': chain},
      );
    } catch (e) {
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Stake tokens to a nomination pool
  static Future<staking.StakingOperationResult> stakeToPool({
    required String accountAddress,
    required int poolId,
    required int amount,
    required String chain,
  }) async {
    try {
      // Validate amount
      if (amount <= 0) {
        throw staking.StakingException(
          type: staking.StakingErrorType.invalidAmount,
          message: 'Stake amount must be greater than 0',
        );
      }

      // Mock staking operation
      await Future.delayed(const Duration(seconds: 2));

      final transactionHash =
          '0x${Random().nextInt(1000000000).toRadixString(16).padLeft(8, '0')}';

      return staking.StakingOperationResult(
        success: true,
        transactionHash: transactionHash,
        data: {'amount': amount, 'poolId': poolId, 'chain': chain},
      );
    } catch (e) {
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Unstake tokens from a validator
  static Future<staking.StakingOperationResult> unstakeFromValidator({
    required String accountAddress,
    required String validatorAddress,
    required int amount,
    required String chain,
  }) async {
    try {
      // Validate amount
      if (amount <= 0) {
        throw staking.StakingException(
          type: staking.StakingErrorType.invalidAmount,
          message: 'Unstake amount must be greater than 0',
        );
      }

      // Mock unstaking operation
      await Future.delayed(const Duration(seconds: 2));

      final transactionHash =
          '0x${Random().nextInt(1000000000).toRadixString(16).padLeft(8, '0')}';

      return staking.StakingOperationResult(
        success: true,
        transactionHash: transactionHash,
        data: {
          'amount': amount,
          'validator': validatorAddress,
          'chain': chain,
          'unbondingPeriod': 28, // 28 days for Polkadot
        },
      );
    } catch (e) {
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Unstake tokens from a nomination pool
  static Future<staking.StakingOperationResult> unstakeFromPool({
    required String accountAddress,
    required int poolId,
    required int amount,
    required String chain,
  }) async {
    try {
      // Validate amount
      if (amount <= 0) {
        throw staking.StakingException(
          type: staking.StakingErrorType.invalidAmount,
          message: 'Unstake amount must be greater than 0',
        );
      }

      // Mock unstaking operation
      await Future.delayed(const Duration(seconds: 2));

      final transactionHash =
          '0x${Random().nextInt(1000000000).toRadixString(16).padLeft(8, '0')}';

      return staking.StakingOperationResult(
        success: true,
        transactionHash: transactionHash,
        data: {
          'amount': amount,
          'poolId': poolId,
          'chain': chain,
          'unbondingPeriod': 28, // 28 days for Polkadot
        },
      );
    } catch (e) {
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Claim staking rewards
  static Future<staking.StakingOperationResult> claimRewards({
    required String accountAddress,
    required String chain,
    String? validatorAddress,
    int? poolId,
  }) async {
    try {
      // Mock claim operation
      await Future.delayed(const Duration(seconds: 1));

      final transactionHash =
          '0x${Random().nextInt(1000000000).toRadixString(16).padLeft(8, '0')}';

      return staking.StakingOperationResult(
        success: true,
        transactionHash: transactionHash,
        data: {'chain': chain, 'validator': validatorAddress, 'poolId': poolId},
      );
    } catch (e) {
      return staking.StakingOperationResult(
        success: false,
        error: e.toString(),
      );
    }
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

  /// Get staking statistics
  static Future<staking.StakingStats> getStakingStats(
    String accountAddress,
  ) async {
    try {
      // Get staking ratio from RPC for each supported chain
      final supportedChains = await getSupportedChains();
      double totalStakingRatio = 0.0;
      int activePositions = 0;
      int totalStaked = 0;
      int totalRewards = 0;
      int pendingRewards = 0;
      double totalApy = 0.0;
      int chainCount = 0;

      for (final chain in supportedChains) {
        try {
          // Get account balance
          final balanceResponse = await _sendRpcRequest(
            chain,
            'api.query.system.account',
            [accountAddress],
          );

          // Get staking info for this account
          final stakingResponse = await _sendRpcRequest(
            chain,
            'api.query.staking.nominators',
            [accountAddress],
          );

          final balanceData = balanceResponse['result']['data'];
          final freeBalance = int.parse(balanceData['free'].toString());
          final reservedBalance = int.parse(balanceData['reserved'].toString());
          final totalBalance = freeBalance + reservedBalance;

          // Get staked amount
          int stakedAmount = 0;
          if (stakingResponse['result'] != null) {
            final stakingData = stakingResponse['result'];
            if (stakingData['targets'] != null) {
              // Get staking ledger for this account
              final ledgerResponse = await _sendRpcRequest(
                chain,
                'api.query.staking.ledger',
                [accountAddress],
              );
              if (ledgerResponse['result'] != null) {
                final ledger = ledgerResponse['result'];
                stakedAmount = int.parse(ledger['total'].toString());
              }
            }
          }

          // Calculate staking ratio for this chain
          if (totalBalance > 0) {
            final chainStakingRatio = stakedAmount / totalBalance;
            totalStakingRatio += chainStakingRatio;
            chainCount++;
          }

          totalStaked += stakedAmount;
          if (stakingResponse['result'] != null) {
            activePositions++;
          }

          // Get rewards (mock for now - would need to query reward history)
          final random = Random();
          totalRewards += random.nextInt(10000) + 1000;
          pendingRewards += random.nextInt(2000) + 200;
          totalApy += (random.nextDouble() * 0.1 + 0.08);
        } catch (chainError) {
          // If one chain fails, continue with others
          debugPrint('Failed to get staking data for $chain: $chainError');
          continue;
        }
      }

      // Calculate average staking ratio across all chains
      final averageStakingRatio = chainCount > 0
          ? totalStakingRatio / chainCount
          : 0.0;
      final averageApy = supportedChains.isNotEmpty
          ? totalApy / supportedChains.length
          : 0.0;

      return staking.StakingStats(
        totalStaked: totalStaked,
        totalRewards: totalRewards,
        pendingRewards: pendingRewards,
        averageApy: averageApy,
        activePositions: activePositions,
        supportedChains: supportedChains,
        stakingRatio: averageStakingRatio,
      );
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.unknown,
        message: 'Failed to fetch staking statistics',
        details: e.toString(),
      );
    }
  }

  /// Get staking ratio for a specific chain and account
  static Future<double> getStakingRatio(
    String accountAddress,
    String chain,
  ) async {
    try {
      // Get account balance
      final balanceResponse = await _sendRpcRequest(
        chain,
        'api.query.system.account',
        [accountAddress],
      );

      // Get staking ledger
      final ledgerResponse = await _sendRpcRequest(
        chain,
        'api.query.staking.ledger',
        [accountAddress],
      );

      final balanceData = balanceResponse['result']['data'];
      final freeBalance = int.parse(balanceData['free'].toString());
      final reservedBalance = int.parse(balanceData['reserved'].toString());
      final totalBalance = freeBalance + reservedBalance;

      int stakedAmount = 0;
      if (ledgerResponse['result'] != null) {
        final ledger = ledgerResponse['result'];
        stakedAmount = int.parse(ledger['total'].toString());
      }

      // Calculate staking ratio
      if (totalBalance > 0) {
        return stakedAmount / totalBalance;
      }

      return 0.0;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.unknown,
        message: 'Failed to fetch staking ratio for $chain',
        details: e.toString(),
      );
    }
  }

  /// Get total staked amount for an account on a specific chain
  static Future<int> getTotalStaked(String accountAddress, String chain) async {
    try {
      final ledgerResponse = await _sendRpcRequest(
        chain,
        'api.query.staking.ledger',
        [accountAddress],
      );

      if (ledgerResponse['result'] != null) {
        final ledger = ledgerResponse['result'];
        return int.parse(ledger['total'].toString());
      }

      return 0;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.unknown,
        message: 'Failed to fetch total staked amount for $chain',
        details: e.toString(),
      );
    }
  }

  /// Get account balance for a specific chain
  static Future<int> getAccountBalance(
    String accountAddress,
    String chain,
  ) async {
    try {
      final balanceResponse = await _sendRpcRequest(
        chain,
        'api.query.system.account',
        [accountAddress],
      );

      final balanceData = balanceResponse['result']['data'];
      final freeBalance = int.parse(balanceData['free'].toString());
      final reservedBalance = int.parse(balanceData['reserved'].toString());

      return freeBalance + reservedBalance;
    } catch (e) {
      throw staking.StakingException(
        type: staking.StakingErrorType.unknown,
        message: 'Failed to fetch account balance for $chain',
        details: e.toString(),
      );
    }
  }

  /// Close all connections
  static Future<void> closeConnections() async {
    for (final connection in _connections.values) {
      await connection?.sink.close();
    }
    _connections.clear();
  }
}
