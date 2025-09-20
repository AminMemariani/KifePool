import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Confirmation dialog for staking operations
class StakingConfirmationDialog extends StatelessWidget {
  final String operation;
  final double amount;
  final String target;

  const StakingConfirmationDialog({
    super.key,
    required this.operation,
    required this.amount,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(_getOperationIcon(), color: _getOperationColor()),
          const SizedBox(width: AppSpacing.sm),
          Text('Confirm ${_getOperationTitle()}'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please review the details of your ${operation} operation:',
              style: AppTypography.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Operation details card
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Column(
                children: [
                  _buildDetailRow('Operation', _getOperationTitle()),
                  _buildDetailRow('Amount', '${amount.toStringAsFixed(2)} DOT'),
                  _buildDetailRow('Target', target),
                  _buildDetailRow('Chain', 'Polkadot'),
                  _buildDetailRow('Transaction Fee', '0.1 DOT'),
                  if (operation == 'stake') ...[
                    _buildDetailRow('Estimated APY', '12.5%'),
                    _buildDetailRow('Unbonding Period', '28 days'),
                  ],
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Warning message
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: _getWarningColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(color: _getWarningColor().withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(_getWarningIcon(), color: _getWarningColor(), size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      _getWarningMessage(),
                      style: AppTypography.bodySmall.copyWith(
                        color: _getWarningColor(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: _getOperationColor(),
            foregroundColor: Colors.white,
          ),
          child: Text(_getOperationTitle()),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getOperationTitle() {
    switch (operation) {
      case 'stake':
        return 'Stake';
      case 'unstake':
        return 'Unstake';
      case 'claim':
        return 'Claim';
      default:
        return operation;
    }
  }

  IconData _getOperationIcon() {
    switch (operation) {
      case 'stake':
        return Icons.trending_up;
      case 'unstake':
        return Icons.trending_down;
      case 'claim':
        return Icons.monetization_on;
      default:
        return Icons.account_balance_wallet;
    }
  }

  Color _getOperationColor() {
    switch (operation) {
      case 'stake':
        return Colors.green;
      case 'unstake':
        return Colors.orange;
      case 'claim':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getWarningIcon() {
    switch (operation) {
      case 'stake':
        return Icons.info_outline;
      case 'unstake':
        return Icons.schedule;
      case 'claim':
        return Icons.info_outline;
      default:
        return Icons.warning;
    }
  }

  Color _getWarningColor() {
    switch (operation) {
      case 'stake':
        return Colors.blue;
      case 'unstake':
        return Colors.orange;
      case 'claim':
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  String _getWarningMessage() {
    switch (operation) {
      case 'stake':
        return 'Your tokens will be locked and you can unstake them after a 28-day unbonding period.';
      case 'unstake':
        return 'This will start a 28-day unbonding period. You will not earn rewards during this time.';
      case 'claim':
        return 'This operation will transfer your rewards to your available balance.';
      default:
        return 'Please review the details before confirming.';
    }
  }
}
