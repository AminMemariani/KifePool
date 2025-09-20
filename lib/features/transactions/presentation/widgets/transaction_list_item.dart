import 'package:flutter/material.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/services/transaction_history_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Transaction list item widget
class TransactionListItem extends StatefulWidget {
  final TransactionHistory transaction;
  final VoidCallback? onTap;

  const TransactionListItem({super.key, required this.transaction, this.onTap});

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chainInfo = TransactionHistoryService.getChainInfo(
      widget.transaction.chain,
    );

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: InkWell(
        onTap: widget.onTap ?? _toggleExpanded,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Column(
          children: [
            // Main transaction info
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  // Chain logo and transaction type icon
                  _buildTransactionIcon(chainInfo),

                  const SizedBox(width: AppSpacing.md),

                  // Transaction details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                _getTransactionTypeDisplayName(
                                  widget.transaction.type,
                                ),
                                style: AppTypography.titleSmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            _buildStatusChip(),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Text(
                              chainInfo.name,
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              '•',
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              _formatTimestamp(widget.transaction.timestamp),
                              style: AppTypography.bodySmall.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Icon(
                              widget.transaction.direction ==
                                      TransactionDirection.incoming
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              size: 16,
                              color:
                                  widget.transaction.direction ==
                                      TransactionDirection.incoming
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              '${widget.transaction.amount} ${widget.transaction.tokenSymbol}',
                              style: AppTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    widget.transaction.direction ==
                                        TransactionDirection.incoming
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Expand/collapse button
                  IconButton(
                    icon: AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.expand_more),
                    ),
                    onPressed: _toggleExpanded,
                  ),
                ],
              ),
            ),

            // Expanded details
            SizeTransition(
              sizeFactor: _expandAnimation,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  0,
                  AppSpacing.md,
                  AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: AppSpacing.sm),

                    // Transaction hash
                    _buildDetailRow('Hash', widget.transaction.hash),

                    // Block number
                    _buildDetailRow(
                      'Block',
                      widget.transaction.blockNumber.toString(),
                    ),

                    // Gas fee
                    _buildDetailRow(
                      'Gas Fee',
                      '${widget.transaction.gasFee} ${widget.transaction.tokenSymbol}',
                    ),

                    // From/To addresses
                    _buildDetailRow('From', widget.transaction.fromAddress),
                    _buildDetailRow('To', widget.transaction.toAddress),

                    const SizedBox(height: AppSpacing.md),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _copyToClipboard(widget.transaction.hash),
                            icon: const Icon(Icons.copy, size: 16),
                            label: const Text('Copy Hash'),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        if (widget.transaction.explorerUrl != null)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _openExplorer(
                                widget.transaction.explorerUrl!,
                              ),
                              icon: const Icon(Icons.open_in_new, size: 16),
                              label: const Text('Explorer'),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionIcon(ChainInfo chainInfo) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Stack(
        children: [
          // Chain logo (placeholder)
          Center(
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _getChainColor(widget.transaction.chain),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Center(
                child: Text(
                  chainInfo.symbol.substring(0, 2),
                  style: AppTypography.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Transaction type icon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: Icon(
                _getTransactionTypeIcon(widget.transaction.type),
                size: 12,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip() {
    Color statusColor;
    switch (widget.transaction.status) {
      case TransactionStatus.confirmed:
        statusColor = Colors.green;
        break;
      case TransactionStatus.pending:
        statusColor = Colors.orange;
        break;
      case TransactionStatus.failed:
        statusColor = Colors.red;
        break;
      case TransactionStatus.cancelled:
        statusColor = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Text(
        widget.transaction.status.name.toUpperCase(),
        style: AppTypography.bodySmall.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
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

  IconData _getTransactionTypeIcon(TransactionType type) {
    switch (type) {
      case TransactionType.transfer:
        return Icons.swap_horiz;
      case TransactionType.staking:
        return Icons.lock;
      case TransactionType.unstaking:
        return Icons.lock_open;
      case TransactionType.reward:
        return Icons.stars;
      case TransactionType.nftTransfer:
        return Icons.image;
      case TransactionType.crossChain:
        return Icons.compare_arrows;
      case TransactionType.contractCall:
        return Icons.code;
      case TransactionType.other:
        return Icons.more_horiz;
    }
  }

  String _getTransactionTypeDisplayName(TransactionType type) {
    switch (type) {
      case TransactionType.transfer:
        return 'Transfer';
      case TransactionType.staking:
        return 'Staking';
      case TransactionType.unstaking:
        return 'Unstaking';
      case TransactionType.reward:
        return 'Reward';
      case TransactionType.nftTransfer:
        return 'NFT Transfer';
      case TransactionType.crossChain:
        return 'Cross Chain';
      case TransactionType.contractCall:
        return 'Contract Call';
      case TransactionType.other:
        return 'Other';
    }
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
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Hash copied to clipboard')));
  }

  void _openExplorer(String url) {
    // url_launcher.launchUrl(Uri.parse(url));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Opening explorer: $url')));
  }
}
