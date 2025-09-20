import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Success dialog for staking operations
class StakingSuccessDialog extends StatelessWidget {
  final String operation;
  final double amount;
  final String transactionHash;

  const StakingSuccessDialog({
    super.key,
    required this.operation,
    required this.amount,
    required this.transactionHash,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('${_getOperationTitle()} Successful'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your ${operation} operation has been completed successfully!',
              style: AppTypography.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Success details card
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  _buildDetailRow('Operation', _getOperationTitle()),
                  _buildDetailRow('Amount', '${amount.toStringAsFixed(2)} DOT'),
                  _buildDetailRow(
                    'Transaction Hash',
                    _truncateHash(transactionHash),
                  ),
                  _buildDetailRow('Status', 'Confirmed'),
                  _buildDetailRow('Timestamp', _getCurrentTimestamp()),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Next steps
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'s Next?',
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ..._getNextSteps().map(
                    (step) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xs,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(step, style: AppTypography.bodySmall),
                          ),
                        ],
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
          onPressed: () => _copyTransactionHash(context),
          child: const Text('Copy Hash'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('Done'),
        ),
      ],
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
              style: AppTypography.bodySmall.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTypography.bodySmall)),
        ],
      ),
    );
  }

  String _getOperationTitle() {
    switch (operation) {
      case 'stake':
        return 'Staking';
      case 'unstake':
        return 'Unstaking';
      case 'claim':
        return 'Claiming';
      default:
        return operation;
    }
  }

  String _truncateHash(String hash) {
    if (hash.length <= 20) return hash;
    return '${hash.substring(0, 10)}...${hash.substring(hash.length - 10)}';
  }

  String _getCurrentTimestamp() {
    final now = DateTime.now();
    return '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }

  List<String> _getNextSteps() {
    switch (operation) {
      case 'stake':
        return [
          'Your tokens are now staked and earning rewards',
          'Rewards will be calculated and distributed automatically',
          'You can monitor your staking position in the dashboard',
          'To unstake, use the unstake function (28-day unbonding period)',
        ];
      case 'unstake':
        return [
          'Your unstaking request has been submitted',
          'A 28-day unbonding period has started',
          'You will not earn rewards during the unbonding period',
          'Tokens will be available after the unbonding period ends',
        ];
      case 'claim':
        return [
          'Your rewards have been transferred to your available balance',
          'You can now use these tokens for other operations',
          'Continue staking to earn more rewards',
        ];
      default:
        return [
          'Your operation has been completed successfully',
          'Check your balance and transaction history',
        ];
    }
  }

  void _copyTransactionHash(BuildContext context) {
    // In a real app, you would copy to clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Transaction hash copied: ${_truncateHash(transactionHash)}',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
