import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/staking_provider.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_stats_card.dart';
import 'package:kifepool/features/staking/presentation/widgets/validator_list_widget.dart';
import 'package:kifepool/features/staking/presentation/widgets/nomination_pool_list_widget.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_position_list_widget.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_search_bar.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_filter_chips.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_sort_dropdown.dart';
import 'package:kifepool/features/staking/presentation/widgets/chain_selector_widget.dart';

/// Staking dashboard screen
class StakingDashboardScreen extends StatefulWidget {
  const StakingDashboardScreen({super.key});

  @override
  State<StakingDashboardScreen> createState() => _StakingDashboardScreenState();
}

class _StakingDashboardScreenState extends State<StakingDashboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    try {
      _tabController = TabController(length: 3, vsync: this);
    } catch (e) {
      debugPrint('Failed to create TabController: $e');
      // Create a default controller if initialization fails
      _tabController = TabController(length: 3, vsync: this);
    }

    // Initialize staking provider - delay to ensure context is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() {
        if (!mounted) return;
        try {
          final provider = Provider.of<StakingProvider>(context, listen: false);
          provider.initialize().catchError((error) {
            debugPrint('Failed to initialize staking provider: $error');
          });
        } catch (e) {
          debugPrint('Failed to access staking provider: $e');
        }
      });
    });
  }

  @override
  void dispose() {
    debugPrint('🔵 StakingDashboardScreen: dispose() called');
    try {
      _tabController.dispose();
    } catch (e) {
      debugPrint('❌ StakingDashboardScreen: Error disposing TabController: $e');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔵 StakingDashboardScreen: build() called');

    try {
      // Verify TabController is valid
      if (mounted && _tabController.length != 3) {
        debugPrint(
          '⚠️ StakingDashboardScreen: TabController length mismatch, recreating',
        );
        try {
          _tabController.dispose();
          _tabController = TabController(length: 3, vsync: this);
        } catch (e) {
          debugPrint(
            '❌ StakingDashboardScreen: Failed to recreate TabController: $e',
          );
        }
      }
    } catch (e, stackTrace) {
      debugPrint(
        '❌ StakingDashboardScreen: Error in build() before Scaffold: $e',
      );
      debugPrint('Stack trace: $stackTrace');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Staking'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Validators', icon: Icon(Icons.verified_user)),
            Tab(text: 'Pools', icon: Icon(Icons.group)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              try {
                context.read<StakingProvider>().refresh();
              } catch (e) {
                debugPrint('Failed to refresh staking data: $e');
              }
            },
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return Consumer<StakingProvider>(
            builder: (context, stakingProvider, child) {
              try {
                // Show loading only if we have no data
                if (stakingProvider.isLoading && 
                    stakingProvider.validators.isEmpty && 
                    stakingProvider.nominationPools.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (stakingProvider.error != null) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Error loading staking data',
                            style: AppTypography.headlineSmall,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            stakingProvider.error!,
                            style: AppTypography.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          ElevatedButton(
                            onPressed: () {
                              stakingProvider.refresh();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    // Chain selector
                    FutureBuilder<List<String>>(
                      future: () async {
                        debugPrint(
                          '🔵 StakingDashboardScreen: FutureBuilder future started',
                        );
                        try {
                          debugPrint(
                            '🔵 StakingDashboardScreen: Calling getSupportedChains()',
                          );
                          final chains = await stakingProvider
                              .getSupportedChains();
                          debugPrint(
                            '✅ StakingDashboardScreen: getSupportedChains() returned: $chains',
                          );
                          return chains;
                        } catch (e, stackTrace) {
                          debugPrint(
                            '❌ StakingDashboardScreen: Error in FutureBuilder for supported chains: $e',
                          );
                          debugPrint('Stack trace: $stackTrace');
                          // Return default chains on error
                          debugPrint(
                            '🔵 StakingDashboardScreen: Returning default chains',
                          );
                          return ['polkadot', 'kusama'];
                        }
                      }(),
                      builder: (context, snapshot) {
                        debugPrint(
                          '🔵 StakingDashboardScreen: FutureBuilder builder called, hasError: ${snapshot.hasError}, hasData: ${snapshot.hasData}',
                        );
                        if (snapshot.hasError) {
                          debugPrint(
                            '❌ StakingDashboardScreen: FutureBuilder snapshot has error: ${snapshot.error}',
                          );
                        }
                        if (snapshot.hasError) {
                          debugPrint('Error loading supported chains: ${snapshot.error}');
                          // Show chain selector with default chains
                          return ChainSelectorWidget(
                            onChainChanged: (chain) {
                              stakingProvider.setSelectedChain(chain);
                            },
                            initialChain: stakingProvider.selectedChain,
                          );
                        }
                        if (snapshot.hasData && snapshot.data != null) {
                          return ChainSelectorWidget(
                            onChainChanged: (chain) {
                              stakingProvider.setSelectedChain(chain);
                            },
                            initialChain: stakingProvider.selectedChain,
                            supportedChains: snapshot.data,
                          );
                        } else {
                          return ChainSelectorWidget(
                            onChainChanged: (chain) {
                              stakingProvider.setSelectedChain(chain);
                            },
                            initialChain: stakingProvider.selectedChain,
                          );
                        }
                      },
                    ),

                    // Search and filter bar
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        children: [
                          StakingSearchBar(
                            onSearchChanged: (query) {
                              stakingProvider.setSearchQuery(query);
                            },
                            initialValue: stakingProvider.searchQuery,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Expanded(
                                child: StakingFilterChips(
                                  onFilterChanged: (filter) {
                                    stakingProvider.setFilterType(filter);
                                  },
                                  initialFilter: stakingProvider.filterType,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              StakingSortDropdown(
                                onSortChanged: (sortBy) {
                                  stakingProvider.setSortBy(sortBy);
                                },
                                initialSort: stakingProvider.sortBy,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Tab content
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildOverviewTab(stakingProvider),
                          _buildValidatorsTab(stakingProvider),
                          _buildPoolsTab(stakingProvider),
                        ],
                      ),
                    ),
                  ],
                );
              } catch (e, stackTrace) {
                debugPrint('Error building staking dashboard: $e');
                debugPrint('Stack trace: $stackTrace');
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Error loading staking dashboard',
                          style: AppTypography.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          e.toString(),
                          style: AppTypography.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildOverviewTab(StakingProvider stakingProvider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Staking statistics
          if (stakingProvider.stakingStats != null)
            StakingStatsCard(stats: stakingProvider.stakingStats!),

          const SizedBox(height: AppSpacing.lg),

          // Active staking positions
          Text('Active Positions', style: AppTypography.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          StakingPositionListWidget(
            positions: stakingProvider.filteredStakingPositions,
          ),

          const SizedBox(height: AppSpacing.lg),

          // Recent rewards
          Text('Recent Rewards', style: AppTypography.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          if (stakingProvider.filteredStakingRewards.isNotEmpty)
            ...stakingProvider.filteredStakingRewards
                .take(5)
                .map(
                  (reward) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                      ),
                      title: Text('${reward.amount} ${reward.symbol}'),
                      subtitle: Text(
                        '${reward.chain} • ${_formatDate(reward.timestamp)}',
                      ),
                      trailing: Text(
                        '+${reward.amount}',
                        style: AppTypography.bodyMedium.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
          else
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'No rewards yet. Start staking to earn rewards!',
                  style: AppTypography.bodyMedium.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildValidatorsTab(StakingProvider stakingProvider) {
    return ValidatorListWidget(
      validators: stakingProvider.filteredValidators,
      onValidatorSelected: (validator) {
        try {
          // Navigate to validator details
          _showValidatorDetails(context, validator);
        } catch (e) {
          debugPrint('Failed to show validator details: $e');
        }
      },
    );
  }

  Widget _buildPoolsTab(StakingProvider stakingProvider) {
    return NominationPoolListWidget(
      pools: stakingProvider.filteredNominationPools,
      onPoolSelected: (pool) {
        try {
          // Navigate to pool details
          _showPoolDetails(context, pool);
        } catch (e) {
          debugPrint('Failed to show pool details: $e');
        }
      },
    );
  }

  void _showValidatorDetails(BuildContext context, dynamic validator) {
    if (validator == null) return;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                validator.name ?? 'Unknown Validator',
                style: AppTypography.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'APY: ${(validator.apy ?? 0.0).toStringAsFixed(2)}%',
                style: AppTypography.bodyLarge.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Address', validator.address ?? 'N/A'),
                      _buildDetailRow(
                        'Commission',
                        '${(validator.commission ?? 0.0).toStringAsFixed(2)}%',
                      ),
                      _buildDetailRow(
                        'Total Stake',
                        '${validator.totalStake ?? 0} DOT',
                      ),
                      _buildDetailRow(
                        'Status',
                        (validator.isActive ?? false) ? 'Active' : 'Inactive',
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to stake screen
                          },
                          child: const Text('Stake to Validator'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPoolDetails(BuildContext context, dynamic pool) {
    if (pool == null) return;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pool.name ?? 'Unknown Pool',
                style: AppTypography.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'APY: ${(pool.apy ?? 0.0).toStringAsFixed(2)}%',
                style: AppTypography.bodyLarge.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Pool ID', (pool.poolId ?? 0).toString()),
                      _buildDetailRow('Total Stake', '${pool.totalStake ?? 0} DOT'),
                      _buildDetailRow(
                        'Member Count',
                        (pool.memberCount ?? 0).toString(),
                      ),
                      _buildDetailRow(
                        'Status',
                        (pool.isActive ?? false) ? 'Active' : 'Inactive',
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigate to stake screen
                          },
                          child: const Text('Stake to Pool'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
