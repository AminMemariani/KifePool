import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_models.g.dart';

/// News article model
@collection
@JsonSerializable()
class NewsArticle {
  Id id = Isar.autoIncrement;
  late String articleId;
  late String title;
  late String excerpt;
  late String content;
  late String author;
  late String source;
  late String sourceUrl;
  late String articleUrl;
  String? imageUrl;
  late DateTime publishedAt;
  late DateTime fetchedAt;
  late DateTime createdAt;
  late DateTime? updatedAt;
  @Enumerated(EnumType.name)
  late NewsCategory category;
  @Enumerated(EnumType.name)
  late NewsSource newsSource;
  late bool isRead;
  late bool isBookmarked;
  late int viewCount;

  NewsArticle();

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);
}

/// Featured project model
@collection
@JsonSerializable()
class FeaturedProject {
  Id id = Isar.autoIncrement;
  late String projectId;
  late String name;
  late String description;
  late String shortDescription;
  String? logoUrl;
  String? bannerUrl;
  late String websiteUrl;
  String? twitterUrl;
  String? discordUrl;
  String? telegramUrl;
  String? githubUrl;
  late List<String> tags;
  @Enumerated(EnumType.name)
  late ProjectCategory category;
  @Enumerated(EnumType.name)
  late ProjectStatus status;
  late String chain;
  late DateTime featuredAt;
  late DateTime createdAt;
  late DateTime? updatedAt;
  late bool isActive;
  late int priority;
  late int viewCount;
  late int clickCount;

  FeaturedProject();

  factory FeaturedProject.fromJson(Map<String, dynamic> json) =>
      _$FeaturedProjectFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedProjectToJson(this);
}

/// News source enumeration
enum NewsSource {
  @JsonValue('polkadot_blog')
  polkadotBlog,
  @JsonValue('subsocial')
  subsocial,
  @JsonValue('medium')
  medium,
  @JsonValue('twitter')
  twitter,
  @JsonValue('github')
  github,
  @JsonValue('other')
  other,
}

/// News category enumeration
enum NewsCategory {
  @JsonValue('ecosystem')
  ecosystem,
  @JsonValue('technology')
  technology,
  @JsonValue('governance')
  governance,
  @JsonValue('partnerships')
  partnerships,
  @JsonValue('updates')
  updates,
  @JsonValue('events')
  events,
  @JsonValue('tutorials')
  tutorials,
  @JsonValue('other')
  other,
}

/// Project category enumeration
enum ProjectCategory {
  @JsonValue('defi')
  defi,
  @JsonValue('nft')
  nft,
  @JsonValue('gaming')
  gaming,
  @JsonValue('infrastructure')
  infrastructure,
  @JsonValue('tools')
  tools,
  @JsonValue('social')
  social,
  @JsonValue('governance')
  governance,
  @JsonValue('other')
  other,
}

/// Project status enumeration
enum ProjectStatus {
  @JsonValue('active')
  active,
  @JsonValue('beta')
  beta,
  @JsonValue('development')
  development,
  @JsonValue('launched')
  launched,
  @JsonValue('paused')
  paused,
  @JsonValue('discontinued')
  discontinued,
}

/// News feed result
@JsonSerializable()
class NewsFeedResult {
  final List<NewsArticle> articles;
  final List<FeaturedProject> featuredProjects;
  final DateTime lastUpdated;
  final bool hasMore;
  final int totalCount;

  const NewsFeedResult({
    required this.articles,
    required this.featuredProjects,
    required this.lastUpdated,
    required this.hasMore,
    required this.totalCount,
  });

  factory NewsFeedResult.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedResultFromJson(json);
  Map<String, dynamic> toJson() => _$NewsFeedResultToJson(this);
}

/// News filter options
@JsonSerializable()
class NewsFilter {
  final NewsSource? source;
  final NewsCategory? category;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? searchQuery;
  final bool? bookmarkedOnly;
  final bool? unreadOnly;
  final int limit;
  final int offset;

  const NewsFilter({
    this.source,
    this.category,
    this.fromDate,
    this.toDate,
    this.searchQuery,
    this.bookmarkedOnly,
    this.unreadOnly,
    this.limit = 20,
    this.offset = 0,
  });

  NewsFilter copyWith({
    NewsSource? source,
    NewsCategory? category,
    DateTime? fromDate,
    DateTime? toDate,
    String? searchQuery,
    bool? bookmarkedOnly,
    bool? unreadOnly,
    int? limit,
    int? offset,
  }) {
    return NewsFilter(
      source: source ?? this.source,
      category: category ?? this.category,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      searchQuery: searchQuery ?? this.searchQuery,
      bookmarkedOnly: bookmarkedOnly ?? this.bookmarkedOnly,
      unreadOnly: unreadOnly ?? this.unreadOnly,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }

  factory NewsFilter.fromJson(Map<String, dynamic> json) =>
      _$NewsFilterFromJson(json);
  Map<String, dynamic> toJson() => _$NewsFilterToJson(this);
}

/// News statistics
@JsonSerializable()
class NewsStats {
  final int totalArticles;
  final int unreadArticles;
  final int bookmarkedArticles;
  final Map<NewsSource, int> articlesBySource;
  final Map<NewsCategory, int> articlesByCategory;
  final DateTime lastRefresh;
  final int featuredProjectsCount;

  const NewsStats({
    required this.totalArticles,
    required this.unreadArticles,
    required this.bookmarkedArticles,
    required this.articlesBySource,
    required this.articlesByCategory,
    required this.lastRefresh,
    required this.featuredProjectsCount,
  });

  factory NewsStats.fromJson(Map<String, dynamic> json) =>
      _$NewsStatsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsStatsToJson(this);
}
