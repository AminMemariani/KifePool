import 'package:flutter/material.dart';
import 'package:kifepool/core/models/news_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:intl/intl.dart';

/// Card widget for displaying news articles
class NewsArticleCard extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;
  final VoidCallback? onShare;

  const NewsArticleCard({
    super.key,
    required this.article,
    this.onTap,
    this.onBookmark,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with source and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSourceChip(context),
                  Text(
                    _formatDate(article.publishedAt),
                    style: AppTypography.bodySmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),

              // Title
              Text(
                article.title,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: article.isRead
                      ? Theme.of(context).colorScheme.onSurface.withOpacity(0.7)
                      : Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.sm),

              // Content row with image and excerpt
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Excerpt
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.excerpt,
                          style: AppTypography.bodyMedium.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.8),
                            height: 1.4,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpacing.sm),

                        // Author and category
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 14,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.5),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Expanded(
                              child: Text(
                                article.author,
                                style: AppTypography.bodySmall.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.6),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            _buildCategoryChip(context),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Image
                  if (article.imageUrl != null) ...[
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSm,
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            article.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceVariant,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.3),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppSpacing.sm),

              // Footer with actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Read status indicator
                  if (!article.isRead)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    )
                  else
                    const SizedBox(width: 8),

                  const Spacer(),

                  // Action buttons
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          article.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: article.isBookmarked
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                        onPressed: onBookmark,
                        iconSize: 20,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                        onPressed: onShare,
                        iconSize: 20,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSourceChip(BuildContext context) {
    Color chipColor;
    IconData chipIcon;

    switch (article.newsSource) {
      case NewsSource.polkadotBlog:
        chipColor = const Color(0xFFE6007A);
        chipIcon = Icons.circle;
        break;
      case NewsSource.subsocial:
        chipColor = const Color(0xFF00D4AA);
        chipIcon = Icons.people;
        break;
      case NewsSource.medium:
        chipColor = const Color(0xFF00AB6C);
        chipIcon = Icons.article;
        break;
      case NewsSource.twitter:
        chipColor = const Color(0xFF1DA1F2);
        chipIcon = Icons.alternate_email;
        break;
      case NewsSource.github:
        chipColor = const Color(0xFF333333);
        chipIcon = Icons.code;
        break;
      default:
        chipColor = Theme.of(context).colorScheme.primary;
        chipIcon = Icons.newspaper;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: chipColor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(chipIcon, size: 12, color: chipColor),
          const SizedBox(width: AppSpacing.xs),
          Text(
            article.source,
            style: AppTypography.labelSmall.copyWith(
              color: chipColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context) {
    Color categoryColor;

    switch (article.category) {
      case NewsCategory.ecosystem:
        categoryColor = Colors.blue;
        break;
      case NewsCategory.technology:
        categoryColor = Colors.green;
        break;
      case NewsCategory.governance:
        categoryColor = Colors.purple;
        break;
      case NewsCategory.partnerships:
        categoryColor = Colors.orange;
        break;
      case NewsCategory.updates:
        categoryColor = Colors.teal;
        break;
      case NewsCategory.events:
        categoryColor = Colors.red;
        break;
      case NewsCategory.tutorials:
        categoryColor = Colors.indigo;
        break;
      default:
        categoryColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
      ),
      child: Text(
        article.category.name.toUpperCase(),
        style: AppTypography.labelSmall.copyWith(
          color: categoryColor,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        } else {
          return '${difference.inMinutes}m ago';
        }
      } else {
        return '${difference.inHours}h ago';
      }
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return DateFormat('MMM d').format(date);
    }
  }
}
