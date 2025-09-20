import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying staking charts and visualizations
class StakingChartsWidget extends StatelessWidget {
  final List<staking.StakingPosition> positions;
  final List<staking.StakingReward> rewards;

  const StakingChartsWidget({
    super.key,
    required this.positions,
    required this.rewards,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Staking Analytics', style: AppTypography.titleLarge),
            const SizedBox(height: AppSpacing.lg),

            // Charts row
            Row(
              children: [
                // Staking distribution chart
                Expanded(child: _buildDistributionChart(context)),
                const SizedBox(width: AppSpacing.lg),

                // Rewards trend chart
                Expanded(child: _buildRewardsChart(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDistributionChart(BuildContext context) {
    final totalStaked = positions.fold<int>(
      0,
      (sum, pos) => sum + pos.stakedAmount,
    );

    if (totalStaked == 0) {
      return _buildEmptyChart(
        context,
        'No Staking Positions',
        'Start staking to see your distribution',
        Icons.pie_chart_outline,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Staking Distribution', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.md),

        // Circular progress chart
        SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),

              // Progress circle
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 8,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              // Center text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${positions.length}',
                    style: AppTypography.headlineMedium.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Positions', style: AppTypography.bodySmall),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Legend
        ...positions
            .take(3)
            .map(
              (position) => _buildLegendItem(
                context,
                position.targetName,
                position.stakedAmount,
                totalStaked,
              ),
            ),
      ],
    );
  }

  Widget _buildRewardsChart(BuildContext context) {
    final totalRewards = rewards.fold<int>(
      0,
      (sum, reward) => sum + reward.amount,
    );
    final pendingRewards = rewards
        .where((r) => !r.isClaimed)
        .fold<int>(0, (sum, reward) => sum + reward.amount);

    if (totalRewards == 0) {
      return _buildEmptyChart(
        context,
        'No Rewards Yet',
        'Earn rewards by staking your tokens',
        Icons.trending_up,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rewards Overview', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.md),

        // Rewards breakdown
        Container(
          height: 150,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRewardItem(
                context,
                'Total Earned',
                totalRewards,
                Colors.green,
                Icons.monetization_on,
              ),
              _buildRewardItem(
                context,
                'Pending',
                pendingRewards,
                Colors.orange,
                Icons.schedule,
              ),
              _buildRewardItem(
                context,
                'Claimed',
                totalRewards - pendingRewards,
                Colors.blue,
                Icons.check_circle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyChart(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: AppTypography.bodySmall.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(
    BuildContext context,
    String name,
    int amount,
    int total,
  ) {
    final percentage = total > 0 ? (amount / total) : 0.0;
    final color = _getPositionColor(name);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              name,
              style: AppTypography.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${(percentage * 100).toStringAsFixed(1)}%',
            style: AppTypography.bodySmall.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem(
    BuildContext context,
    String label,
    int amount,
    Color color,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(label, style: AppTypography.bodySmall)),
        Text(
          '${(amount / 1000).toStringAsFixed(1)}K',
          style: AppTypography.bodySmall.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Color _getPositionColor(String name) {
    // Generate consistent colors based on name
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];

    final index = name.hashCode % colors.length;
    return colors[index.abs()];
  }
}
