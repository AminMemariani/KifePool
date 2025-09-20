import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Error dialog for staking operations
class StakingErrorDialog extends StatelessWidget {
  final String operation;
  final String error;
  final VoidCallback? onRetry;

  const StakingErrorDialog({
    super.key,
    required this.operation,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.error_outline, color: Colors.red, size: 24),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('${_getOperationTitle()} Failed'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your ${operation} operation could not be completed.',
              style: AppTypography.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.lg),

            // Error details card
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Error Details:',
                    style: AppTypography.titleSmall.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(error, style: AppTypography.bodySmall),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Possible causes
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
                    'Possible Causes:',
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ..._getPossibleCauses().map(
                    (cause) => Padding(
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
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Text(cause, style: AppTypography.bodySmall),
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
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
        if (onRetry != null)
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onRetry!();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
            child: const Text('Retry'),
          ),
      ],
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

  List<String> _getPossibleCauses() {
    switch (operation) {
      case 'stake':
        return [
          'Insufficient balance for staking amount',
          'Validator is not accepting new stakes',
          'Network congestion or high fees',
          'Validator is oversubscribed',
          'Invalid validator address',
        ];
      case 'unstake':
        return [
          'Insufficient staked amount to unstake',
          'Validator is not accepting unstake requests',
          'Network congestion or high fees',
          'Invalid staking position',
          'Unstaking already in progress',
        ];
      case 'claim':
        return [
          'No rewards available to claim',
          'Network congestion or high fees',
          'Invalid staking position',
          'Rewards already claimed',
          'Validator is not distributing rewards',
        ];
      default:
        return [
          'Network connectivity issues',
          'Insufficient balance for transaction fees',
          'Invalid transaction parameters',
          'Network congestion',
          'Service temporarily unavailable',
        ];
    }
  }
}
