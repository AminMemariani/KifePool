import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying user's staking positions
class StakingPositionsWidget extends StatelessWidget {
  final List<staking.StakingPosition> positions;
  final Function(staking.StakingPosition) onUnstake;
  final Function(staking.StakingPosition) onClaim;

  const StakingPositionsWidget({
    super.key,
    required this.positions,
    required this.onUnstake,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    if (positions.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: positions.length,
      itemBuilder: (context, index) {
        final position = positions[index];
        return _buildPositionCard(context, position);
      },
    );
  }

  Widget _buildPositionCard(
    BuildContext context,
    staking.StakingPosition position,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                // Position avatar
                CircleAvatar(
                  backgroundColor: position.stakingType == 'validator'
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.secondaryContainer,
                  child: Icon(
                    position.stakingType == 'validator'
                        ? Icons.verified_user
                        : Icons.group,
                    color: position.stakingType == 'validator'
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                // Position info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        position.targetName,
                        style: AppTypography.titleMedium,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        position.stakingType == 'validator'
                            ? 'Validator'
                            : 'Pool #${position.targetAddress}',
                        style: AppTypography.bodySmall.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                // Status chip
                _buildStatusChip(
                  context,
                  position.status,
                  _getStatusColor(position.status),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // Stats row
            Row(
              children: [
                _buildStatChip(
                  context,
                  'Staked',
                  '${(position.stakedAmount / 1000).toStringAsFixed(1)}K',
                  Colors.blue,
                ),
                const SizedBox(width: AppSpacing.sm),
                _buildStatChip(
                  context,
                  'Rewards',
                  '${(position.totalRewards / 1000).toStringAsFixed(1)}K',
                  Colors.green,
                ),
                const SizedBox(width: AppSpacing.sm),
                if (position.pendingRewards > 0)
                  _buildStatChip(
                    context,
                    'Pending',
                    '${(position.pendingRewards / 1000).toStringAsFixed(1)}K',
                    Colors.orange,
                  ),
              ],
            ),

            // Unbonding info
            if (position.unbondingAmount > 0) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  border: Border.all(
                    color: Colors.orange.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.schedule, color: Colors.orange, size: 16),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'Unbonding ${(position.unbondingAmount / 1000).toStringAsFixed(1)}K tokens',
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Text(
                      'Ends ${_formatDate(position.unbondingEndsAt)}',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: AppSpacing.md),

            // Action buttons
            Row(
              children: [
                if (position.pendingRewards > 0)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => onClaim(position),
                      icon: const Icon(Icons.monetization_on),
                      label: const Text('Claim Rewards'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                if (position.pendingRewards > 0)
                  const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: position.isActive
                        ? () => onUnstake(position)
                        : null,
                    icon: const Icon(Icons.remove_circle_outline),
                    label: const Text('Unstake'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  onPressed: () => _showPositionDetails(context, position),
                  icon: const Icon(Icons.info_outline),
                  tooltip: 'View Details',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: AppTypography.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatChip(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: AppTypography.bodySmall.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 64,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('No Staking Positions', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Start staking to validators or pools to see your positions here',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'unstaking':
        return Colors.orange;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now);

    if (difference.inDays > 0) {
      return 'in ${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return 'in ${difference.inHours}h';
    } else {
      return 'soon';
    }
  }

  void _showPositionDetails(
    BuildContext context,
    staking.StakingPosition position,
  ) {
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
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.outline,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Title
              Text(position.targetName, style: AppTypography.headlineSmall),
              const SizedBox(height: AppSpacing.sm),

              Text(
                position.stakingType == 'validator'
                    ? 'Validator Position'
                    : 'Pool Position',
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Details
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow(
                        'Staked Amount',
                        '${(position.stakedAmount / 1000).toStringAsFixed(1)}K tokens',
                      ),
                      _buildDetailRow(
                        'Total Rewards',
                        '${(position.totalRewards / 1000).toStringAsFixed(1)}K tokens',
                      ),
                      _buildDetailRow(
                        'Pending Rewards',
                        '${(position.pendingRewards / 1000).toStringAsFixed(1)}K tokens',
                      ),
                      _buildDetailRow('Status', position.status),
                      _buildDetailRow(
                        'Staked At',
                        _formatFullDate(position.stakedAt),
                      ),
                      _buildDetailRow(
                        'Last Claimed',
                        _formatFullDate(position.lastClaimed),
                      ),
                      if (position.unbondingAmount > 0) ...[
                        _buildDetailRow(
                          'Unbonding Amount',
                          '${(position.unbondingAmount / 1000).toStringAsFixed(1)}K tokens',
                        ),
                        _buildDetailRow(
                          'Unbonding Ends',
                          _formatFullDate(position.unbondingEndsAt),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Action buttons
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  if (position.pendingRewards > 0)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          onClaim(position);
                        },
                        icon: const Icon(Icons.monetization_on),
                        label: const Text('Claim Rewards'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  if (position.pendingRewards > 0)
                    const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: position.isActive
                          ? () {
                              Navigator.pop(context);
                              onUnstake(position);
                            }
                          : null,
                      icon: const Icon(Icons.remove_circle_outline),
                      label: const Text('Unstake'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
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

  String _formatFullDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
