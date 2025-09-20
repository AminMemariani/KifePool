import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying staking statistics in a card format
class StakingStatsCard extends StatelessWidget {
  final staking.StakingStats stats;

  const StakingStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Staking Overview', style: AppTypography.headlineSmall),
            const SizedBox(height: AppSpacing.lg),

            // Stats grid
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Total Staked',
                    '${stats.totalStaked.toStringAsFixed(2)} DOT',
                    Icons.account_balance_wallet,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Active Positions',
                    '${stats.activePositions}',
                    Icons.trending_up,
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Total Rewards',
                    '${stats.totalRewards.toStringAsFixed(2)} DOT',
                    Icons.monetization_on,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Avg. APY',
                    '${stats.averageApy.toStringAsFixed(2)}%',
                    Icons.percent,
                    Colors.purple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            // Progress indicators
            _buildProgressSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            value,
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Staking Progress', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.md),

        // Staking ratio progress
        _buildProgressBar(
          context,
          'Staking Ratio',
          stats.stakingRatio,
          '${(stats.stakingRatio * 100).toStringAsFixed(1)}% of total balance',
          Colors.blue,
        ),

        const SizedBox(height: AppSpacing.md),

        // Rewards progress (mock - showing monthly progress)
        _buildProgressBar(
          context,
          'Monthly Rewards',
          0.75, // Mock progress
          '75% of monthly target',
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildProgressBar(
    BuildContext context,
    String label,
    double progress,
    String subtitle,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: AppTypography.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          subtitle,
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
