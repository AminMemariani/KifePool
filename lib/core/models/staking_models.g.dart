// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetValidatorCollection on Isar {
  IsarCollection<Validator> get validators => this.collection();
}

const ValidatorSchema = CollectionSchema(
  name: r'Validator',
  id: 2061360009877439456,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'apy': PropertySchema(
      id: 1,
      name: r'apy',
      type: IsarType.double,
    ),
    r'chain': PropertySchema(
      id: 2,
      name: r'chain',
      type: IsarType.string,
    ),
    r'commission': PropertySchema(
      id: 3,
      name: r'commission',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'identity': PropertySchema(
      id: 5,
      name: r'identity',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isOversubscribed': PropertySchema(
      id: 7,
      name: r'isOversubscribed',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 8,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'nominatorCount': PropertySchema(
      id: 10,
      name: r'nominatorCount',
      type: IsarType.long,
    ),
    r'totalStake': PropertySchema(
      id: 11,
      name: r'totalStake',
      type: IsarType.long,
    ),
    r'website': PropertySchema(
      id: 12,
      name: r'website',
      type: IsarType.string,
    )
  },
  estimateSize: _validatorEstimateSize,
  serialize: _validatorSerialize,
  deserialize: _validatorDeserialize,
  deserializeProp: _validatorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _validatorGetId,
  getLinks: _validatorGetLinks,
  attach: _validatorAttach,
  version: '3.1.0+1',
);

int _validatorEstimateSize(
  Validator object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.identity.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.website.length * 3;
  return bytesCount;
}

void _validatorSerialize(
  Validator object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeDouble(offsets[1], object.apy);
  writer.writeString(offsets[2], object.chain);
  writer.writeDouble(offsets[3], object.commission);
  writer.writeString(offsets[4], object.description);
  writer.writeString(offsets[5], object.identity);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeBool(offsets[7], object.isOversubscribed);
  writer.writeDateTime(offsets[8], object.lastUpdated);
  writer.writeString(offsets[9], object.name);
  writer.writeLong(offsets[10], object.nominatorCount);
  writer.writeLong(offsets[11], object.totalStake);
  writer.writeString(offsets[12], object.website);
}

Validator _validatorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Validator();
  object.address = reader.readString(offsets[0]);
  object.apy = reader.readDouble(offsets[1]);
  object.chain = reader.readString(offsets[2]);
  object.commission = reader.readDouble(offsets[3]);
  object.description = reader.readString(offsets[4]);
  object.id = id;
  object.identity = reader.readString(offsets[5]);
  object.isActive = reader.readBool(offsets[6]);
  object.isOversubscribed = reader.readBool(offsets[7]);
  object.lastUpdated = reader.readDateTime(offsets[8]);
  object.name = reader.readString(offsets[9]);
  object.nominatorCount = reader.readLong(offsets[10]);
  object.totalStake = reader.readLong(offsets[11]);
  object.website = reader.readString(offsets[12]);
  return object;
}

P _validatorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _validatorGetId(Validator object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _validatorGetLinks(Validator object) {
  return [];
}

void _validatorAttach(IsarCollection<dynamic> col, Id id, Validator object) {
  object.id = id;
}

extension ValidatorQueryWhereSort
    on QueryBuilder<Validator, Validator, QWhere> {
  QueryBuilder<Validator, Validator, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ValidatorQueryWhere
    on QueryBuilder<Validator, Validator, QWhereClause> {
  QueryBuilder<Validator, Validator, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Validator, Validator, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Validator, Validator, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Validator, Validator, QAfterWhereClause> idBetween(
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

extension ValidatorQueryFilter
    on QueryBuilder<Validator, Validator, QFilterCondition> {
  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> apyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> apyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> apyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> apyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainEqualTo(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainGreaterThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainLessThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainBetween(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainStartsWith(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainEndsWith(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> commissionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      commissionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> commissionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commission',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> commissionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commission',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> identityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identity',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      identityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identity',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      isOversubscribedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOversubscribed',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> lastUpdatedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      nominatorCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nominatorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      nominatorCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nominatorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      nominatorCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nominatorCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      nominatorCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nominatorCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> totalStakeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      totalStakeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> totalStakeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> totalStakeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalStake',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'website',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'website',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'website',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition> websiteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'website',
        value: '',
      ));
    });
  }

  QueryBuilder<Validator, Validator, QAfterFilterCondition>
      websiteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'website',
        value: '',
      ));
    });
  }
}

extension ValidatorQueryObject
    on QueryBuilder<Validator, Validator, QFilterCondition> {}

extension ValidatorQueryLinks
    on QueryBuilder<Validator, Validator, QFilterCondition> {}

extension ValidatorQuerySortBy on QueryBuilder<Validator, Validator, QSortBy> {
  QueryBuilder<Validator, Validator, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByIdentity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identity', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByIdentityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identity', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByIsOversubscribed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOversubscribed', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy>
      sortByIsOversubscribedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOversubscribed', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByNominatorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatorCount', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByNominatorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatorCount', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByTotalStakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByWebsite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> sortByWebsiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.desc);
    });
  }
}

extension ValidatorQuerySortThenBy
    on QueryBuilder<Validator, Validator, QSortThenBy> {
  QueryBuilder<Validator, Validator, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByCommissionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commission', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIdentity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identity', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIdentityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identity', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByIsOversubscribed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOversubscribed', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy>
      thenByIsOversubscribedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOversubscribed', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByNominatorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatorCount', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByNominatorCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatorCount', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByTotalStakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.desc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByWebsite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.asc);
    });
  }

  QueryBuilder<Validator, Validator, QAfterSortBy> thenByWebsiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.desc);
    });
  }
}

extension ValidatorQueryWhereDistinct
    on QueryBuilder<Validator, Validator, QDistinct> {
  QueryBuilder<Validator, Validator, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apy');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByCommission() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commission');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByIdentity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByIsOversubscribed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOversubscribed');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByNominatorCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nominatorCount');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStake');
    });
  }

  QueryBuilder<Validator, Validator, QDistinct> distinctByWebsite(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'website', caseSensitive: caseSensitive);
    });
  }
}

extension ValidatorQueryProperty
    on QueryBuilder<Validator, Validator, QQueryProperty> {
  QueryBuilder<Validator, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Validator, double, QQueryOperations> apyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apy');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<Validator, double, QQueryOperations> commissionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commission');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> identityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identity');
    });
  }

  QueryBuilder<Validator, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Validator, bool, QQueryOperations> isOversubscribedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOversubscribed');
    });
  }

  QueryBuilder<Validator, DateTime, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Validator, int, QQueryOperations> nominatorCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nominatorCount');
    });
  }

  QueryBuilder<Validator, int, QQueryOperations> totalStakeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStake');
    });
  }

  QueryBuilder<Validator, String, QQueryOperations> websiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'website');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNominationPoolCollection on Isar {
  IsarCollection<NominationPool> get nominationPools => this.collection();
}

const NominationPoolSchema = CollectionSchema(
  name: r'NominationPool',
  id: -5934506055246915070,
  properties: {
    r'apy': PropertySchema(
      id: 0,
      name: r'apy',
      type: IsarType.double,
    ),
    r'chain': PropertySchema(
      id: 1,
      name: r'chain',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 4,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'memberCount': PropertySchema(
      id: 5,
      name: r'memberCount',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'poolAccount': PropertySchema(
      id: 7,
      name: r'poolAccount',
      type: IsarType.string,
    ),
    r'poolId': PropertySchema(
      id: 8,
      name: r'poolId',
      type: IsarType.long,
    ),
    r'state': PropertySchema(
      id: 9,
      name: r'state',
      type: IsarType.string,
    ),
    r'totalStake': PropertySchema(
      id: 10,
      name: r'totalStake',
      type: IsarType.long,
    )
  },
  estimateSize: _nominationPoolEstimateSize,
  serialize: _nominationPoolSerialize,
  deserialize: _nominationPoolDeserialize,
  deserializeProp: _nominationPoolDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _nominationPoolGetId,
  getLinks: _nominationPoolGetLinks,
  attach: _nominationPoolAttach,
  version: '3.1.0+1',
);

int _nominationPoolEstimateSize(
  NominationPool object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.poolAccount.length * 3;
  bytesCount += 3 + object.state.length * 3;
  return bytesCount;
}

void _nominationPoolSerialize(
  NominationPool object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.apy);
  writer.writeString(offsets[1], object.chain);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeDateTime(offsets[4], object.lastUpdated);
  writer.writeLong(offsets[5], object.memberCount);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.poolAccount);
  writer.writeLong(offsets[8], object.poolId);
  writer.writeString(offsets[9], object.state);
  writer.writeLong(offsets[10], object.totalStake);
}

NominationPool _nominationPoolDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NominationPool();
  object.apy = reader.readDouble(offsets[0]);
  object.chain = reader.readString(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[4]);
  object.memberCount = reader.readLong(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.poolAccount = reader.readString(offsets[7]);
  object.poolId = reader.readLong(offsets[8]);
  object.state = reader.readString(offsets[9]);
  object.totalStake = reader.readLong(offsets[10]);
  return object;
}

P _nominationPoolDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nominationPoolGetId(NominationPool object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nominationPoolGetLinks(NominationPool object) {
  return [];
}

void _nominationPoolAttach(
    IsarCollection<dynamic> col, Id id, NominationPool object) {
  object.id = id;
}

extension NominationPoolQueryWhereSort
    on QueryBuilder<NominationPool, NominationPool, QWhere> {
  QueryBuilder<NominationPool, NominationPool, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NominationPoolQueryWhere
    on QueryBuilder<NominationPool, NominationPool, QWhereClause> {
  QueryBuilder<NominationPool, NominationPool, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NominationPool, NominationPool, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterWhereClause> idBetween(
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

extension NominationPoolQueryFilter
    on QueryBuilder<NominationPool, NominationPool, QFilterCondition> {
  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      apyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      apyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      apyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      apyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      memberCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memberCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      memberCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memberCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      memberCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memberCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      memberCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memberCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
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

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poolAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poolAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poolAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poolAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      poolIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poolId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      totalStakeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      totalStakeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      totalStakeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalStake',
        value: value,
      ));
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterFilterCondition>
      totalStakeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalStake',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NominationPoolQueryObject
    on QueryBuilder<NominationPool, NominationPool, QFilterCondition> {}

extension NominationPoolQueryLinks
    on QueryBuilder<NominationPool, NominationPool, QFilterCondition> {}

extension NominationPoolQuerySortBy
    on QueryBuilder<NominationPool, NominationPool, QSortBy> {
  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByMemberCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberCount', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByMemberCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberCount', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByPoolAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAccount', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByPoolAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAccount', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByPoolIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      sortByTotalStakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.desc);
    });
  }
}

extension NominationPoolQuerySortThenBy
    on QueryBuilder<NominationPool, NominationPool, QSortThenBy> {
  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByMemberCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberCount', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByMemberCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memberCount', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByPoolAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAccount', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByPoolAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAccount', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByPoolIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.asc);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QAfterSortBy>
      thenByTotalStakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStake', Sort.desc);
    });
  }
}

extension NominationPoolQueryWhereDistinct
    on QueryBuilder<NominationPool, NominationPool, QDistinct> {
  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apy');
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct>
      distinctByMemberCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memberCount');
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByPoolAccount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poolAccount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poolId');
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NominationPool, NominationPool, QDistinct>
      distinctByTotalStake() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStake');
    });
  }
}

extension NominationPoolQueryProperty
    on QueryBuilder<NominationPool, NominationPool, QQueryProperty> {
  QueryBuilder<NominationPool, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NominationPool, double, QQueryOperations> apyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apy');
    });
  }

  QueryBuilder<NominationPool, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<NominationPool, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<NominationPool, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<NominationPool, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<NominationPool, int, QQueryOperations> memberCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memberCount');
    });
  }

  QueryBuilder<NominationPool, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<NominationPool, String, QQueryOperations> poolAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poolAccount');
    });
  }

  QueryBuilder<NominationPool, int, QQueryOperations> poolIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poolId');
    });
  }

  QueryBuilder<NominationPool, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<NominationPool, int, QQueryOperations> totalStakeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStake');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStakingPositionCollection on Isar {
  IsarCollection<StakingPosition> get stakingPositions => this.collection();
}

const StakingPositionSchema = CollectionSchema(
  name: r'StakingPosition',
  id: 3561557270795597929,
  properties: {
    r'accountAddress': PropertySchema(
      id: 0,
      name: r'accountAddress',
      type: IsarType.string,
    ),
    r'apy': PropertySchema(
      id: 1,
      name: r'apy',
      type: IsarType.double,
    ),
    r'chain': PropertySchema(
      id: 2,
      name: r'chain',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'lastClaimed': PropertySchema(
      id: 4,
      name: r'lastClaimed',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'pendingRewards': PropertySchema(
      id: 6,
      name: r'pendingRewards',
      type: IsarType.long,
    ),
    r'poolId': PropertySchema(
      id: 7,
      name: r'poolId',
      type: IsarType.long,
    ),
    r'rewards': PropertySchema(
      id: 8,
      name: r'rewards',
      type: IsarType.double,
    ),
    r'stakedAmount': PropertySchema(
      id: 9,
      name: r'stakedAmount',
      type: IsarType.long,
    ),
    r'stakedAt': PropertySchema(
      id: 10,
      name: r'stakedAt',
      type: IsarType.dateTime,
    ),
    r'stakingType': PropertySchema(
      id: 11,
      name: r'stakingType',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    ),
    r'targetAddress': PropertySchema(
      id: 13,
      name: r'targetAddress',
      type: IsarType.string,
    ),
    r'targetName': PropertySchema(
      id: 14,
      name: r'targetName',
      type: IsarType.string,
    ),
    r'totalRewards': PropertySchema(
      id: 15,
      name: r'totalRewards',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 16,
      name: r'type',
      type: IsarType.string,
    ),
    r'unbondingAmount': PropertySchema(
      id: 17,
      name: r'unbondingAmount',
      type: IsarType.long,
    ),
    r'unbondingDaysRemaining': PropertySchema(
      id: 18,
      name: r'unbondingDaysRemaining',
      type: IsarType.long,
    ),
    r'unbondingEndsAt': PropertySchema(
      id: 19,
      name: r'unbondingEndsAt',
      type: IsarType.dateTime,
    ),
    r'unbondingProgress': PropertySchema(
      id: 20,
      name: r'unbondingProgress',
      type: IsarType.double,
    ),
    r'validatorAddress': PropertySchema(
      id: 21,
      name: r'validatorAddress',
      type: IsarType.string,
    )
  },
  estimateSize: _stakingPositionEstimateSize,
  serialize: _stakingPositionSerialize,
  deserialize: _stakingPositionDeserialize,
  deserializeProp: _stakingPositionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stakingPositionGetId,
  getLinks: _stakingPositionGetLinks,
  attach: _stakingPositionAttach,
  version: '3.1.0+1',
);

int _stakingPositionEstimateSize(
  StakingPosition object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountAddress.length * 3;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.stakingType.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.targetAddress.length * 3;
  bytesCount += 3 + object.targetName.length * 3;
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.validatorAddress.length * 3;
  return bytesCount;
}

void _stakingPositionSerialize(
  StakingPosition object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountAddress);
  writer.writeDouble(offsets[1], object.apy);
  writer.writeString(offsets[2], object.chain);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeDateTime(offsets[4], object.lastClaimed);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.pendingRewards);
  writer.writeLong(offsets[7], object.poolId);
  writer.writeDouble(offsets[8], object.rewards);
  writer.writeLong(offsets[9], object.stakedAmount);
  writer.writeDateTime(offsets[10], object.stakedAt);
  writer.writeString(offsets[11], object.stakingType);
  writer.writeString(offsets[12], object.status);
  writer.writeString(offsets[13], object.targetAddress);
  writer.writeString(offsets[14], object.targetName);
  writer.writeLong(offsets[15], object.totalRewards);
  writer.writeString(offsets[16], object.type);
  writer.writeLong(offsets[17], object.unbondingAmount);
  writer.writeLong(offsets[18], object.unbondingDaysRemaining);
  writer.writeDateTime(offsets[19], object.unbondingEndsAt);
  writer.writeDouble(offsets[20], object.unbondingProgress);
  writer.writeString(offsets[21], object.validatorAddress);
}

StakingPosition _stakingPositionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StakingPosition();
  object.accountAddress = reader.readString(offsets[0]);
  object.apy = reader.readDouble(offsets[1]);
  object.chain = reader.readString(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.lastClaimed = reader.readDateTime(offsets[4]);
  object.pendingRewards = reader.readLong(offsets[6]);
  object.poolId = reader.readLong(offsets[7]);
  object.stakedAmount = reader.readLong(offsets[9]);
  object.stakedAt = reader.readDateTime(offsets[10]);
  object.stakingType = reader.readString(offsets[11]);
  object.status = reader.readString(offsets[12]);
  object.targetAddress = reader.readString(offsets[13]);
  object.targetName = reader.readString(offsets[14]);
  object.totalRewards = reader.readLong(offsets[15]);
  object.unbondingAmount = reader.readLong(offsets[17]);
  object.unbondingEndsAt = reader.readDateTime(offsets[19]);
  object.validatorAddress = reader.readString(offsets[21]);
  return object;
}

P _stakingPositionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stakingPositionGetId(StakingPosition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stakingPositionGetLinks(StakingPosition object) {
  return [];
}

void _stakingPositionAttach(
    IsarCollection<dynamic> col, Id id, StakingPosition object) {
  object.id = id;
}

extension StakingPositionQueryWhereSort
    on QueryBuilder<StakingPosition, StakingPosition, QWhere> {
  QueryBuilder<StakingPosition, StakingPosition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StakingPositionQueryWhere
    on QueryBuilder<StakingPosition, StakingPosition, QWhereClause> {
  QueryBuilder<StakingPosition, StakingPosition, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterWhereClause>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterWhereClause> idBetween(
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

extension StakingPositionQueryFilter
    on QueryBuilder<StakingPosition, StakingPosition, QFilterCondition> {
  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      accountAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      apyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      apyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      apyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apy',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      apyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      lastClaimedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastClaimed',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      lastClaimedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastClaimed',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      lastClaimedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastClaimed',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      lastClaimedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastClaimed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      pendingRewardsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendingRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      pendingRewardsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pendingRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      pendingRewardsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pendingRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      pendingRewardsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pendingRewards',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      poolIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      poolIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      poolIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poolId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      poolIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poolId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      rewardsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rewards',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      rewardsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rewards',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      rewardsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rewards',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      rewardsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rewards',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakedAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakedAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakingType',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      stakingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakingType',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusEqualTo(
    String value, {
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusLessThan(
    String value, {
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
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

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      targetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      totalRewardsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      totalRewardsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      totalRewardsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRewards',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      totalRewardsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRewards',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unbondingAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unbondingAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unbondingAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unbondingAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingDaysRemainingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unbondingDaysRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingDaysRemainingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unbondingDaysRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingDaysRemainingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unbondingDaysRemaining',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingDaysRemainingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unbondingDaysRemaining',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingEndsAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unbondingEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingEndsAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unbondingEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingEndsAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unbondingEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingEndsAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unbondingEndsAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingProgressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unbondingProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingProgressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unbondingProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingProgressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unbondingProgress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      unbondingProgressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unbondingProgress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validatorAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'validatorAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatorAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterFilterCondition>
      validatorAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'validatorAddress',
        value: '',
      ));
    });
  }
}

extension StakingPositionQueryObject
    on QueryBuilder<StakingPosition, StakingPosition, QFilterCondition> {}

extension StakingPositionQueryLinks
    on QueryBuilder<StakingPosition, StakingPosition, QFilterCondition> {}

extension StakingPositionQuerySortBy
    on QueryBuilder<StakingPosition, StakingPosition, QSortBy> {
  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByAccountAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByAccountAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByLastClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClaimed', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByLastClaimedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClaimed', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByPendingRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingRewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByPendingRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingRewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByPoolIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAmount', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAmount', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakingType', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStakingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakingType', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTargetAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTargetAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTargetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetName', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTargetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetName', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTotalRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTotalRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingAmount', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingAmount', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingDaysRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingDaysRemaining', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingDaysRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingDaysRemaining', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingEndsAt', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingEndsAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingEndsAt', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingProgress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByUnbondingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingProgress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByValidatorAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      sortByValidatorAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.desc);
    });
  }
}

extension StakingPositionQuerySortThenBy
    on QueryBuilder<StakingPosition, StakingPosition, QSortThenBy> {
  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByAccountAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByAccountAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByApyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apy', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByLastClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClaimed', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByLastClaimedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastClaimed', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByPendingRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingRewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByPendingRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingRewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByPoolIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolId', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAmount', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAmount', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakingType', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStakingTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakingType', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTargetAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTargetAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTargetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetName', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTargetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetName', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTotalRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRewards', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTotalRewardsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRewards', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingAmount', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingAmount', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingDaysRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingDaysRemaining', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingDaysRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingDaysRemaining', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingEndsAt', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingEndsAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingEndsAt', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingProgress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByUnbondingProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unbondingProgress', Sort.desc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByValidatorAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QAfterSortBy>
      thenByValidatorAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.desc);
    });
  }
}

extension StakingPositionQueryWhereDistinct
    on QueryBuilder<StakingPosition, StakingPosition, QDistinct> {
  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByAccountAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByApy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apy');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByLastClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastClaimed');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByPendingRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingRewards');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByPoolId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poolId');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rewards');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByStakedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakedAmount');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByStakedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakedAt');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByStakingType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakingType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByTargetAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByTargetName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByTotalRewards() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRewards');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByUnbondingAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unbondingAmount');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByUnbondingDaysRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unbondingDaysRemaining');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByUnbondingEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unbondingEndsAt');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByUnbondingProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unbondingProgress');
    });
  }

  QueryBuilder<StakingPosition, StakingPosition, QDistinct>
      distinctByValidatorAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatorAddress',
          caseSensitive: caseSensitive);
    });
  }
}

extension StakingPositionQueryProperty
    on QueryBuilder<StakingPosition, StakingPosition, QQueryProperty> {
  QueryBuilder<StakingPosition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations>
      accountAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountAddress');
    });
  }

  QueryBuilder<StakingPosition, double, QQueryOperations> apyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apy');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<StakingPosition, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<StakingPosition, DateTime, QQueryOperations>
      lastClaimedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastClaimed');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations>
      pendingRewardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingRewards');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations> poolIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poolId');
    });
  }

  QueryBuilder<StakingPosition, double, QQueryOperations> rewardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rewards');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations> stakedAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakedAmount');
    });
  }

  QueryBuilder<StakingPosition, DateTime, QQueryOperations> stakedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakedAt');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations>
      stakingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakingType');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations>
      targetAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetAddress');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations> targetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetName');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations> totalRewardsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRewards');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations>
      unbondingAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unbondingAmount');
    });
  }

  QueryBuilder<StakingPosition, int, QQueryOperations>
      unbondingDaysRemainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unbondingDaysRemaining');
    });
  }

  QueryBuilder<StakingPosition, DateTime, QQueryOperations>
      unbondingEndsAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unbondingEndsAt');
    });
  }

  QueryBuilder<StakingPosition, double, QQueryOperations>
      unbondingProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unbondingProgress');
    });
  }

  QueryBuilder<StakingPosition, String, QQueryOperations>
      validatorAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatorAddress');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStakingRewardCollection on Isar {
  IsarCollection<StakingReward> get stakingRewards => this.collection();
}

const StakingRewardSchema = CollectionSchema(
  name: r'StakingReward',
  id: -9102433405620900039,
  properties: {
    r'accountAddress': PropertySchema(
      id: 0,
      name: r'accountAddress',
      type: IsarType.string,
    ),
    r'amount': PropertySchema(
      id: 1,
      name: r'amount',
      type: IsarType.long,
    ),
    r'chain': PropertySchema(
      id: 2,
      name: r'chain',
      type: IsarType.string,
    ),
    r'claimedAt': PropertySchema(
      id: 3,
      name: r'claimedAt',
      type: IsarType.dateTime,
    ),
    r'earnedAt': PropertySchema(
      id: 4,
      name: r'earnedAt',
      type: IsarType.dateTime,
    ),
    r'era': PropertySchema(
      id: 5,
      name: r'era',
      type: IsarType.string,
    ),
    r'isClaimed': PropertySchema(
      id: 6,
      name: r'isClaimed',
      type: IsarType.bool,
    ),
    r'symbol': PropertySchema(
      id: 7,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 8,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'validatorAddress': PropertySchema(
      id: 9,
      name: r'validatorAddress',
      type: IsarType.string,
    )
  },
  estimateSize: _stakingRewardEstimateSize,
  serialize: _stakingRewardSerialize,
  deserialize: _stakingRewardDeserialize,
  deserializeProp: _stakingRewardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stakingRewardGetId,
  getLinks: _stakingRewardGetLinks,
  attach: _stakingRewardAttach,
  version: '3.1.0+1',
);

int _stakingRewardEstimateSize(
  StakingReward object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountAddress.length * 3;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.era.length * 3;
  bytesCount += 3 + object.symbol.length * 3;
  bytesCount += 3 + object.validatorAddress.length * 3;
  return bytesCount;
}

void _stakingRewardSerialize(
  StakingReward object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountAddress);
  writer.writeLong(offsets[1], object.amount);
  writer.writeString(offsets[2], object.chain);
  writer.writeDateTime(offsets[3], object.claimedAt);
  writer.writeDateTime(offsets[4], object.earnedAt);
  writer.writeString(offsets[5], object.era);
  writer.writeBool(offsets[6], object.isClaimed);
  writer.writeString(offsets[7], object.symbol);
  writer.writeDateTime(offsets[8], object.timestamp);
  writer.writeString(offsets[9], object.validatorAddress);
}

StakingReward _stakingRewardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StakingReward();
  object.accountAddress = reader.readString(offsets[0]);
  object.amount = reader.readLong(offsets[1]);
  object.chain = reader.readString(offsets[2]);
  object.claimedAt = reader.readDateTime(offsets[3]);
  object.earnedAt = reader.readDateTime(offsets[4]);
  object.era = reader.readString(offsets[5]);
  object.id = id;
  object.isClaimed = reader.readBool(offsets[6]);
  object.symbol = reader.readString(offsets[7]);
  object.timestamp = reader.readDateTime(offsets[8]);
  object.validatorAddress = reader.readString(offsets[9]);
  return object;
}

P _stakingRewardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stakingRewardGetId(StakingReward object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stakingRewardGetLinks(StakingReward object) {
  return [];
}

void _stakingRewardAttach(
    IsarCollection<dynamic> col, Id id, StakingReward object) {
  object.id = id;
}

extension StakingRewardQueryWhereSort
    on QueryBuilder<StakingReward, StakingReward, QWhere> {
  QueryBuilder<StakingReward, StakingReward, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StakingRewardQueryWhere
    on QueryBuilder<StakingReward, StakingReward, QWhereClause> {
  QueryBuilder<StakingReward, StakingReward, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<StakingReward, StakingReward, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterWhereClause> idBetween(
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

extension StakingRewardQueryFilter
    on QueryBuilder<StakingReward, StakingReward, QFilterCondition> {
  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      accountAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      amountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      amountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      amountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      amountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      claimedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'claimedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      claimedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'claimedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      claimedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'claimedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      claimedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'claimedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      earnedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      earnedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      earnedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      earnedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earnedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      eraGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'era',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      eraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'era',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> eraMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'era',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      eraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'era',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      eraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'era',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      isClaimedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isClaimed',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validatorAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'validatorAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'validatorAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatorAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterFilterCondition>
      validatorAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'validatorAddress',
        value: '',
      ));
    });
  }
}

extension StakingRewardQueryObject
    on QueryBuilder<StakingReward, StakingReward, QFilterCondition> {}

extension StakingRewardQueryLinks
    on QueryBuilder<StakingReward, StakingReward, QFilterCondition> {}

extension StakingRewardQuerySortBy
    on QueryBuilder<StakingReward, StakingReward, QSortBy> {
  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByAccountAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByAccountAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByClaimedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claimedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByClaimedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claimedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByEra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'era', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByEraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'era', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByIsClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClaimed', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByIsClaimedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClaimed', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByValidatorAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      sortByValidatorAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.desc);
    });
  }
}

extension StakingRewardQuerySortThenBy
    on QueryBuilder<StakingReward, StakingReward, QSortThenBy> {
  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByAccountAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByAccountAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountAddress', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByClaimedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claimedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByClaimedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'claimedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByEra() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'era', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByEraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'era', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByIsClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClaimed', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByIsClaimedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClaimed', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByValidatorAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.asc);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QAfterSortBy>
      thenByValidatorAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatorAddress', Sort.desc);
    });
  }
}

extension StakingRewardQueryWhereDistinct
    on QueryBuilder<StakingReward, StakingReward, QDistinct> {
  QueryBuilder<StakingReward, StakingReward, QDistinct>
      distinctByAccountAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByClaimedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'claimedAt');
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earnedAt');
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByEra(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'era', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByIsClaimed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isClaimed');
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<StakingReward, StakingReward, QDistinct>
      distinctByValidatorAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatorAddress',
          caseSensitive: caseSensitive);
    });
  }
}

extension StakingRewardQueryProperty
    on QueryBuilder<StakingReward, StakingReward, QQueryProperty> {
  QueryBuilder<StakingReward, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StakingReward, String, QQueryOperations>
      accountAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountAddress');
    });
  }

  QueryBuilder<StakingReward, int, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<StakingReward, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<StakingReward, DateTime, QQueryOperations> claimedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'claimedAt');
    });
  }

  QueryBuilder<StakingReward, DateTime, QQueryOperations> earnedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earnedAt');
    });
  }

  QueryBuilder<StakingReward, String, QQueryOperations> eraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'era');
    });
  }

  QueryBuilder<StakingReward, bool, QQueryOperations> isClaimedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isClaimed');
    });
  }

  QueryBuilder<StakingReward, String, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<StakingReward, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<StakingReward, String, QQueryOperations>
      validatorAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatorAddress');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validator _$ValidatorFromJson(Map<String, dynamic> json) => Validator()
  ..id = (json['id'] as num).toInt()
  ..address = json['address'] as String
  ..name = json['name'] as String
  ..chain = json['chain'] as String
  ..commission = (json['commission'] as num).toDouble()
  ..apy = (json['apy'] as num).toDouble()
  ..totalStake = (json['totalStake'] as num).toInt()
  ..nominatorCount = (json['nominatorCount'] as num).toInt()
  ..isActive = json['isActive'] as bool
  ..isOversubscribed = json['isOversubscribed'] as bool
  ..lastUpdated = DateTime.parse(json['lastUpdated'] as String)
  ..identity = json['identity'] as String
  ..website = json['website'] as String
  ..description = json['description'] as String;

Map<String, dynamic> _$ValidatorToJson(Validator instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'name': instance.name,
      'chain': instance.chain,
      'commission': instance.commission,
      'apy': instance.apy,
      'totalStake': instance.totalStake,
      'nominatorCount': instance.nominatorCount,
      'isActive': instance.isActive,
      'isOversubscribed': instance.isOversubscribed,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'identity': instance.identity,
      'website': instance.website,
      'description': instance.description,
    };

NominationPool _$NominationPoolFromJson(Map<String, dynamic> json) =>
    NominationPool()
      ..id = (json['id'] as num).toInt()
      ..poolId = (json['poolId'] as num).toInt()
      ..name = json['name'] as String
      ..chain = json['chain'] as String
      ..state = json['state'] as String
      ..apy = (json['apy'] as num).toDouble()
      ..totalStake = (json['totalStake'] as num).toInt()
      ..memberCount = (json['memberCount'] as num).toInt()
      ..poolAccount = json['poolAccount'] as String
      ..lastUpdated = DateTime.parse(json['lastUpdated'] as String)
      ..description = json['description'] as String;

Map<String, dynamic> _$NominationPoolToJson(NominationPool instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poolId': instance.poolId,
      'name': instance.name,
      'chain': instance.chain,
      'state': instance.state,
      'apy': instance.apy,
      'totalStake': instance.totalStake,
      'memberCount': instance.memberCount,
      'poolAccount': instance.poolAccount,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'description': instance.description,
    };

StakingPosition _$StakingPositionFromJson(Map<String, dynamic> json) =>
    StakingPosition()
      ..id = (json['id'] as num).toInt()
      ..accountAddress = json['accountAddress'] as String
      ..chain = json['chain'] as String
      ..stakingType = json['stakingType'] as String
      ..targetAddress = json['targetAddress'] as String
      ..targetName = json['targetName'] as String
      ..stakedAmount = (json['stakedAmount'] as num).toInt()
      ..pendingRewards = (json['pendingRewards'] as num).toInt()
      ..totalRewards = (json['totalRewards'] as num).toInt()
      ..stakedAt = DateTime.parse(json['stakedAt'] as String)
      ..lastClaimed = DateTime.parse(json['lastClaimed'] as String)
      ..isActive = json['isActive'] as bool
      ..status = json['status'] as String
      ..unbondingAmount = (json['unbondingAmount'] as num).toInt()
      ..unbondingEndsAt = DateTime.parse(json['unbondingEndsAt'] as String)
      ..apy = (json['apy'] as num).toDouble()
      ..poolId = (json['poolId'] as num).toInt()
      ..validatorAddress = json['validatorAddress'] as String;

Map<String, dynamic> _$StakingPositionToJson(StakingPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountAddress': instance.accountAddress,
      'chain': instance.chain,
      'stakingType': instance.stakingType,
      'targetAddress': instance.targetAddress,
      'targetName': instance.targetName,
      'stakedAmount': instance.stakedAmount,
      'pendingRewards': instance.pendingRewards,
      'totalRewards': instance.totalRewards,
      'stakedAt': instance.stakedAt.toIso8601String(),
      'lastClaimed': instance.lastClaimed.toIso8601String(),
      'isActive': instance.isActive,
      'status': instance.status,
      'unbondingAmount': instance.unbondingAmount,
      'unbondingEndsAt': instance.unbondingEndsAt.toIso8601String(),
      'apy': instance.apy,
      'poolId': instance.poolId,
      'validatorAddress': instance.validatorAddress,
    };

StakingReward _$StakingRewardFromJson(Map<String, dynamic> json) =>
    StakingReward()
      ..id = (json['id'] as num).toInt()
      ..accountAddress = json['accountAddress'] as String
      ..chain = json['chain'] as String
      ..validatorAddress = json['validatorAddress'] as String
      ..amount = (json['amount'] as num).toInt()
      ..earnedAt = DateTime.parse(json['earnedAt'] as String)
      ..claimedAt = DateTime.parse(json['claimedAt'] as String)
      ..isClaimed = json['isClaimed'] as bool
      ..era = json['era'] as String
      ..symbol = json['symbol'] as String
      ..timestamp = DateTime.parse(json['timestamp'] as String);

Map<String, dynamic> _$StakingRewardToJson(StakingReward instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountAddress': instance.accountAddress,
      'chain': instance.chain,
      'validatorAddress': instance.validatorAddress,
      'amount': instance.amount,
      'earnedAt': instance.earnedAt.toIso8601String(),
      'claimedAt': instance.claimedAt.toIso8601String(),
      'isClaimed': instance.isClaimed,
      'era': instance.era,
      'symbol': instance.symbol,
      'timestamp': instance.timestamp.toIso8601String(),
    };

StakingOperationResult _$StakingOperationResultFromJson(
        Map<String, dynamic> json) =>
    StakingOperationResult(
      success: json['success'] as bool,
      transactionHash: json['transactionHash'] as String?,
      error: json['error'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StakingOperationResultToJson(
        StakingOperationResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'transactionHash': instance.transactionHash,
      'error': instance.error,
      'data': instance.data,
    };

StakingStats _$StakingStatsFromJson(Map<String, dynamic> json) => StakingStats(
      totalStaked: (json['totalStaked'] as num).toInt(),
      totalRewards: (json['totalRewards'] as num).toInt(),
      pendingRewards: (json['pendingRewards'] as num).toInt(),
      averageApy: (json['averageApy'] as num).toDouble(),
      activePositions: (json['activePositions'] as num).toInt(),
      supportedChains: (json['supportedChains'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      stakingRatio: (json['stakingRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$StakingStatsToJson(StakingStats instance) =>
    <String, dynamic>{
      'totalStaked': instance.totalStaked,
      'totalRewards': instance.totalRewards,
      'pendingRewards': instance.pendingRewards,
      'averageApy': instance.averageApy,
      'activePositions': instance.activePositions,
      'supportedChains': instance.supportedChains,
      'stakingRatio': instance.stakingRatio,
    };
