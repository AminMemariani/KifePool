// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle()
  ..articleId = json['articleId'] as String
  ..title = json['title'] as String
  ..excerpt = json['excerpt'] as String
  ..content = json['content'] as String
  ..author = json['author'] as String
  ..source = json['source'] as String
  ..sourceUrl = json['sourceUrl'] as String
  ..articleUrl = json['articleUrl'] as String
  ..imageUrl = json['imageUrl'] as String?
  ..publishedAt = DateTime.parse(json['publishedAt'] as String)
  ..fetchedAt = DateTime.parse(json['fetchedAt'] as String)
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..category = $enumDecode(_$NewsCategoryEnumMap, json['category'])
  ..newsSource = $enumDecode(_$NewsSourceEnumMap, json['newsSource'])
  ..isRead = json['isRead'] as bool
  ..isBookmarked = json['isBookmarked'] as bool
  ..viewCount = (json['viewCount'] as num).toInt();

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) =>
    <String, dynamic>{
      'articleId': instance.articleId,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'author': instance.author,
      'source': instance.source,
      'sourceUrl': instance.sourceUrl,
      'articleUrl': instance.articleUrl,
      'imageUrl': instance.imageUrl,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'fetchedAt': instance.fetchedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'category': _$NewsCategoryEnumMap[instance.category]!,
      'newsSource': _$NewsSourceEnumMap[instance.newsSource]!,
      'isRead': instance.isRead,
      'isBookmarked': instance.isBookmarked,
      'viewCount': instance.viewCount,
    };

const _$NewsCategoryEnumMap = {
  NewsCategory.ecosystem: 'ecosystem',
  NewsCategory.technology: 'technology',
  NewsCategory.governance: 'governance',
  NewsCategory.partnerships: 'partnerships',
  NewsCategory.updates: 'updates',
  NewsCategory.events: 'events',
  NewsCategory.tutorials: 'tutorials',
  NewsCategory.other: 'other',
};

const _$NewsSourceEnumMap = {
  NewsSource.polkadotBlog: 'polkadot_blog',
  NewsSource.subsocial: 'subsocial',
  NewsSource.medium: 'medium',
  NewsSource.twitter: 'twitter',
  NewsSource.github: 'github',
  NewsSource.other: 'other',
};

FeaturedProject _$FeaturedProjectFromJson(Map<String, dynamic> json) =>
    FeaturedProject()
      ..projectId = json['projectId'] as String
      ..name = json['name'] as String
      ..description = json['description'] as String
      ..shortDescription = json['shortDescription'] as String
      ..logoUrl = json['logoUrl'] as String?
      ..bannerUrl = json['bannerUrl'] as String?
      ..websiteUrl = json['websiteUrl'] as String
      ..twitterUrl = json['twitterUrl'] as String?
      ..discordUrl = json['discordUrl'] as String?
      ..telegramUrl = json['telegramUrl'] as String?
      ..githubUrl = json['githubUrl'] as String?
      ..tags = (json['tags'] as List<dynamic>).map((e) => e as String).toList()
      ..category = $enumDecode(_$ProjectCategoryEnumMap, json['category'])
      ..status = $enumDecode(_$ProjectStatusEnumMap, json['status'])
      ..chain = json['chain'] as String
      ..featuredAt = DateTime.parse(json['featuredAt'] as String)
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..isActive = json['isActive'] as bool
      ..priority = (json['priority'] as num).toInt()
      ..viewCount = (json['viewCount'] as num).toInt()
      ..clickCount = (json['clickCount'] as num).toInt();

Map<String, dynamic> _$FeaturedProjectToJson(FeaturedProject instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'logoUrl': instance.logoUrl,
      'bannerUrl': instance.bannerUrl,
      'websiteUrl': instance.websiteUrl,
      'twitterUrl': instance.twitterUrl,
      'discordUrl': instance.discordUrl,
      'telegramUrl': instance.telegramUrl,
      'githubUrl': instance.githubUrl,
      'tags': instance.tags,
      'category': _$ProjectCategoryEnumMap[instance.category]!,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'chain': instance.chain,
      'featuredAt': instance.featuredAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isActive': instance.isActive,
      'priority': instance.priority,
      'viewCount': instance.viewCount,
      'clickCount': instance.clickCount,
    };

const _$ProjectCategoryEnumMap = {
  ProjectCategory.defi: 'defi',
  ProjectCategory.nft: 'nft',
  ProjectCategory.gaming: 'gaming',
  ProjectCategory.infrastructure: 'infrastructure',
  ProjectCategory.tools: 'tools',
  ProjectCategory.social: 'social',
  ProjectCategory.governance: 'governance',
  ProjectCategory.other: 'other',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'active',
  ProjectStatus.beta: 'beta',
  ProjectStatus.development: 'development',
  ProjectStatus.launched: 'launched',
  ProjectStatus.paused: 'paused',
  ProjectStatus.discontinued: 'discontinued',
};

NewsFeedResult _$NewsFeedResultFromJson(Map<String, dynamic> json) =>
    NewsFeedResult(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticle.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredProjects: (json['featuredProjects'] as List<dynamic>)
          .map((e) => FeaturedProject.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      hasMore: json['hasMore'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$NewsFeedResultToJson(NewsFeedResult instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'featuredProjects': instance.featuredProjects,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'hasMore': instance.hasMore,
      'totalCount': instance.totalCount,
    };

NewsFilter _$NewsFilterFromJson(Map<String, dynamic> json) => NewsFilter(
      source: $enumDecodeNullable(_$NewsSourceEnumMap, json['source']),
      category: $enumDecodeNullable(_$NewsCategoryEnumMap, json['category']),
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      searchQuery: json['searchQuery'] as String?,
      bookmarkedOnly: json['bookmarkedOnly'] as bool?,
      unreadOnly: json['unreadOnly'] as bool?,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NewsFilterToJson(NewsFilter instance) =>
    <String, dynamic>{
      'source': _$NewsSourceEnumMap[instance.source],
      'category': _$NewsCategoryEnumMap[instance.category],
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'searchQuery': instance.searchQuery,
      'bookmarkedOnly': instance.bookmarkedOnly,
      'unreadOnly': instance.unreadOnly,
      'limit': instance.limit,
      'offset': instance.offset,
    };

NewsStats _$NewsStatsFromJson(Map<String, dynamic> json) => NewsStats(
      totalArticles: (json['totalArticles'] as num).toInt(),
      unreadArticles: (json['unreadArticles'] as num).toInt(),
      bookmarkedArticles: (json['bookmarkedArticles'] as num).toInt(),
      articlesBySource: (json['articlesBySource'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$NewsSourceEnumMap, k), (e as num).toInt()),
      ),
      articlesByCategory:
          (json['articlesByCategory'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$NewsCategoryEnumMap, k), (e as num).toInt()),
      ),
      lastRefresh: DateTime.parse(json['lastRefresh'] as String),
      featuredProjectsCount: (json['featuredProjectsCount'] as num).toInt(),
    );

Map<String, dynamic> _$NewsStatsToJson(NewsStats instance) => <String, dynamic>{
      'totalArticles': instance.totalArticles,
      'unreadArticles': instance.unreadArticles,
      'bookmarkedArticles': instance.bookmarkedArticles,
      'articlesBySource': instance.articlesBySource
          .map((k, e) => MapEntry(_$NewsSourceEnumMap[k]!, e)),
      'articlesByCategory': instance.articlesByCategory
          .map((k, e) => MapEntry(_$NewsCategoryEnumMap[k]!, e)),
      'lastRefresh': instance.lastRefresh.toIso8601String(),
      'featuredProjectsCount': instance.featuredProjectsCount,
    };
