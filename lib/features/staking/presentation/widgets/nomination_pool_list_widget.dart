import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying a list of nomination pools
class NominationPoolListWidget extends StatelessWidget {
  final List<staking.NominationPool> pools;
  final Function(staking.NominationPool) onPoolSelected;

  const NominationPoolListWidget({
    super.key,
    required this.pools,
    required this.onPoolSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (pools.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: pools.length,
      itemBuilder: (context, index) {
        final pool = pools[index];
        return _buildPoolCard(context, pool);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'No Nomination Pools Found',
              style: AppTypography.headlineSmall.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Try adjusting your search or filter criteria',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoolCard(BuildContext context, staking.NominationPool pool) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: () => onPoolSelected(pool),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  // Pool status indicator
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pool.isActive ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),

                  // Pool name
                  Expanded(
                    child: Text(
                      pool.name,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // APY badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      '${pool.apy.toStringAsFixed(2)}% APY',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Pool details
              Row(
                children: [
                  Expanded(
                    child: _buildDetailItem(
                      context,
                      'Pool ID',
                      '#${pool.poolId}',
                      Icons.tag,
                    ),
                  ),
                  Expanded(
                    child: _buildDetailItem(
                      context,
                      'Members',
                      '${pool.memberCount}',
                      Icons.people,
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
                      'Total Stake',
                      '${_formatStake(pool.totalStake.toDouble())} DOT',
                      Icons.account_balance_wallet,
                    ),
                  ),
                  Expanded(
                    child: _buildDetailItem(
                      context,
                      'Avg. Stake',
                      '${_formatStake(pool.totalStake.toDouble() / pool.memberCount)} DOT',
                      Icons.trending_up,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Pool description
              if (pool.description.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Text(
                    pool.description,
                    style: AppTypography.bodySmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => onPoolSelected(pool),
                      icon: const Icon(Icons.info_outline, size: 16),
                      label: const Text('Details'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _showStakeDialog(context, pool),
                      icon: const Icon(Icons.trending_up, size: 16),
                      label: const Text('Stake'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                      ),
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
          size: 16,
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
                ),
              ),
              Text(
                value,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatStake(double stake) {
    if (stake >= 1000000) {
      return '${(stake / 1000000).toStringAsFixed(1)}M';
    } else if (stake >= 1000) {
      return '${(stake / 1000).toStringAsFixed(1)}K';
    } else {
      return stake.toStringAsFixed(0);
    }
  }

  void _showStakeDialog(BuildContext context, staking.NominationPool pool) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Stake to ${pool.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('APY: ${pool.apy.toStringAsFixed(2)}%'),
            Text('Pool ID: #${pool.poolId}'),
            Text('Members: ${pool.memberCount}'),
            const SizedBox(height: AppSpacing.md),
            const Text('This will open the staking operation screen.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to staking operation screen
              Navigator.pushNamed(
                context,
                '/staking/operation',
                arguments: {
                  'operation': 'stake',
                  'poolId': pool.poolId,
                  'poolName': pool.name,
                },
              );
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
