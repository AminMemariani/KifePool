import 'package:flutter/material.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Widget for displaying a single XCM transfer in the history list
class XcmTransferListItem extends StatefulWidget {
  final XcmTransfer transfer;
  final VoidCallback? onTap;

  const XcmTransferListItem({super.key, required this.transfer, this.onTap});

  @override
  State<XcmTransferListItem> createState() => _XcmTransferListItemState();
}

class _XcmTransferListItemState extends State<XcmTransferListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
          widget.onTap?.call();
        },
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Row(
                children: [
                  // Transfer type icon
                  _buildTransferIcon(),

                  const SizedBox(width: AppSpacing.md),

                  // Transfer details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${widget.transfer.sourceChain} → ${widget.transfer.destinationChain}',
                                style: AppTypography.titleSmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '${widget.transfer.amount} ${widget.transfer.assetSymbol}',
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    widget.transfer.direction ==
                                        XcmTransferDirection.outbound
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Text(
                              _getTransferTypeDisplayName(widget.transfer.type),
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              '•',
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              _formatTimestamp(widget.transfer.timestamp),
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Status chip
                  const SizedBox(width: AppSpacing.md),
                  _buildStatusChip(widget.transfer.status),
                ],
              ),

              // Expanded details
              SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: _isExpanded
                      ? AlwaysStoppedAnimation(1.0)
                      : AlwaysStoppedAnimation(0.0),
                  curve: Curves.easeInOut,
                ),
                axisAlignment: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.md),
                    const Divider(),
                    const SizedBox(height: AppSpacing.sm),

                    // Transfer ID
                    _buildDetailRow('Transfer ID', widget.transfer.transferId),

                    // Direction
                    _buildDetailRow(
                      'Direction',
                      widget.transfer.direction.name,
                    ),

                    // Fees
                    _buildDetailRow(
                      'Transfer Fee',
                      '${widget.transfer.transferFee} ${widget.transfer.assetSymbol}',
                    ),
                    _buildDetailRow(
                      'XCM Fee',
                      '${widget.transfer.xcmFee} ${widget.transfer.assetSymbol}',
                    ),

                    // Addresses
                    _buildDetailRow('From', widget.transfer.sourceAddress),
                    _buildDetailRow('To', widget.transfer.destinationAddress),

                    // Error message if failed
                    if (widget.transfer.errorMessage != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.errorContainer.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusSm,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text(
                                widget.transfer.errorMessage!,
                                style: AppTypography.bodySmall.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
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
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _copyToClipboard(widget.transfer.transferId),
                            icon: const Icon(Icons.copy, size: 16),
                            label: const Text('Copy ID'),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _viewOnExplorer(),
                            icon: const Icon(Icons.open_in_new, size: 16),
                            label: const Text('Explorer'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransferIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _getTransferTypeColor(widget.transfer.type),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Icon(
        _getTransferTypeIcon(widget.transfer.type),
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildStatusChip(XcmTransferStatus status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case XcmTransferStatus.confirmed:
        color = Colors.green.shade100;
        text = 'Confirmed';
        icon = Icons.check_circle;
        break;
      case XcmTransferStatus.processing:
        color = Colors.blue.shade100;
        text = 'Processing';
        icon = Icons.sync;
        break;
      case XcmTransferStatus.initiated:
        color = Colors.orange.shade100;
        text = 'Initiated';
        icon = Icons.schedule;
        break;
      case XcmTransferStatus.failed:
        color = Colors.red.shade100;
        text = 'Failed';
        icon = Icons.error;
        break;
      case XcmTransferStatus.cancelled:
        color = Colors.grey.shade300;
        text = 'Cancelled';
        icon = Icons.cancel;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            text,
            style: AppTypography.labelSmall.copyWith(
              color: color.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getTransferTypeDisplayName(XcmTransferType type) {
    switch (type) {
      case XcmTransferType.token:
        return 'Token Transfer';
      case XcmTransferType.nft:
        return 'NFT Transfer';
    }
  }

  IconData _getTransferTypeIcon(XcmTransferType type) {
    switch (type) {
      case XcmTransferType.token:
        return Icons.account_balance_wallet;
      case XcmTransferType.nft:
        return Icons.image;
    }
  }

  Color _getTransferTypeColor(XcmTransferType type) {
    switch (type) {
      case XcmTransferType.token:
        return Colors.blue;
      case XcmTransferType.nft:
        return Colors.purple;
    }
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
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTypography.bodySmall)),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
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

  void _copyToClipboard(String text) {
    // Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transfer ID copied to clipboard')),
    );
  }

  void _viewOnExplorer() {
    // TODO: Implement actual URL launcher
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Opening explorer...')));
  }
}
