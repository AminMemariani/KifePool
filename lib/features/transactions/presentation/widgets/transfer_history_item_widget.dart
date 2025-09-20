import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/transfer_models.dart';

/// Transfer history item widget
class TransferHistoryItemWidget extends StatelessWidget {
  final dynamic transfer;
  final VoidCallback? onTap;

  const TransferHistoryItemWidget({
    super.key,
    required this.transfer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isTokenTransfer = transfer is TokenTransfer;
    final isSent = transfer.direction == TransferDirection.send;
    final isPending = transfer.status == TransferStatus.pending;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              // Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getStatusColor(
                    context,
                    transfer.status,
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(
                  isTokenTransfer ? Icons.account_balance_wallet : Icons.image,
                  color: _getStatusColor(context, transfer.status),
                ),
              ),

              const SizedBox(width: AppSpacing.md),

              // Transfer details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            isTokenTransfer
                                ? '${transfer.amount} ${transfer.tokenSymbol}'
                                : transfer.nftName,
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isPending)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.xs,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusSm,
                              ),
                            ),
                            child: Text(
                              'Pending',
                              style: AppTypography.labelSmall.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.xs),

                    // Subtitle
                    Text(
                      isTokenTransfer
                          ? transfer.tokenName
                          : (transfer as NftTransfer).collectionId,
                      style: AppTypography.bodySmall.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppSpacing.xs),

                    // Address and time
                    Row(
                      children: [
                        Icon(
                          isSent ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 12,
                          color: isSent
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Expanded(
                          child: Text(
                            isSent
                                ? 'To: ${_formatAddress(transfer.toAddress)}'
                                : 'From: ${_formatAddress(transfer.fromAddress)}',
                            style: AppTypography.bodySmall.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.6),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          _formatTime(transfer.timestamp),
                          style: AppTypography.bodySmall.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Status indicator
              Column(
                children: [
                  Icon(
                    _getStatusIcon(transfer.status),
                    color: _getStatusColor(context, transfer.status),
                    size: 20,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    transfer.chain.toUpperCase(),
                    style: AppTypography.labelSmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
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

  Color _getStatusColor(BuildContext context, TransferStatus status) {
    switch (status) {
      case TransferStatus.pending:
        return Theme.of(context).colorScheme.primary;
      case TransferStatus.confirmed:
        return Theme.of(context).colorScheme.primary;
      case TransferStatus.failed:
        return Theme.of(context).colorScheme.error;
      case TransferStatus.cancelled:
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    }
  }

  IconData _getStatusIcon(TransferStatus status) {
    switch (status) {
      case TransferStatus.pending:
        return Icons.schedule;
      case TransferStatus.confirmed:
        return Icons.check_circle;
      case TransferStatus.failed:
        return Icons.error;
      case TransferStatus.cancelled:
        return Icons.cancel;
    }
  }

  String _formatAddress(String address) {
    if (address.length <= 12) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
