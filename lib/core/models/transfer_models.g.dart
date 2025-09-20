// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTokenTransferCollection on Isar {
  IsarCollection<TokenTransfer> get tokenTransfers => this.collection();
}

const TokenTransferSchema = CollectionSchema(
  name: r'TokenTransfer',
  id: -1924507601250244878,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.string,
    ),
    r'blockNumber': PropertySchema(
      id: 1,
      name: r'blockNumber',
      type: IsarType.string,
    ),
    r'chain': PropertySchema(
      id: 2,
      name: r'chain',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'direction': PropertySchema(
      id: 4,
      name: r'direction',
      type: IsarType.string,
      enumMap: _TokenTransferdirectionEnumValueMap,
    ),
    r'fromAddress': PropertySchema(
      id: 5,
      name: r'fromAddress',
      type: IsarType.string,
    ),
    r'gasFee': PropertySchema(
      id: 6,
      name: r'gasFee',
      type: IsarType.string,
    ),
    r'gasUsed': PropertySchema(
      id: 7,
      name: r'gasUsed',
      type: IsarType.string,
    ),
    r'memo': PropertySchema(
      id: 8,
      name: r'memo',
      type: IsarType.string,
    ),
    r'metadata': PropertySchema(
      id: 9,
      name: r'metadata',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
      enumMap: _TokenTransferstatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 11,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'toAddress': PropertySchema(
      id: 12,
      name: r'toAddress',
      type: IsarType.string,
    ),
    r'tokenName': PropertySchema(
      id: 13,
      name: r'tokenName',
      type: IsarType.string,
    ),
    r'tokenSymbol': PropertySchema(
      id: 14,
      name: r'tokenSymbol',
      type: IsarType.string,
    ),
    r'transactionHash': PropertySchema(
      id: 15,
      name: r'transactionHash',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _tokenTransferEstimateSize,
  serialize: _tokenTransferSerialize,
  deserialize: _tokenTransferDeserialize,
  deserializeProp: _tokenTransferDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionHash': IndexSchema(
      id: 21900115721806949,
      name: r'transactionHash',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'transactionHash',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'fromAddress': IndexSchema(
      id: 5836613405897100011,
      name: r'fromAddress',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fromAddress',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'toAddress': IndexSchema(
      id: 7021162944562939110,
      name: r'toAddress',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'toAddress',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'direction': IndexSchema(
      id: -4378097054569869819,
      name: r'direction',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'direction',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tokenTransferGetId,
  getLinks: _tokenTransferGetLinks,
  attach: _tokenTransferAttach,
  version: '3.1.0+1',
);

int _tokenTransferEstimateSize(
  TokenTransfer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.amount.length * 3;
  {
    final value = object.blockNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.direction.name.length * 3;
  bytesCount += 3 + object.fromAddress.length * 3;
  {
    final value = object.gasFee;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gasUsed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.memo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.metadata;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.toAddress.length * 3;
  bytesCount += 3 + object.tokenName.length * 3;
  bytesCount += 3 + object.tokenSymbol.length * 3;
  bytesCount += 3 + object.transactionHash.length * 3;
  return bytesCount;
}

void _tokenTransferSerialize(
  TokenTransfer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.amount);
  writer.writeString(offsets[1], object.blockNumber);
  writer.writeString(offsets[2], object.chain);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.direction.name);
  writer.writeString(offsets[5], object.fromAddress);
  writer.writeString(offsets[6], object.gasFee);
  writer.writeString(offsets[7], object.gasUsed);
  writer.writeString(offsets[8], object.memo);
  writer.writeString(offsets[9], object.metadata);
  writer.writeString(offsets[10], object.status.name);
  writer.writeDateTime(offsets[11], object.timestamp);
  writer.writeString(offsets[12], object.toAddress);
  writer.writeString(offsets[13], object.tokenName);
  writer.writeString(offsets[14], object.tokenSymbol);
  writer.writeString(offsets[15], object.transactionHash);
  writer.writeDateTime(offsets[16], object.updatedAt);
}

TokenTransfer _tokenTransferDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TokenTransfer();
  object.amount = reader.readString(offsets[0]);
  object.blockNumber = reader.readStringOrNull(offsets[1]);
  object.chain = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.direction = _TokenTransferdirectionValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      TransferDirection.send;
  object.fromAddress = reader.readString(offsets[5]);
  object.gasFee = reader.readStringOrNull(offsets[6]);
  object.gasUsed = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.memo = reader.readStringOrNull(offsets[8]);
  object.metadata = reader.readStringOrNull(offsets[9]);
  object.status =
      _TokenTransferstatusValueEnumMap[reader.readStringOrNull(offsets[10])] ??
          TransferStatus.pending;
  object.timestamp = reader.readDateTime(offsets[11]);
  object.toAddress = reader.readString(offsets[12]);
  object.tokenName = reader.readString(offsets[13]);
  object.tokenSymbol = reader.readString(offsets[14]);
  object.transactionHash = reader.readString(offsets[15]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[16]);
  return object;
}

P _tokenTransferDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (_TokenTransferdirectionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransferDirection.send) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_TokenTransferstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransferStatus.pending) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TokenTransferdirectionEnumValueMap = {
  r'send': r'send',
  r'receive': r'receive',
};
const _TokenTransferdirectionValueEnumMap = {
  r'send': TransferDirection.send,
  r'receive': TransferDirection.receive,
};
const _TokenTransferstatusEnumValueMap = {
  r'pending': r'pending',
  r'confirmed': r'confirmed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _TokenTransferstatusValueEnumMap = {
  r'pending': TransferStatus.pending,
  r'confirmed': TransferStatus.confirmed,
  r'failed': TransferStatus.failed,
  r'cancelled': TransferStatus.cancelled,
};

Id _tokenTransferGetId(TokenTransfer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tokenTransferGetLinks(TokenTransfer object) {
  return [];
}

void _tokenTransferAttach(
    IsarCollection<dynamic> col, Id id, TokenTransfer object) {
  object.id = id;
}

extension TokenTransferQueryWhereSort
    on QueryBuilder<TokenTransfer, TokenTransfer, QWhere> {
  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TokenTransferQueryWhere
    on QueryBuilder<TokenTransfer, TokenTransfer, QWhereClause> {
  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> idBetween(
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      transactionHashEqualTo(String transactionHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionHash',
        value: [transactionHash],
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      transactionHashNotEqualTo(String transactionHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [],
              upper: [transactionHash],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [transactionHash],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [transactionHash],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [],
              upper: [transactionHash],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      fromAddressEqualTo(String fromAddress) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromAddress',
        value: [fromAddress],
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      fromAddressNotEqualTo(String fromAddress) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [],
              upper: [fromAddress],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [fromAddress],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [fromAddress],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [],
              upper: [fromAddress],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      toAddressEqualTo(String toAddress) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'toAddress',
        value: [toAddress],
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      toAddressNotEqualTo(String toAddress) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [],
              upper: [toAddress],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [toAddress],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [toAddress],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [],
              upper: [toAddress],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      directionEqualTo(TransferDirection direction) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'direction',
        value: [direction],
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      directionNotEqualTo(TransferDirection direction) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [],
              upper: [direction],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [direction],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [direction],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [],
              upper: [direction],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause> statusEqualTo(
      TransferStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterWhereClause>
      statusNotEqualTo(TransferStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TokenTransferQueryFilter
    on QueryBuilder<TokenTransfer, TokenTransfer, QFilterCondition> {
  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      blockNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionEqualTo(
    TransferDirection value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionGreaterThan(
    TransferDirection value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionLessThan(
    TransferDirection value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionBetween(
    TransferDirection lower,
    TransferDirection upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      directionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      fromAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasFee',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasFee',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasFee',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasFeeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      gasUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> memoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> memoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition> memoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      memoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'metadata',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'metadata',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'metadata',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'metadata',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'metadata',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      metadataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'metadata',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusEqualTo(
    TransferStatus value, {
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusGreaterThan(
    TransferStatus value, {
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusLessThan(
    TransferStatus value, {
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusBetween(
    TransferStatus lower,
    TransferStatus upper, {
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      toAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenName',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenName',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenSymbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenSymbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      tokenSymbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      transactionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterFilterCondition>
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
}

extension TokenTransferQueryObject
    on QueryBuilder<TokenTransfer, TokenTransfer, QFilterCondition> {}

extension TokenTransferQueryLinks
    on QueryBuilder<TokenTransfer, TokenTransfer, QFilterCondition> {}

extension TokenTransferQuerySortBy
    on QueryBuilder<TokenTransfer, TokenTransfer, QSortBy> {
  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByMetadata() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadata', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByMetadataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadata', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByTokenName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenName', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByTokenNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenName', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByTokenSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByTokenSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TokenTransferQuerySortThenBy
    on QueryBuilder<TokenTransfer, TokenTransfer, QSortThenBy> {
  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByMetadata() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadata', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByMetadataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'metadata', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByTokenName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenName', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByTokenNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenName', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByTokenSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByTokenSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.desc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TokenTransferQueryWhereDistinct
    on QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> {
  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByBlockNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByDirection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByFromAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByGasFee(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasFee', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByGasUsed(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasUsed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByMetadata(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'metadata', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByToAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByTokenName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByTokenSymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenSymbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct>
      distinctByTransactionHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenTransfer, TokenTransfer, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TokenTransferQueryProperty
    on QueryBuilder<TokenTransfer, TokenTransfer, QQueryProperty> {
  QueryBuilder<TokenTransfer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<TokenTransfer, String?, QQueryOperations> blockNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockNumber');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<TokenTransfer, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TokenTransfer, TransferDirection, QQueryOperations>
      directionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direction');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> fromAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromAddress');
    });
  }

  QueryBuilder<TokenTransfer, String?, QQueryOperations> gasFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasFee');
    });
  }

  QueryBuilder<TokenTransfer, String?, QQueryOperations> gasUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasUsed');
    });
  }

  QueryBuilder<TokenTransfer, String?, QQueryOperations> memoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memo');
    });
  }

  QueryBuilder<TokenTransfer, String?, QQueryOperations> metadataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'metadata');
    });
  }

  QueryBuilder<TokenTransfer, TransferStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TokenTransfer, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> toAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toAddress');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> tokenNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenName');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations> tokenSymbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenSymbol');
    });
  }

  QueryBuilder<TokenTransfer, String, QQueryOperations>
      transactionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionHash');
    });
  }

  QueryBuilder<TokenTransfer, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNftTransferCollection on Isar {
  IsarCollection<NftTransfer> get nftTransfers => this.collection();
}

const NftTransferSchema = CollectionSchema(
  name: r'NftTransfer',
  id: 8319411001169769960,
  properties: {
    r'blockNumber': PropertySchema(
      id: 0,
      name: r'blockNumber',
      type: IsarType.string,
    ),
    r'chain': PropertySchema(
      id: 1,
      name: r'chain',
      type: IsarType.string,
    ),
    r'collectionId': PropertySchema(
      id: 2,
      name: r'collectionId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'direction': PropertySchema(
      id: 4,
      name: r'direction',
      type: IsarType.string,
      enumMap: _NftTransferdirectionEnumValueMap,
    ),
    r'fromAddress': PropertySchema(
      id: 5,
      name: r'fromAddress',
      type: IsarType.string,
    ),
    r'gasFee': PropertySchema(
      id: 6,
      name: r'gasFee',
      type: IsarType.string,
    ),
    r'gasUsed': PropertySchema(
      id: 7,
      name: r'gasUsed',
      type: IsarType.string,
    ),
    r'memo': PropertySchema(
      id: 8,
      name: r'memo',
      type: IsarType.string,
    ),
    r'nftId': PropertySchema(
      id: 9,
      name: r'nftId',
      type: IsarType.string,
    ),
    r'nftImage': PropertySchema(
      id: 10,
      name: r'nftImage',
      type: IsarType.string,
    ),
    r'nftName': PropertySchema(
      id: 11,
      name: r'nftName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
      enumMap: _NftTransferstatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 13,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'toAddress': PropertySchema(
      id: 14,
      name: r'toAddress',
      type: IsarType.string,
    ),
    r'transactionHash': PropertySchema(
      id: 15,
      name: r'transactionHash',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _nftTransferEstimateSize,
  serialize: _nftTransferSerialize,
  deserialize: _nftTransferDeserialize,
  deserializeProp: _nftTransferDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionHash': IndexSchema(
      id: 21900115721806949,
      name: r'transactionHash',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'transactionHash',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'fromAddress': IndexSchema(
      id: 5836613405897100011,
      name: r'fromAddress',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fromAddress',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'toAddress': IndexSchema(
      id: 7021162944562939110,
      name: r'toAddress',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'toAddress',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'direction': IndexSchema(
      id: -4378097054569869819,
      name: r'direction',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'direction',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nftTransferGetId,
  getLinks: _nftTransferGetLinks,
  attach: _nftTransferAttach,
  version: '3.1.0+1',
);

int _nftTransferEstimateSize(
  NftTransfer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.blockNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.collectionId.length * 3;
  bytesCount += 3 + object.direction.name.length * 3;
  bytesCount += 3 + object.fromAddress.length * 3;
  {
    final value = object.gasFee;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gasUsed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.memo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nftId.length * 3;
  {
    final value = object.nftImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nftName.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.toAddress.length * 3;
  bytesCount += 3 + object.transactionHash.length * 3;
  return bytesCount;
}

void _nftTransferSerialize(
  NftTransfer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.blockNumber);
  writer.writeString(offsets[1], object.chain);
  writer.writeString(offsets[2], object.collectionId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.direction.name);
  writer.writeString(offsets[5], object.fromAddress);
  writer.writeString(offsets[6], object.gasFee);
  writer.writeString(offsets[7], object.gasUsed);
  writer.writeString(offsets[8], object.memo);
  writer.writeString(offsets[9], object.nftId);
  writer.writeString(offsets[10], object.nftImage);
  writer.writeString(offsets[11], object.nftName);
  writer.writeString(offsets[12], object.status.name);
  writer.writeDateTime(offsets[13], object.timestamp);
  writer.writeString(offsets[14], object.toAddress);
  writer.writeString(offsets[15], object.transactionHash);
  writer.writeDateTime(offsets[16], object.updatedAt);
}

NftTransfer _nftTransferDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NftTransfer();
  object.blockNumber = reader.readStringOrNull(offsets[0]);
  object.chain = reader.readString(offsets[1]);
  object.collectionId = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.direction =
      _NftTransferdirectionValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          TransferDirection.send;
  object.fromAddress = reader.readString(offsets[5]);
  object.gasFee = reader.readStringOrNull(offsets[6]);
  object.gasUsed = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.memo = reader.readStringOrNull(offsets[8]);
  object.nftId = reader.readString(offsets[9]);
  object.nftImage = reader.readStringOrNull(offsets[10]);
  object.nftName = reader.readString(offsets[11]);
  object.status =
      _NftTransferstatusValueEnumMap[reader.readStringOrNull(offsets[12])] ??
          TransferStatus.pending;
  object.timestamp = reader.readDateTime(offsets[13]);
  object.toAddress = reader.readString(offsets[14]);
  object.transactionHash = reader.readString(offsets[15]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[16]);
  return object;
}

P _nftTransferDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (_NftTransferdirectionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransferDirection.send) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (_NftTransferstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          TransferStatus.pending) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NftTransferdirectionEnumValueMap = {
  r'send': r'send',
  r'receive': r'receive',
};
const _NftTransferdirectionValueEnumMap = {
  r'send': TransferDirection.send,
  r'receive': TransferDirection.receive,
};
const _NftTransferstatusEnumValueMap = {
  r'pending': r'pending',
  r'confirmed': r'confirmed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _NftTransferstatusValueEnumMap = {
  r'pending': TransferStatus.pending,
  r'confirmed': TransferStatus.confirmed,
  r'failed': TransferStatus.failed,
  r'cancelled': TransferStatus.cancelled,
};

Id _nftTransferGetId(NftTransfer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nftTransferGetLinks(NftTransfer object) {
  return [];
}

void _nftTransferAttach(
    IsarCollection<dynamic> col, Id id, NftTransfer object) {
  object.id = id;
}

extension NftTransferQueryWhereSort
    on QueryBuilder<NftTransfer, NftTransfer, QWhere> {
  QueryBuilder<NftTransfer, NftTransfer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NftTransferQueryWhere
    on QueryBuilder<NftTransfer, NftTransfer, QWhereClause> {
  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> idBetween(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause>
      transactionHashEqualTo(String transactionHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionHash',
        value: [transactionHash],
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause>
      transactionHashNotEqualTo(String transactionHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [],
              upper: [transactionHash],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [transactionHash],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [transactionHash],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionHash',
              lower: [],
              upper: [transactionHash],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> fromAddressEqualTo(
      String fromAddress) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fromAddress',
        value: [fromAddress],
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause>
      fromAddressNotEqualTo(String fromAddress) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [],
              upper: [fromAddress],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [fromAddress],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [fromAddress],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fromAddress',
              lower: [],
              upper: [fromAddress],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> toAddressEqualTo(
      String toAddress) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'toAddress',
        value: [toAddress],
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> toAddressNotEqualTo(
      String toAddress) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [],
              upper: [toAddress],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [toAddress],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [toAddress],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'toAddress',
              lower: [],
              upper: [toAddress],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> directionEqualTo(
      TransferDirection direction) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'direction',
        value: [direction],
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> directionNotEqualTo(
      TransferDirection direction) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [],
              upper: [direction],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [direction],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [direction],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'direction',
              lower: [],
              upper: [direction],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> statusEqualTo(
      TransferStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterWhereClause> statusNotEqualTo(
      TransferStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NftTransferQueryFilter
    on QueryBuilder<NftTransfer, NftTransfer, QFilterCondition> {
  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blockNumber',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      blockNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainEqualTo(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainLessThan(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainBetween(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainStartsWith(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainEndsWith(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainContains(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainMatches(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectionId',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      collectionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectionId',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionEqualTo(
    TransferDirection value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionGreaterThan(
    TransferDirection value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionLessThan(
    TransferDirection value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionBetween(
    TransferDirection lower,
    TransferDirection upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      directionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      fromAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasFee',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasFeeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasFee',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasFeeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasFeeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasFeeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasFee',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasFeeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasFeeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gasUsed',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gasUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> gasUsedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      gasUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      memoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> memoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      memoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nftId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nftId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nftId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftId',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nftId',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nftImage',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nftImage',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nftImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nftImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftImageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nftImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nftImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nftName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nftName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> nftNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nftName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nftName',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      nftNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nftName',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusEqualTo(
    TransferStatus value, {
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      statusGreaterThan(
    TransferStatus value, {
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusLessThan(
    TransferStatus value, {
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusBetween(
    TransferStatus lower,
    TransferStatus upper, {
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      toAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      transactionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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

  QueryBuilder<NftTransfer, NftTransfer, QAfterFilterCondition>
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
}

extension NftTransferQueryObject
    on QueryBuilder<NftTransfer, NftTransfer, QFilterCondition> {}

extension NftTransferQueryLinks
    on QueryBuilder<NftTransfer, NftTransfer, QFilterCondition> {}

extension NftTransferQuerySortBy
    on QueryBuilder<NftTransfer, NftTransfer, QSortBy> {
  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy>
      sortByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftId', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftId', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftImage', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftImage', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftName', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByNftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftName', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy>
      sortByTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NftTransferQuerySortThenBy
    on QueryBuilder<NftTransfer, NftTransfer, QSortThenBy> {
  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy>
      thenByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftId', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftId', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftImage', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftImage', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftName', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByNftNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nftName', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy>
      thenByTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionHash', Sort.desc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension NftTransferQueryWhereDistinct
    on QueryBuilder<NftTransfer, NftTransfer, QDistinct> {
  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByBlockNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByCollectionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByDirection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByFromAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByGasFee(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasFee', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByGasUsed(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasUsed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByNftId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nftId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByNftImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nftImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByNftName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nftName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByToAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByTransactionHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NftTransfer, NftTransfer, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension NftTransferQueryProperty
    on QueryBuilder<NftTransfer, NftTransfer, QQueryProperty> {
  QueryBuilder<NftTransfer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NftTransfer, String?, QQueryOperations> blockNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockNumber');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> collectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionId');
    });
  }

  QueryBuilder<NftTransfer, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<NftTransfer, TransferDirection, QQueryOperations>
      directionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direction');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> fromAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromAddress');
    });
  }

  QueryBuilder<NftTransfer, String?, QQueryOperations> gasFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasFee');
    });
  }

  QueryBuilder<NftTransfer, String?, QQueryOperations> gasUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasUsed');
    });
  }

  QueryBuilder<NftTransfer, String?, QQueryOperations> memoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memo');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> nftIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nftId');
    });
  }

  QueryBuilder<NftTransfer, String?, QQueryOperations> nftImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nftImage');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> nftNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nftName');
    });
  }

  QueryBuilder<NftTransfer, TransferStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NftTransfer, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations> toAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toAddress');
    });
  }

  QueryBuilder<NftTransfer, String, QQueryOperations>
      transactionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionHash');
    });
  }

  QueryBuilder<NftTransfer, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenTransfer _$TokenTransferFromJson(Map<String, dynamic> json) =>
    TokenTransfer()
      ..id = (json['id'] as num).toInt()
      ..transactionHash = json['transactionHash'] as String
      ..fromAddress = json['fromAddress'] as String
      ..toAddress = json['toAddress'] as String
      ..tokenSymbol = json['tokenSymbol'] as String
      ..tokenName = json['tokenName'] as String
      ..amount = json['amount'] as String
      ..chain = json['chain'] as String
      ..direction = $enumDecode(_$TransferDirectionEnumMap, json['direction'])
      ..status = $enumDecode(_$TransferStatusEnumMap, json['status'])
      ..gasFee = json['gasFee'] as String?
      ..gasUsed = json['gasUsed'] as String?
      ..blockNumber = json['blockNumber'] as String?
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..memo = json['memo'] as String?
      ..metadata = json['metadata'] as String?
      ..extraData = json['extraData'] as Map<String, dynamic>?;

Map<String, dynamic> _$TokenTransferToJson(TokenTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionHash': instance.transactionHash,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'tokenSymbol': instance.tokenSymbol,
      'tokenName': instance.tokenName,
      'amount': instance.amount,
      'chain': instance.chain,
      'direction': _$TransferDirectionEnumMap[instance.direction]!,
      'status': _$TransferStatusEnumMap[instance.status]!,
      'gasFee': instance.gasFee,
      'gasUsed': instance.gasUsed,
      'blockNumber': instance.blockNumber,
      'timestamp': instance.timestamp.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'memo': instance.memo,
      'metadata': instance.metadata,
      'extraData': instance.extraData,
    };

const _$TransferDirectionEnumMap = {
  TransferDirection.send: 'send',
  TransferDirection.receive: 'receive',
};

const _$TransferStatusEnumMap = {
  TransferStatus.pending: 'pending',
  TransferStatus.confirmed: 'confirmed',
  TransferStatus.failed: 'failed',
  TransferStatus.cancelled: 'cancelled',
};

NftTransfer _$NftTransferFromJson(Map<String, dynamic> json) => NftTransfer()
  ..id = (json['id'] as num).toInt()
  ..transactionHash = json['transactionHash'] as String
  ..fromAddress = json['fromAddress'] as String
  ..toAddress = json['toAddress'] as String
  ..nftId = json['nftId'] as String
  ..collectionId = json['collectionId'] as String
  ..nftName = json['nftName'] as String
  ..nftImage = json['nftImage'] as String?
  ..chain = json['chain'] as String
  ..direction = $enumDecode(_$TransferDirectionEnumMap, json['direction'])
  ..status = $enumDecode(_$TransferStatusEnumMap, json['status'])
  ..gasFee = json['gasFee'] as String?
  ..gasUsed = json['gasUsed'] as String?
  ..blockNumber = json['blockNumber'] as String?
  ..timestamp = DateTime.parse(json['timestamp'] as String)
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..memo = json['memo'] as String?
  ..metadata = json['metadata'] as Map<String, dynamic>?
  ..extraData = json['extraData'] as Map<String, dynamic>?;

Map<String, dynamic> _$NftTransferToJson(NftTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionHash': instance.transactionHash,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'nftId': instance.nftId,
      'collectionId': instance.collectionId,
      'nftName': instance.nftName,
      'nftImage': instance.nftImage,
      'chain': instance.chain,
      'direction': _$TransferDirectionEnumMap[instance.direction]!,
      'status': _$TransferStatusEnumMap[instance.status]!,
      'gasFee': instance.gasFee,
      'gasUsed': instance.gasUsed,
      'blockNumber': instance.blockNumber,
      'timestamp': instance.timestamp.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'memo': instance.memo,
      'metadata': instance.metadata,
      'extraData': instance.extraData,
    };

TransferRequest _$TransferRequestFromJson(Map<String, dynamic> json) =>
    TransferRequest(
      recipientAddress: json['recipientAddress'] as String,
      amount: json['amount'] as String,
      tokenSymbol: json['tokenSymbol'] as String,
      chain: json['chain'] as String,
      memo: json['memo'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TransferRequestToJson(TransferRequest instance) =>
    <String, dynamic>{
      'recipientAddress': instance.recipientAddress,
      'amount': instance.amount,
      'tokenSymbol': instance.tokenSymbol,
      'chain': instance.chain,
      'memo': instance.memo,
      'metadata': instance.metadata,
    };

NftTransferRequest _$NftTransferRequestFromJson(Map<String, dynamic> json) =>
    NftTransferRequest(
      recipientAddress: json['recipientAddress'] as String,
      nftId: json['nftId'] as String,
      collectionId: json['collectionId'] as String,
      chain: json['chain'] as String,
      memo: json['memo'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NftTransferRequestToJson(NftTransferRequest instance) =>
    <String, dynamic>{
      'recipientAddress': instance.recipientAddress,
      'nftId': instance.nftId,
      'collectionId': instance.collectionId,
      'chain': instance.chain,
      'memo': instance.memo,
      'metadata': instance.metadata,
    };

TransferResult _$TransferResultFromJson(Map<String, dynamic> json) =>
    TransferResult(
      success: json['success'] as bool,
      transactionHash: json['transactionHash'] as String?,
      error: json['error'] as String?,
      gasUsed: json['gasUsed'] as String?,
      gasFee: json['gasFee'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TransferResultToJson(TransferResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'transactionHash': instance.transactionHash,
      'error': instance.error,
      'gasUsed': instance.gasUsed,
      'gasFee': instance.gasFee,
      'metadata': instance.metadata,
    };

TransferQrData _$TransferQrDataFromJson(Map<String, dynamic> json) =>
    TransferQrData(
      type: json['type'] as String,
      recipientAddress: json['recipientAddress'] as String?,
      amount: json['amount'] as String?,
      tokenSymbol: json['tokenSymbol'] as String?,
      nftId: json['nftId'] as String?,
      collectionId: json['collectionId'] as String?,
      chain: json['chain'] as String,
      memo: json['memo'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TransferQrDataToJson(TransferQrData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'recipientAddress': instance.recipientAddress,
      'amount': instance.amount,
      'tokenSymbol': instance.tokenSymbol,
      'nftId': instance.nftId,
      'collectionId': instance.collectionId,
      'chain': instance.chain,
      'memo': instance.memo,
      'metadata': instance.metadata,
    };

TransferValidation _$TransferValidationFromJson(Map<String, dynamic> json) =>
    TransferValidation(
      isValid: json['isValid'] as bool,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      estimatedGasFee: json['estimatedGasFee'] as String?,
      estimatedGasUsed: json['estimatedGasUsed'] as String?,
    );

Map<String, dynamic> _$TransferValidationToJson(TransferValidation instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'errors': instance.errors,
      'estimatedGasFee': instance.estimatedGasFee,
      'estimatedGasUsed': instance.estimatedGasUsed,
    };
