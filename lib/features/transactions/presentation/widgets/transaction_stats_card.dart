import 'package:flutter/material.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Transaction statistics card widget
class TransactionStatsCard extends StatelessWidget {
  final TransactionStats stats;

  const TransactionStatsCard({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Statistics',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Overview stats
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Total',
                    stats.totalTransactions.toString(),
                    Icons.receipt_long,
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Confirmed',
                    stats.confirmedTransactions.toString(),
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Pending',
                    stats.pendingTransactions.toString(),
                    Icons.schedule,
                    Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Failed',
                    stats.failedTransactions.toString(),
                    Icons.error,
                    Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            const Divider(),
            const SizedBox(height: AppSpacing.lg),

            // Volume and fees
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Total Volume',
                    '${_formatAmount(stats.totalVolume)}',
                    Icons.account_balance_wallet,
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    context,
                    'Total Fees',
                    '${_formatAmount(stats.totalFees)}',
                    Icons.local_gas_station,
                    Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),

            if (stats.transactionsByChain.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              const Divider(),
              const SizedBox(height: AppSpacing.lg),

              // Transactions by chain
              Text(
                'By Chain',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildChainStats(context),
            ],

            if (stats.transactionsByType.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              const Divider(),
              const SizedBox(height: AppSpacing.lg),

              // Transactions by type
              Text(
                'By Type',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildTypeStats(context),
            ],
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
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildChainStats(BuildContext context) {
    final sortedChains = stats.transactionsByChain.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: sortedChains.take(4).map((entry) {
        final percentage = stats.totalTransactions > 0
            ? (entry.value / stats.totalTransactions * 100).round()
            : 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getChainColor(entry.key),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  entry.key.toUpperCase(),
                  style: AppTypography.bodySmall,
                ),
              ),
              Text(
                '${entry.value} ($percentage%)',
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTypeStats(BuildContext context) {
    final sortedTypes = stats.transactionsByType.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: sortedTypes.take(4).map((entry) {
        final percentage = stats.totalTransactions > 0
            ? (entry.value / stats.totalTransactions * 100).round()
            : 0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Row(
            children: [
              Icon(
                _getTransactionTypeIcon(entry.key),
                size: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  entry.key.replaceAll('_', ' ').toUpperCase(),
                  style: AppTypography.bodySmall,
                ),
              ),
              Text(
                '${entry.value} ($percentage%)',
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getChainColor(String chain) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return const Color(0xFFE6007A);
      case 'kusama':
        return const Color(0xFF000000);
      case 'moonbeam':
        return const Color(0xFF53CBC9);
      case 'astar':
        return const Color(0xFF1B365D);
      default:
        return Colors.grey;
    }
  }

  IconData _getTransactionTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'transfer':
        return Icons.swap_horiz;
      case 'staking':
        return Icons.lock;
      case 'unstaking':
        return Icons.lock_open;
      case 'reward':
        return Icons.stars;
      case 'nft_transfer':
        return Icons.image;
      case 'cross_chain':
        return Icons.compare_arrows;
      case 'contract_call':
        return Icons.code;
      default:
        return Icons.more_horiz;
    }
  }

  String _formatAmount(String amount) {
    final value = double.tryParse(amount) ?? 0;
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return value.toStringAsFixed(2);
    }
  }
}
