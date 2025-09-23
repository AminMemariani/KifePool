import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/models/news_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/features/news/presentation/widgets/featured_projects_carousel.dart';
import 'package:kifepool/features/news/presentation/widgets/news_article_card.dart';
import 'package:kifepool/features/news/presentation/widgets/news_filter_dialog.dart';
import 'package:kifepool/shared/providers/news_provider.dart';

/// Main news screen with featured projects and articles
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Initialize news provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newsProvider = Provider.of<NewsProvider>(context, listen: false);
      newsProvider.initialize();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreArticles();
    }
  }

  Future<void> _loadMoreArticles() async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    await newsProvider.loadMoreArticles();

    setState(() {
      _isLoadingMore = false;
    });
  }

  Future<void> _refreshNews() async {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    await newsProvider.refreshNewsFeed();
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => NewsFilterDialog(
        currentFilter: Provider.of<NewsProvider>(
          context,
          listen: false,
        ).currentFilter,
        onFilterApplied: (filter) {
          final newsProvider = Provider.of<NewsProvider>(
            context,
            listen: false,
          );
          newsProvider.applyFilter(filter);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecosystem News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
            tooltip: 'Filter News',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshNews,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.isLoading && newsProvider.articles.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (newsProvider.error != null && newsProvider.articles.isEmpty) {
            return _buildErrorState(newsProvider.error!);
          }

          return RefreshIndicator(
            onRefresh: _refreshNews,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Featured projects carousel
                if (newsProvider.featuredProjects.isNotEmpty)
                  SliverToBoxAdapter(
                    child: FeaturedProjectsCarousel(
                      projects: newsProvider.featuredProjects,
                      onProjectTap: (project) {
                        newsProvider.incrementProjectViewCount(
                          project.projectId,
                        );
                      },
                    ),
                  ),

                // News stats
                if (newsProvider.stats != null)
                  SliverToBoxAdapter(
                    child: _buildNewsStats(newsProvider.stats!),
                  ),

                // News articles header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: AppTypography.headlineSmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (newsProvider.lastRefresh != null)
                          Text(
                            'Updated ${_formatLastRefresh(newsProvider.lastRefresh!)}',
                            style: AppTypography.bodySmall.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // News articles list
                if (newsProvider.articles.isEmpty)
                  SliverFillRemaining(child: _buildEmptyState())
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < newsProvider.articles.length) {
                          final article = newsProvider.articles[index];
                          return NewsArticleCard(
                            article: article,
                            onTap: () {
                              newsProvider.markArticleAsRead(article.articleId);
                              _showArticleDetail(article);
                            },
                            onBookmark: () {
                              newsProvider.toggleArticleBookmark(
                                article.articleId,
                              );
                            },
                            onShare: () {
                              _shareArticle(article);
                            },
                          );
                        } else if (_isLoadingMore) {
                          return const Padding(
                            padding: EdgeInsets.all(AppSpacing.lg),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                      childCount:
                          newsProvider.articles.length +
                          (_isLoadingMore ? 1 : 0),
                    ),
                  ),

                // Loading indicator for refresh
                if (newsProvider.isRefreshing)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.lg),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewsStats(NewsStats stats) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total', stats.totalArticles.toString()),
          _buildStatItem('Unread', stats.unreadArticles.toString()),
          _buildStatItem('Bookmarked', stats.bookmarkedArticles.toString()),
          _buildStatItem('Projects', stats.featuredProjectsCount.toString()),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Error Loading News', style: AppTypography.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              error,
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(onPressed: _refreshNews, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.newspaper_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('No News Articles', style: AppTypography.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Pull down to refresh and load the latest news from the ecosystem.',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton.icon(
              onPressed: _refreshNews,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleDetail(NewsArticle article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusLg),
                ),
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Article Details',
                          style: AppTypography.headlineSmall,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            style: AppTypography.headlineSmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Text(
                                article.author,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                '•',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                _formatDate(article.publishedAt),
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          if (article.imageUrl != null) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusMd,
                              ),
                              child: Image.network(
                                article.imageUrl!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 200,
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
                            const SizedBox(height: AppSpacing.lg),
                          ],
                          Text(
                            article.content,
                            style: AppTypography.bodyMedium.copyWith(
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _shareArticle(NewsArticle article) {
    // TODO: Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share functionality coming soon!')),
    );
  }

  String _formatLastRefresh(DateTime lastRefresh) {
    final now = DateTime.now();
    final difference = now.difference(lastRefresh);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
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
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
