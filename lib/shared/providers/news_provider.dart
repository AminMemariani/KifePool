import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/news_models.dart';
import 'package:kifepool/core/services/news_service.dart';

/// Provider for managing news and featured projects state
class NewsProvider extends ChangeNotifier {
  List<NewsArticle> _articles = [];
  List<FeaturedProject> _featuredProjects = [];
  NewsStats? _stats;
  NewsFilter _currentFilter = const NewsFilter();
  bool _isLoading = false;
  bool _isRefreshing = false;
  String? _error;
  DateTime? _lastRefresh;

  // Getters
  List<NewsArticle> get articles => _articles;
  List<FeaturedProject> get featuredProjects => _featuredProjects;
  NewsStats? get stats => _stats;
  NewsFilter get currentFilter => _currentFilter;
  bool get isLoading => _isLoading;
  bool get isRefreshing => _isRefreshing;
  String? get error => _error;
  DateTime? get lastRefresh => _lastRefresh;

  /// Initialize news provider
  Future<void> initialize() async {
    await loadCachedData();
    await refreshNewsFeed();
  }

  /// Load cached data
  Future<void> loadCachedData() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final cachedArticles = await NewsService.getCachedNewsArticles(
        filter: _currentFilter,
      );
      final cachedProjects = await NewsService.getCachedFeaturedProjects();
      final cachedStats = await NewsService.getNewsStats();

      _articles = cachedArticles;
      _featuredProjects = cachedProjects;
      _stats = cachedStats;
    } catch (e) {
      _error = 'Failed to load cached data: $e';
      debugPrint('Error loading cached data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh news feed
  Future<void> refreshNewsFeed() async {
    try {
      _isRefreshing = true;
      _error = null;
      notifyListeners();

      final result = await NewsService.refreshNewsFeed();

      _articles = result.articles;
      _featuredProjects = result.featuredProjects;
      _lastRefresh = result.lastUpdated;

      // Update stats
      _stats = await NewsService.getNewsStats();
    } catch (e) {
      _error = 'Failed to refresh news feed: $e';
      debugPrint('Error refreshing news feed: $e');
    } finally {
      _isRefreshing = false;
      notifyListeners();
    }
  }

  /// Load more articles
  Future<void> loadMoreArticles() async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      notifyListeners();

      final newFilter = _currentFilter.copyWith(offset: _articles.length);

      final newArticles = await NewsService.fetchNewsArticles(
        filter: newFilter,
      );

      _articles.addAll(newArticles);
    } catch (e) {
      _error = 'Failed to load more articles: $e';
      debugPrint('Error loading more articles: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Apply filter
  Future<void> applyFilter(NewsFilter filter) async {
    try {
      _currentFilter = filter;
      _isLoading = true;
      _error = null;
      notifyListeners();

      final filteredArticles = await NewsService.fetchNewsArticles(
        filter: filter,
      );

      _articles = filteredArticles;
    } catch (e) {
      _error = 'Failed to apply filter: $e';
      debugPrint('Error applying filter: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Clear filter
  Future<void> clearFilter() async {
    await applyFilter(const NewsFilter());
  }

  /// Search articles
  Future<void> searchArticles(String query) async {
    final searchFilter = _currentFilter.copyWith(
      searchQuery: query.isEmpty ? null : query,
      offset: 0,
    );
    await applyFilter(searchFilter);
  }

  /// Mark article as read
  Future<void> markArticleAsRead(String articleId) async {
    try {
      await NewsService.markArticleAsRead(articleId);

      // Update local state
      final articleIndex = _articles.indexWhere(
        (a) => a.articleId == articleId,
      );
      if (articleIndex != -1) {
        _articles[articleIndex].isRead = true;
        _articles[articleIndex].updatedAt = DateTime.now();
        notifyListeners();
      }

      // Update stats
      _stats = await NewsService.getNewsStats();
    } catch (e) {
      debugPrint('Error marking article as read: $e');
    }
  }

  /// Toggle article bookmark
  Future<void> toggleArticleBookmark(String articleId) async {
    try {
      await NewsService.toggleArticleBookmark(articleId);

      // Update local state
      final articleIndex = _articles.indexWhere(
        (a) => a.articleId == articleId,
      );
      if (articleIndex != -1) {
        _articles[articleIndex].isBookmarked =
            !_articles[articleIndex].isBookmarked;
        _articles[articleIndex].updatedAt = DateTime.now();
        notifyListeners();
      }

      // Update stats
      _stats = await NewsService.getNewsStats();
    } catch (e) {
      debugPrint('Error toggling article bookmark: $e');
    }
  }

  /// Increment project view count
  Future<void> incrementProjectViewCount(String projectId) async {
    try {
      await NewsService.incrementProjectViewCount(projectId);

      // Update local state
      final projectIndex = _featuredProjects.indexWhere(
        (p) => p.projectId == projectId,
      );
      if (projectIndex != -1) {
        _featuredProjects[projectIndex].viewCount++;
        _featuredProjects[projectIndex].updatedAt = DateTime.now();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error incrementing project view count: $e');
    }
  }

  /// Increment project click count
  Future<void> incrementProjectClickCount(String projectId) async {
    try {
      await NewsService.incrementProjectClickCount(projectId);

      // Update local state
      final projectIndex = _featuredProjects.indexWhere(
        (p) => p.projectId == projectId,
      );
      if (projectIndex != -1) {
        _featuredProjects[projectIndex].clickCount++;
        _featuredProjects[projectIndex].updatedAt = DateTime.now();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error incrementing project click count: $e');
    }
  }

  /// Get articles by category
  List<NewsArticle> getArticlesByCategory(NewsCategory category) {
    return _articles.where((a) => a.category == category).toList();
  }

  /// Get articles by source
  List<NewsArticle> getArticlesBySource(NewsSource source) {
    return _articles.where((a) => a.newsSource == source).toList();
  }

  /// Get bookmarked articles
  List<NewsArticle> getBookmarkedArticles() {
    return _articles.where((a) => a.isBookmarked).toList();
  }

  /// Get unread articles
  List<NewsArticle> getUnreadArticles() {
    return _articles.where((a) => !a.isRead).toList();
  }

  /// Get featured projects by category
  List<FeaturedProject> getFeaturedProjectsByCategory(
    ProjectCategory category,
  ) {
    return _featuredProjects.where((p) => p.category == category).toList();
  }

  /// Get active featured projects
  List<FeaturedProject> getActiveFeaturedProjects() {
    return _featuredProjects.where((p) => p.isActive).toList();
  }

  /// Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Check if should refresh
  bool shouldRefresh() {
    if (_lastRefresh == null) return true;
    return DateTime.now().difference(_lastRefresh!).inMinutes > 30;
  }

  /// Auto refresh if needed
  Future<void> autoRefreshIfNeeded() async {
    if (shouldRefresh()) {
      await refreshNewsFeed();
    }
  }
}
