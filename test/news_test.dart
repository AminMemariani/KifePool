import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/core/models/news_models.dart';

void main() {
  group('News Tests', () {
    test('NewsArticle model works correctly', () {
      final article = NewsArticle()
        ..articleId = 'test_article_1'
        ..title = 'Test Article'
        ..excerpt = 'This is a test article excerpt'
        ..content = 'This is the full content of the test article'
        ..author = 'Test Author'
        ..source = 'Test Source'
        ..sourceUrl = 'https://test.com'
        ..articleUrl = 'https://test.com/article/1'
        ..imageUrl = 'https://test.com/image.jpg'
        ..publishedAt = DateTime.now()
        ..fetchedAt = DateTime.now()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..category = NewsCategory.technology
        ..newsSource = NewsSource.polkadotBlog
        ..isRead = false
        ..isBookmarked = false
        ..viewCount = 0;

      expect(article.articleId, 'test_article_1');
      expect(article.title, 'Test Article');
      expect(article.category, NewsCategory.technology);
      expect(article.newsSource, NewsSource.polkadotBlog);
      expect(article.isRead, false);
      expect(article.isBookmarked, false);
    });

    test('FeaturedProject model works correctly', () {
      final project = FeaturedProject()
        ..projectId = 'test_project_1'
        ..name = 'Test Project'
        ..description = 'This is a test project description'
        ..shortDescription = 'Short description'
        ..logoUrl = 'https://test.com/logo.png'
        ..websiteUrl = 'https://testproject.com'
        ..tags = ['DeFi', 'Polkadot']
        ..category = ProjectCategory.defi
        ..status = ProjectStatus.active
        ..chain = 'Polkadot'
        ..featuredAt = DateTime.now()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..isActive = true
        ..priority = 1
        ..viewCount = 0
        ..clickCount = 0;

      expect(project.projectId, 'test_project_1');
      expect(project.name, 'Test Project');
      expect(project.category, ProjectCategory.defi);
      expect(project.status, ProjectStatus.active);
      expect(project.isActive, true);
      expect(project.tags, contains('DeFi'));
    });

    test('NewsFilter model works correctly', () {
      final filter = NewsFilter(
        source: NewsSource.polkadotBlog,
        category: NewsCategory.technology,
        bookmarkedOnly: true,
        limit: 10,
        offset: 0,
      );

      expect(filter.source, NewsSource.polkadotBlog);
      expect(filter.category, NewsCategory.technology);
      expect(filter.bookmarkedOnly, true);
      expect(filter.limit, 10);
      expect(filter.offset, 0);

      final updatedFilter = filter.copyWith(
        source: NewsSource.subsocial,
        limit: 20,
      );

      expect(updatedFilter.source, NewsSource.subsocial);
      expect(updatedFilter.category, NewsCategory.technology);
      expect(updatedFilter.limit, 20);
      expect(updatedFilter.offset, 0);
    });

    test('NewsStats model works correctly', () {
      final stats = NewsStats(
        totalArticles: 100,
        unreadArticles: 25,
        bookmarkedArticles: 10,
        articlesBySource: {
          NewsSource.polkadotBlog: 50,
          NewsSource.subsocial: 30,
          NewsSource.medium: 20,
        },
        articlesByCategory: {
          NewsCategory.technology: 40,
          NewsCategory.ecosystem: 35,
          NewsCategory.governance: 25,
        },
        lastRefresh: DateTime.now(),
        featuredProjectsCount: 5,
      );

      expect(stats.totalArticles, 100);
      expect(stats.unreadArticles, 25);
      expect(stats.bookmarkedArticles, 10);
      expect(stats.articlesBySource[NewsSource.polkadotBlog], 50);
      expect(stats.articlesByCategory[NewsCategory.technology], 40);
      expect(stats.featuredProjectsCount, 5);
    });

    test('NewsFeedResult model works correctly', () {
      final articles = <NewsArticle>[];
      final projects = <FeaturedProject>[];

      final result = NewsFeedResult(
        articles: articles,
        featuredProjects: projects,
        lastUpdated: DateTime.now(),
        hasMore: false,
        totalCount: 0,
      );

      expect(result.articles, isEmpty);
      expect(result.featuredProjects, isEmpty);
      expect(result.hasMore, false);
      expect(result.totalCount, 0);
    });
  });
}
