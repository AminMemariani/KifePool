import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying a list of user's staking positions
class StakingPositionListWidget extends StatelessWidget {
  final List<staking.StakingPosition> positions;

  const StakingPositionListWidget({super.key, required this.positions});

  @override
  Widget build(BuildContext context) {
    if (positions.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: positions.length,
      itemBuilder: (context, index) {
        final position = positions[index];
        return _buildPositionCard(context, position);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'No Active Positions',
              style: AppTypography.titleMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Start staking to earn rewards',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionCard(
    BuildContext context,
    staking.StakingPosition position,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                // Position type icon
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: _getPositionColor(position.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    _getPositionIcon(position.type),
                    size: 16,
                    color: _getPositionColor(position.type),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),

                // Position name
                Expanded(
                  child: Text(
                    position.name,
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(position.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Text(
                    _getStatusText(position.status),
                    style: AppTypography.bodySmall.copyWith(
                      color: _getStatusColor(position.status),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.sm),

            // Position details
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    context,
                    'Staked Amount',
                    '${position.stakedAmount.toStringAsFixed(2)} DOT',
                    Icons.account_balance_wallet,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    context,
                    'APY',
                    '${position.apy.toStringAsFixed(2)}%',
                    Icons.percent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.sm),

            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    context,
                    'Rewards',
                    '${position.rewards.toStringAsFixed(2)} DOT',
                    Icons.monetization_on,
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    context,
                    'Unbonding',
                    position.unbondingAmount > 0
                        ? '${position.unbondingAmount.toStringAsFixed(2)} DOT'
                        : 'None',
                    Icons.schedule,
                  ),
                ),
              ],
            ),

            if (position.unbondingAmount > 0) ...[
              const SizedBox(height: AppSpacing.sm),
              _buildUnbondingProgress(context, position),
            ],

            const SizedBox(height: AppSpacing.md),

            // Action buttons
            Row(
              children: [
                if (position.rewards > 0) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _claimRewards(context, position),
                      icon: const Icon(Icons.monetization_on, size: 16),
                      label: const Text('Claim'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.xs,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                ],
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _unstake(context, position),
                    icon: const Icon(Icons.trending_down, size: 16),
                    label: const Text('Unstake'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 11,
                ),
              ),
              Text(
                value,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUnbondingProgress(
    BuildContext context,
    staking.StakingPosition position,
  ) {
    final progress = position.unbondingProgress;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Unbonding Progress',
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: AppTypography.bodySmall.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.orange.withOpacity(0.2),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
          minHeight: 4,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${position.unbondingDaysRemaining} days remaining',
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Color _getPositionColor(String type) {
    switch (type.toLowerCase()) {
      case 'validator':
        return Colors.blue;
      case 'pool':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getPositionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'validator':
        return Icons.verified_user;
      case 'pool':
        return Icons.group;
      default:
        return Icons.account_balance_wallet;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'unbonding':
        return Colors.orange;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'Active';
      case 'unbonding':
        return 'Unbonding';
      case 'inactive':
        return 'Inactive';
      default:
        return status;
    }
  }

  void _claimRewards(BuildContext context, staking.StakingPosition position) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Claim Rewards'),
        content: Text(
          'Claim ${position.rewards.toStringAsFixed(2)} DOT rewards from ${position.name}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to claim operation screen
              Navigator.pushNamed(
                context,
                '/staking/operation',
                arguments: {
                  'operation': 'claim',
                  'validatorAddress': position.validatorAddress,
                  'poolId': position.poolId,
                  'validatorName': position.name,
                },
              );
            },
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }

  void _unstake(BuildContext context, staking.StakingPosition position) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unstake Tokens'),
        content: Text(
          'Unstake tokens from ${position.name}? This will start a 28-day unbonding period.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to unstake operation screen
              Navigator.pushNamed(
                context,
                '/staking/operation',
                arguments: {
                  'operation': 'unstake',
                  'validatorAddress': position.validatorAddress,
                  'poolId': position.poolId,
                  'validatorName': position.name,
                },
              );
            },
            child: const Text('Unstake'),
          ),
        ],
      ),
    );
  }
}
