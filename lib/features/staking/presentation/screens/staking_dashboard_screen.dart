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
    _tabController = TabController(length: 3, vsync: this);

    // Initialize staking provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StakingProvider>().initialize();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              context.read<StakingProvider>().refresh();
            },
          ),
        ],
      ),
      body: Consumer<StakingProvider>(
        builder: (context, stakingProvider, child) {
          if (stakingProvider.isLoading && stakingProvider.validators.isEmpty) {
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
                future: stakingProvider.getSupportedChains(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
        // Navigate to validator details
        _showValidatorDetails(context, validator);
      },
    );
  }

  Widget _buildPoolsTab(StakingProvider stakingProvider) {
    return NominationPoolListWidget(
      pools: stakingProvider.filteredNominationPools,
      onPoolSelected: (pool) {
        // Navigate to pool details
        _showPoolDetails(context, pool);
      },
    );
  }

  void _showValidatorDetails(BuildContext context, dynamic validator) {
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
              Text(validator.name, style: AppTypography.headlineMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'APY: ${validator.apy.toStringAsFixed(2)}%',
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
                      _buildDetailRow('Address', validator.address),
                      _buildDetailRow(
                        'Commission',
                        '${validator.commission.toStringAsFixed(2)}%',
                      ),
                      _buildDetailRow(
                        'Total Stake',
                        '${validator.totalStake} DOT',
                      ),
                      _buildDetailRow(
                        'Status',
                        validator.isActive ? 'Active' : 'Inactive',
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
              Text(pool.name, style: AppTypography.headlineMedium),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'APY: ${pool.apy.toStringAsFixed(2)}%',
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
                      _buildDetailRow('Pool ID', pool.poolId.toString()),
                      _buildDetailRow('Total Stake', '${pool.totalStake} DOT'),
                      _buildDetailRow(
                        'Member Count',
                        pool.memberCount.toString(),
                      ),
                      _buildDetailRow(
                        'Status',
                        pool.isActive ? 'Active' : 'Inactive',
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
          Expanded(child: Text(value, style: AppTypography.bodyMedium)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
