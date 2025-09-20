import 'package:flutter/material.dart';
import '../../core/models/blockchain_models.dart';
import '../../core/services/error_handler.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

/// Error display widget with retry functionality
class ErrorDisplay extends StatelessWidget {
  final BlockchainException error;
  final VoidCallback? onRetry;
  final String? context;

  const ErrorDisplay({
    super.key,
    required this.error,
    this.onRetry,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    final isRetryable = ErrorHandler.isRetryable(error);
    final userMessage = ErrorHandler.handleBlockchainError(error);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_getErrorIcon(error.type), size: 64, color: AppColors.error),
            SizedBox(height: AppSpacing.md),
            Text(
              _getErrorTitle(error.type),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              userMessage,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey600),
              textAlign: TextAlign.center,
            ),
            if (isRetryable && onRetry != null) ...[
              SizedBox(height: AppSpacing.lg),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon(BlockchainErrorType type) {
    switch (type) {
      case BlockchainErrorType.networkError:
        return Icons.wifi_off;
      case BlockchainErrorType.rpcError:
        return Icons.error_outline;
      case BlockchainErrorType.insufficientBalance:
        return Icons.account_balance_wallet_outlined;
      case BlockchainErrorType.invalidAddress:
        return Icons.location_off;
      case BlockchainErrorType.transactionFailed:
        return Icons.cancel_outlined;
      case BlockchainErrorType.stakingError:
        return Icons.trending_up;
      case BlockchainErrorType.crossChainError:
        return Icons.swap_horiz;
      case BlockchainErrorType.unknown:
        return Icons.help_outline;
    }
  }

  String _getErrorTitle(BlockchainErrorType type) {
    switch (type) {
      case BlockchainErrorType.networkError:
        return 'Connection Error';
      case BlockchainErrorType.rpcError:
        return 'Server Error';
      case BlockchainErrorType.insufficientBalance:
        return 'Insufficient Balance';
      case BlockchainErrorType.invalidAddress:
        return 'Invalid Address';
      case BlockchainErrorType.transactionFailed:
        return 'Transaction Failed';
      case BlockchainErrorType.stakingError:
        return 'Staking Error';
      case BlockchainErrorType.crossChainError:
        return 'Cross-Chain Error';
      case BlockchainErrorType.unknown:
        return 'Unknown Error';
    }
  }
}

/// Error toast widget
class ErrorToast extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final VoidCallback? onDismiss;

  const ErrorToast({
    super.key,
    required this.message,
    this.onRetry,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 24),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (onRetry != null) ...[
            SizedBox(width: AppSpacing.sm),
            TextButton(
              onPressed: onRetry,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
          if (onDismiss != null) ...[
            SizedBox(width: AppSpacing.xs),
            IconButton(
              onPressed: onDismiss,
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ],
        ],
      ),
    );
  }
}

/// Success toast widget
class SuccessToast extends StatelessWidget {
  final String message;
  final VoidCallback? onDismiss;

  const SuccessToast({super.key, required this.message, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.white, size: 24),
          SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (onDismiss != null) ...[
            SizedBox(width: AppSpacing.xs),
            IconButton(
              onPressed: onDismiss,
              icon: const Icon(Icons.close, color: Colors.white, size: 20),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            ),
          ],
        ],
      ),
    );
  }
}

/// Empty state widget
class EmptyState extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onAction;
  final String? actionText;

  const EmptyState({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.onAction,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: AppColors.grey400),
            SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.grey600,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.grey500),
              textAlign: TextAlign.center,
            ),
            if (onAction != null && actionText != null) ...[
              SizedBox(height: AppSpacing.lg),
              ElevatedButton(onPressed: onAction, child: Text(actionText!)),
            ],
          ],
        ),
      ),
    );
  }
}

/// Retry button widget
class RetryButton extends StatelessWidget {
  final VoidCallback onRetry;
  final String? text;
  final bool isLoading;

  const RetryButton({
    super.key,
    required this.onRetry,
    this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onRetry,
      icon: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Icon(Icons.refresh),
      label: Text(text ?? 'Retry'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
