// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewsArticleCollection on Isar {
  IsarCollection<NewsArticle> get newsArticles => this.collection();
}

const NewsArticleSchema = CollectionSchema(
  name: r'NewsArticle',
  id: 3355707885259618870,
  properties: {
    r'articleId': PropertySchema(
      id: 0,
      name: r'articleId',
      type: IsarType.string,
    ),
    r'articleUrl': PropertySchema(
      id: 1,
      name: r'articleUrl',
      type: IsarType.string,
    ),
    r'author': PropertySchema(
      id: 2,
      name: r'author',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 3,
      name: r'category',
      type: IsarType.string,
      enumMap: _NewsArticlecategoryEnumValueMap,
    ),
    r'content': PropertySchema(
      id: 4,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'excerpt': PropertySchema(
      id: 6,
      name: r'excerpt',
      type: IsarType.string,
    ),
    r'fetchedAt': PropertySchema(
      id: 7,
      name: r'fetchedAt',
      type: IsarType.dateTime,
    ),
    r'imageUrl': PropertySchema(
      id: 8,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isBookmarked': PropertySchema(
      id: 9,
      name: r'isBookmarked',
      type: IsarType.bool,
    ),
    r'isRead': PropertySchema(
      id: 10,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'newsSource': PropertySchema(
      id: 11,
      name: r'newsSource',
      type: IsarType.string,
      enumMap: _NewsArticlenewsSourceEnumValueMap,
    ),
    r'publishedAt': PropertySchema(
      id: 12,
      name: r'publishedAt',
      type: IsarType.dateTime,
    ),
    r'source': PropertySchema(
      id: 13,
      name: r'source',
      type: IsarType.string,
    ),
    r'sourceUrl': PropertySchema(
      id: 14,
      name: r'sourceUrl',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 15,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'viewCount': PropertySchema(
      id: 17,
      name: r'viewCount',
      type: IsarType.long,
    )
  },
  estimateSize: _newsArticleEstimateSize,
  serialize: _newsArticleSerialize,
  deserialize: _newsArticleDeserialize,
  deserializeProp: _newsArticleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _newsArticleGetId,
  getLinks: _newsArticleGetLinks,
  attach: _newsArticleAttach,
  version: '3.1.0+1',
);

int _newsArticleEstimateSize(
  NewsArticle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.articleId.length * 3;
  bytesCount += 3 + object.articleUrl.length * 3;
  bytesCount += 3 + object.author.length * 3;
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.excerpt.length * 3;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.newsSource.name.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.sourceUrl.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _newsArticleSerialize(
  NewsArticle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.articleId);
  writer.writeString(offsets[1], object.articleUrl);
  writer.writeString(offsets[2], object.author);
  writer.writeString(offsets[3], object.category.name);
  writer.writeString(offsets[4], object.content);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeString(offsets[6], object.excerpt);
  writer.writeDateTime(offsets[7], object.fetchedAt);
  writer.writeString(offsets[8], object.imageUrl);
  writer.writeBool(offsets[9], object.isBookmarked);
  writer.writeBool(offsets[10], object.isRead);
  writer.writeString(offsets[11], object.newsSource.name);
  writer.writeDateTime(offsets[12], object.publishedAt);
  writer.writeString(offsets[13], object.source);
  writer.writeString(offsets[14], object.sourceUrl);
  writer.writeString(offsets[15], object.title);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeLong(offsets[17], object.viewCount);
}

NewsArticle _newsArticleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewsArticle();
  object.articleId = reader.readString(offsets[0]);
  object.articleUrl = reader.readString(offsets[1]);
  object.author = reader.readString(offsets[2]);
  object.category =
      _NewsArticlecategoryValueEnumMap[reader.readStringOrNull(offsets[3])] ??
          NewsCategory.ecosystem;
  object.content = reader.readString(offsets[4]);
  object.createdAt = reader.readDateTime(offsets[5]);
  object.excerpt = reader.readString(offsets[6]);
  object.fetchedAt = reader.readDateTime(offsets[7]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[8]);
  object.isBookmarked = reader.readBool(offsets[9]);
  object.isRead = reader.readBool(offsets[10]);
  object.newsSource = _NewsArticlenewsSourceValueEnumMap[
          reader.readStringOrNull(offsets[11])] ??
      NewsSource.polkadotBlog;
  object.publishedAt = reader.readDateTime(offsets[12]);
  object.source = reader.readString(offsets[13]);
  object.sourceUrl = reader.readString(offsets[14]);
  object.title = reader.readString(offsets[15]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[16]);
  object.viewCount = reader.readLong(offsets[17]);
  return object;
}

P _newsArticleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_NewsArticlecategoryValueEnumMap[
              reader.readStringOrNull(offset)] ??
          NewsCategory.ecosystem) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (_NewsArticlenewsSourceValueEnumMap[
              reader.readStringOrNull(offset)] ??
          NewsSource.polkadotBlog) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NewsArticlecategoryEnumValueMap = {
  r'ecosystem': r'ecosystem',
  r'technology': r'technology',
  r'governance': r'governance',
  r'partnerships': r'partnerships',
  r'updates': r'updates',
  r'events': r'events',
  r'tutorials': r'tutorials',
  r'other': r'other',
};
const _NewsArticlecategoryValueEnumMap = {
  r'ecosystem': NewsCategory.ecosystem,
  r'technology': NewsCategory.technology,
  r'governance': NewsCategory.governance,
  r'partnerships': NewsCategory.partnerships,
  r'updates': NewsCategory.updates,
  r'events': NewsCategory.events,
  r'tutorials': NewsCategory.tutorials,
  r'other': NewsCategory.other,
};
const _NewsArticlenewsSourceEnumValueMap = {
  r'polkadotBlog': r'polkadotBlog',
  r'subsocial': r'subsocial',
  r'medium': r'medium',
  r'twitter': r'twitter',
  r'github': r'github',
  r'other': r'other',
};
const _NewsArticlenewsSourceValueEnumMap = {
  r'polkadotBlog': NewsSource.polkadotBlog,
  r'subsocial': NewsSource.subsocial,
  r'medium': NewsSource.medium,
  r'twitter': NewsSource.twitter,
  r'github': NewsSource.github,
  r'other': NewsSource.other,
};

Id _newsArticleGetId(NewsArticle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newsArticleGetLinks(NewsArticle object) {
  return [];
}

void _newsArticleAttach(
    IsarCollection<dynamic> col, Id id, NewsArticle object) {
  object.id = id;
}

extension NewsArticleQueryWhereSort
    on QueryBuilder<NewsArticle, NewsArticle, QWhere> {
  QueryBuilder<NewsArticle, NewsArticle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NewsArticleQueryWhere
    on QueryBuilder<NewsArticle, NewsArticle, QWhereClause> {
  QueryBuilder<NewsArticle, NewsArticle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewsArticleQueryFilter
    on QueryBuilder<NewsArticle, NewsArticle, QFilterCondition> {
  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'articleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'articleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'articleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleId',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'articleId',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'articleUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'articleUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'articleUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      articleUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'articleUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      authorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> categoryEqualTo(
    NewsCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryGreaterThan(
    NewsCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryLessThan(
    NewsCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> categoryBetween(
    NewsCategory lower,
    NewsCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      excerptGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'excerpt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      excerptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'excerpt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> excerptMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'excerpt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      excerptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excerpt',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      excerptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'excerpt',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      fetchedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      fetchedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      fetchedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fetchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      fetchedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fetchedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      isBookmarkedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBookmarked',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> isReadEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceEqualTo(
    NewsSource value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceGreaterThan(
    NewsSource value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceLessThan(
    NewsSource value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceBetween(
    NewsSource lower,
    NewsSource upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newsSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'newsSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'newsSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newsSource',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      newsSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'newsSource',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      publishedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      publishedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      publishedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      publishedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      sourceUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      viewCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      viewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      viewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterFilterCondition>
      viewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewsArticleQueryObject
    on QueryBuilder<NewsArticle, NewsArticle, QFilterCondition> {}

extension NewsArticleQueryLinks
    on QueryBuilder<NewsArticle, NewsArticle, QFilterCondition> {}

extension NewsArticleQuerySortBy
    on QueryBuilder<NewsArticle, NewsArticle, QSortBy> {
  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByArticleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByArticleUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByArticleUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByExcerpt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excerpt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByExcerptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excerpt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy>
      sortByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByNewsSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSource', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByNewsSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSource', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> sortByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }
}

extension NewsArticleQuerySortThenBy
    on QueryBuilder<NewsArticle, NewsArticle, QSortThenBy> {
  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByArticleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByArticleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleId', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByArticleUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByArticleUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByExcerpt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excerpt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByExcerptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excerpt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy>
      thenByIsBookmarkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBookmarked', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByNewsSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSource', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByNewsSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newsSource', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByPublishedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenBySourceUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenBySourceUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceUrl', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QAfterSortBy> thenByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }
}

extension NewsArticleQueryWhereDistinct
    on QueryBuilder<NewsArticle, NewsArticle, QDistinct> {
  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByArticleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'articleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByArticleUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'articleUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByExcerpt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'excerpt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fetchedAt');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByIsBookmarked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBookmarked');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByNewsSource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newsSource', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByPublishedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishedAt');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctBySourceUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NewsArticle, NewsArticle, QDistinct> distinctByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewCount');
    });
  }
}

extension NewsArticleQueryProperty
    on QueryBuilder<NewsArticle, NewsArticle, QQueryProperty> {
  QueryBuilder<NewsArticle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> articleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'articleId');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> articleUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'articleUrl');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<NewsArticle, NewsCategory, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<NewsArticle, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> excerptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'excerpt');
    });
  }

  QueryBuilder<NewsArticle, DateTime, QQueryOperations> fetchedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fetchedAt');
    });
  }

  QueryBuilder<NewsArticle, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<NewsArticle, bool, QQueryOperations> isBookmarkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBookmarked');
    });
  }

  QueryBuilder<NewsArticle, bool, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<NewsArticle, NewsSource, QQueryOperations> newsSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newsSource');
    });
  }

  QueryBuilder<NewsArticle, DateTime, QQueryOperations> publishedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishedAt');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> sourceUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceUrl');
    });
  }

  QueryBuilder<NewsArticle, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<NewsArticle, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NewsArticle, int, QQueryOperations> viewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewCount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFeaturedProjectCollection on Isar {
  IsarCollection<FeaturedProject> get featuredProjects => this.collection();
}

const FeaturedProjectSchema = CollectionSchema(
  name: r'FeaturedProject',
  id: -9110186360022420825,
  properties: {
    r'bannerUrl': PropertySchema(
      id: 0,
      name: r'bannerUrl',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
      enumMap: _FeaturedProjectcategoryEnumValueMap,
    ),
    r'chain': PropertySchema(
      id: 2,
      name: r'chain',
      type: IsarType.string,
    ),
    r'clickCount': PropertySchema(
      id: 3,
      name: r'clickCount',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'discordUrl': PropertySchema(
      id: 6,
      name: r'discordUrl',
      type: IsarType.string,
    ),
    r'featuredAt': PropertySchema(
      id: 7,
      name: r'featuredAt',
      type: IsarType.dateTime,
    ),
    r'githubUrl': PropertySchema(
      id: 8,
      name: r'githubUrl',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'logoUrl': PropertySchema(
      id: 10,
      name: r'logoUrl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 11,
      name: r'name',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 12,
      name: r'priority',
      type: IsarType.long,
    ),
    r'projectId': PropertySchema(
      id: 13,
      name: r'projectId',
      type: IsarType.string,
    ),
    r'shortDescription': PropertySchema(
      id: 14,
      name: r'shortDescription',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.string,
      enumMap: _FeaturedProjectstatusEnumValueMap,
    ),
    r'tags': PropertySchema(
      id: 16,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'telegramUrl': PropertySchema(
      id: 17,
      name: r'telegramUrl',
      type: IsarType.string,
    ),
    r'twitterUrl': PropertySchema(
      id: 18,
      name: r'twitterUrl',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'viewCount': PropertySchema(
      id: 20,
      name: r'viewCount',
      type: IsarType.long,
    ),
    r'websiteUrl': PropertySchema(
      id: 21,
      name: r'websiteUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _featuredProjectEstimateSize,
  serialize: _featuredProjectSerialize,
  deserialize: _featuredProjectDeserialize,
  deserializeProp: _featuredProjectDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _featuredProjectGetId,
  getLinks: _featuredProjectGetLinks,
  attach: _featuredProjectAttach,
  version: '3.1.0+1',
);

int _featuredProjectEstimateSize(
  FeaturedProject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bannerUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.discordUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.githubUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.projectId.length * 3;
  bytesCount += 3 + object.shortDescription.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.telegramUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.twitterUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.websiteUrl.length * 3;
  return bytesCount;
}

void _featuredProjectSerialize(
  FeaturedProject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bannerUrl);
  writer.writeString(offsets[1], object.category.name);
  writer.writeString(offsets[2], object.chain);
  writer.writeLong(offsets[3], object.clickCount);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeString(offsets[6], object.discordUrl);
  writer.writeDateTime(offsets[7], object.featuredAt);
  writer.writeString(offsets[8], object.githubUrl);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeString(offsets[10], object.logoUrl);
  writer.writeString(offsets[11], object.name);
  writer.writeLong(offsets[12], object.priority);
  writer.writeString(offsets[13], object.projectId);
  writer.writeString(offsets[14], object.shortDescription);
  writer.writeString(offsets[15], object.status.name);
  writer.writeStringList(offsets[16], object.tags);
  writer.writeString(offsets[17], object.telegramUrl);
  writer.writeString(offsets[18], object.twitterUrl);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeLong(offsets[20], object.viewCount);
  writer.writeString(offsets[21], object.websiteUrl);
}

FeaturedProject _featuredProjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeaturedProject();
  object.bannerUrl = reader.readStringOrNull(offsets[0]);
  object.category = _FeaturedProjectcategoryValueEnumMap[
          reader.readStringOrNull(offsets[1])] ??
      ProjectCategory.defi;
  object.chain = reader.readString(offsets[2]);
  object.clickCount = reader.readLong(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readString(offsets[5]);
  object.discordUrl = reader.readStringOrNull(offsets[6]);
  object.featuredAt = reader.readDateTime(offsets[7]);
  object.githubUrl = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.isActive = reader.readBool(offsets[9]);
  object.logoUrl = reader.readStringOrNull(offsets[10]);
  object.name = reader.readString(offsets[11]);
  object.priority = reader.readLong(offsets[12]);
  object.projectId = reader.readString(offsets[13]);
  object.shortDescription = reader.readString(offsets[14]);
  object.status = _FeaturedProjectstatusValueEnumMap[
          reader.readStringOrNull(offsets[15])] ??
      ProjectStatus.active;
  object.tags = reader.readStringList(offsets[16]) ?? [];
  object.telegramUrl = reader.readStringOrNull(offsets[17]);
  object.twitterUrl = reader.readStringOrNull(offsets[18]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[19]);
  object.viewCount = reader.readLong(offsets[20]);
  object.websiteUrl = reader.readString(offsets[21]);
  return object;
}

P _featuredProjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_FeaturedProjectcategoryValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ProjectCategory.defi) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (_FeaturedProjectstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ProjectStatus.active) as P;
    case 16:
      return (reader.readStringList(offset) ?? []) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FeaturedProjectcategoryEnumValueMap = {
  r'defi': r'defi',
  r'nft': r'nft',
  r'gaming': r'gaming',
  r'infrastructure': r'infrastructure',
  r'tools': r'tools',
  r'social': r'social',
  r'governance': r'governance',
  r'other': r'other',
};
const _FeaturedProjectcategoryValueEnumMap = {
  r'defi': ProjectCategory.defi,
  r'nft': ProjectCategory.nft,
  r'gaming': ProjectCategory.gaming,
  r'infrastructure': ProjectCategory.infrastructure,
  r'tools': ProjectCategory.tools,
  r'social': ProjectCategory.social,
  r'governance': ProjectCategory.governance,
  r'other': ProjectCategory.other,
};
const _FeaturedProjectstatusEnumValueMap = {
  r'active': r'active',
  r'beta': r'beta',
  r'development': r'development',
  r'launched': r'launched',
  r'paused': r'paused',
  r'discontinued': r'discontinued',
};
const _FeaturedProjectstatusValueEnumMap = {
  r'active': ProjectStatus.active,
  r'beta': ProjectStatus.beta,
  r'development': ProjectStatus.development,
  r'launched': ProjectStatus.launched,
  r'paused': ProjectStatus.paused,
  r'discontinued': ProjectStatus.discontinued,
};

Id _featuredProjectGetId(FeaturedProject object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _featuredProjectGetLinks(FeaturedProject object) {
  return [];
}

void _featuredProjectAttach(
    IsarCollection<dynamic> col, Id id, FeaturedProject object) {
  object.id = id;
}

extension FeaturedProjectQueryWhereSort
    on QueryBuilder<FeaturedProject, FeaturedProject, QWhere> {
  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FeaturedProjectQueryWhere
    on QueryBuilder<FeaturedProject, FeaturedProject, QWhereClause> {
  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeaturedProjectQueryFilter
    on QueryBuilder<FeaturedProject, FeaturedProject, QFilterCondition> {
  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bannerUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bannerUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bannerUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bannerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bannerUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bannerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      bannerUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bannerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryEqualTo(
    ProjectCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryGreaterThan(
    ProjectCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryLessThan(
    ProjectCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryBetween(
    ProjectCategory lower,
    ProjectCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      clickCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clickCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      clickCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clickCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      clickCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clickCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      clickCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clickCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discordUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discordUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discordUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discordUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discordUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discordUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      discordUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discordUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      featuredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'featuredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      featuredAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'featuredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      featuredAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'featuredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      featuredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'featuredAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'githubUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'githubUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'githubUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'githubUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'githubUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'githubUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      githubUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'githubUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      logoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      priorityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      projectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectId',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      shortDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusEqualTo(
    ProjectStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusGreaterThan(
    ProjectStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusLessThan(
    ProjectStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusBetween(
    ProjectStatus lower,
    ProjectStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'telegramUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'telegramUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telegramUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telegramUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telegramUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telegramUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      telegramUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telegramUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'twitterUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'twitterUrl',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'twitterUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'twitterUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'twitterUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twitterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      twitterUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'twitterUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      viewCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      viewCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      viewCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'viewCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      viewCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'viewCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'websiteUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'websiteUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'websiteUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'websiteUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterFilterCondition>
      websiteUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'websiteUrl',
        value: '',
      ));
    });
  }
}

extension FeaturedProjectQueryObject
    on QueryBuilder<FeaturedProject, FeaturedProject, QFilterCondition> {}

extension FeaturedProjectQueryLinks
    on QueryBuilder<FeaturedProject, FeaturedProject, QFilterCondition> {}

extension FeaturedProjectQuerySortBy
    on QueryBuilder<FeaturedProject, FeaturedProject, QSortBy> {
  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByBannerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByBannerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByClickCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickCount', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByClickCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickCount', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByDiscordUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discordUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByDiscordUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discordUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByFeaturedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featuredAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByFeaturedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featuredAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByGithubUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'githubUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByGithubUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'githubUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> sortByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByShortDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByShortDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByTelegramUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telegramUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByTelegramUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telegramUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByTwitterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByTwitterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByWebsiteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'websiteUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      sortByWebsiteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'websiteUrl', Sort.desc);
    });
  }
}

extension FeaturedProjectQuerySortThenBy
    on QueryBuilder<FeaturedProject, FeaturedProject, QSortThenBy> {
  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByBannerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByBannerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByClickCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickCount', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByClickCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clickCount', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByDiscordUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discordUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByDiscordUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discordUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByFeaturedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featuredAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByFeaturedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'featuredAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByGithubUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'githubUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByGithubUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'githubUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByShortDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByShortDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortDescription', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByTelegramUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telegramUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByTelegramUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'telegramUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByTwitterUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByTwitterUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twitterUrl', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByViewCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewCount', Sort.desc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByWebsiteUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'websiteUrl', Sort.asc);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QAfterSortBy>
      thenByWebsiteUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'websiteUrl', Sort.desc);
    });
  }
}

extension FeaturedProjectQueryWhereDistinct
    on QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> {
  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByBannerUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bannerUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByClickCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clickCount');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByDiscordUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discordUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByFeaturedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'featuredAt');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByGithubUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'githubUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByLogoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByProjectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByShortDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByTelegramUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telegramUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByTwitterUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twitterUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByViewCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewCount');
    });
  }

  QueryBuilder<FeaturedProject, FeaturedProject, QDistinct>
      distinctByWebsiteUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'websiteUrl', caseSensitive: caseSensitive);
    });
  }
}

extension FeaturedProjectQueryProperty
    on QueryBuilder<FeaturedProject, FeaturedProject, QQueryProperty> {
  QueryBuilder<FeaturedProject, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations> bannerUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bannerUrl');
    });
  }

  QueryBuilder<FeaturedProject, ProjectCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<FeaturedProject, int, QQueryOperations> clickCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clickCount');
    });
  }

  QueryBuilder<FeaturedProject, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations>
      discordUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discordUrl');
    });
  }

  QueryBuilder<FeaturedProject, DateTime, QQueryOperations>
      featuredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'featuredAt');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations> githubUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'githubUrl');
    });
  }

  QueryBuilder<FeaturedProject, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations> logoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoUrl');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FeaturedProject, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations> projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations>
      shortDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortDescription');
    });
  }

  QueryBuilder<FeaturedProject, ProjectStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<FeaturedProject, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations>
      telegramUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telegramUrl');
    });
  }

  QueryBuilder<FeaturedProject, String?, QQueryOperations>
      twitterUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twitterUrl');
    });
  }

  QueryBuilder<FeaturedProject, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<FeaturedProject, int, QQueryOperations> viewCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewCount');
    });
  }

  QueryBuilder<FeaturedProject, String, QQueryOperations> websiteUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'websiteUrl');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle()
  ..id = (json['id'] as num).toInt()
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
      'id': instance.id,
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
      ..id = (json['id'] as num).toInt()
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
      'id': instance.id,
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
