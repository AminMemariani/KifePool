import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/governance_models.dart';

/// Card widget for displaying a referendum
class ReferendumCard extends StatelessWidget {
  final Referendum referendum;
  final VoidCallback onTap;

  const ReferendumCard({
    super.key,
    required this.referendum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with index and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${referendum.referendumIndex}',
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        referendum.status,
                      ).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      _getStatusText(referendum.status),
                      style: AppTypography.bodySmall.copyWith(
                        color: _getStatusColor(referendum.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Title
              if (referendum.title != null)
                Text(
                  referendum.title!,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

              const SizedBox(height: AppSpacing.sm),

              // Description preview
              if (referendum.description != null)
                Text(
                  referendum.description!,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

              const SizedBox(height: AppSpacing.md),

              // Voting stats
              Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      context,
                      Icons.thumb_up,
                      'Aye',
                      '${referendum.ayeVotes ?? 0}',
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: _buildStatItem(
                      context,
                      Icons.thumb_down,
                      'Nay',
                      '${referendum.nayVotes ?? 0}',
                      Colors.red,
                    ),
                  ),
                  if (referendum.approvalPercentage != null) ...[
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: _buildStatItem(
                        context,
                        Icons.percent,
                        'Approval',
                        '${referendum.approvalPercentage!.toStringAsFixed(1)}%',
                        Colors.blue,
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: AppSpacing.sm),

              // Track and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (referendum.trackName != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceVariant.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSm,
                        ),
                      ),
                      child: Text(
                        referendum.trackName!,
                        style: AppTypography.bodySmall,
                      ),
                    ),
                  if (referendum.votingEndsAt != null)
                    Text(
                      'Ends: ${_formatDate(referendum.votingEndsAt!)}',
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
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: AppSpacing.xs),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: AppTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ReferendumStatus status) {
    switch (status) {
      case ReferendumStatus.approved:
        return Colors.green;
      case ReferendumStatus.rejected:
      case ReferendumStatus.cancelled:
      case ReferendumStatus.killed:
        return Colors.red;
      case ReferendumStatus.deciding:
      case ReferendumStatus.confirming:
        return Colors.orange;
      case ReferendumStatus.submitted:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(ReferendumStatus status) {
    switch (status) {
      case ReferendumStatus.submitted:
        return 'Submitted';
      case ReferendumStatus.deciding:
        return 'Deciding';
      case ReferendumStatus.confirming:
        return 'Confirming';
      case ReferendumStatus.approved:
        return 'Approved';
      case ReferendumStatus.rejected:
        return 'Rejected';
      case ReferendumStatus.cancelled:
        return 'Cancelled';
      case ReferendumStatus.timedOut:
        return 'Timed Out';
      case ReferendumStatus.killed:
        return 'Killed';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Ended';
    }
  }
}
