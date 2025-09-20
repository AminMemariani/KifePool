// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionHistoryCollection on Isar {
  IsarCollection<TransactionHistory> get transactionHistorys =>
      this.collection();
}

const TransactionHistorySchema = CollectionSchema(
  name: r'TransactionHistory',
  id: 6353014656210365385,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.string,
    ),
    r'blockNumber': PropertySchema(
      id: 1,
      name: r'blockNumber',
      type: IsarType.long,
    ),
    r'blockTimestamp': PropertySchema(
      id: 2,
      name: r'blockTimestamp',
      type: IsarType.dateTime,
    ),
    r'chain': PropertySchema(
      id: 3,
      name: r'chain',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'direction': PropertySchema(
      id: 5,
      name: r'direction',
      type: IsarType.string,
      enumMap: _TransactionHistorydirectionEnumValueMap,
    ),
    r'explorerUrl': PropertySchema(
      id: 6,
      name: r'explorerUrl',
      type: IsarType.string,
    ),
    r'fromAddress': PropertySchema(
      id: 7,
      name: r'fromAddress',
      type: IsarType.string,
    ),
    r'gasFee': PropertySchema(
      id: 8,
      name: r'gasFee',
      type: IsarType.string,
    ),
    r'gasUsed': PropertySchema(
      id: 9,
      name: r'gasUsed',
      type: IsarType.string,
    ),
    r'hash': PropertySchema(
      id: 10,
      name: r'hash',
      type: IsarType.string,
    ),
    r'nonce': PropertySchema(
      id: 11,
      name: r'nonce',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
      enumMap: _TransactionHistorystatusEnumValueMap,
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
    r'tokenSymbol': PropertySchema(
      id: 15,
      name: r'tokenSymbol',
      type: IsarType.string,
    ),
    r'transactionIndex': PropertySchema(
      id: 16,
      name: r'transactionIndex',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 17,
      name: r'type',
      type: IsarType.string,
      enumMap: _TransactionHistorytypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 18,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _transactionHistoryEstimateSize,
  serialize: _transactionHistorySerialize,
  deserialize: _transactionHistoryDeserialize,
  deserializeProp: _transactionHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _transactionHistoryGetId,
  getLinks: _transactionHistoryGetLinks,
  attach: _transactionHistoryAttach,
  version: '3.1.0+1',
);

int _transactionHistoryEstimateSize(
  TransactionHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.amount.length * 3;
  bytesCount += 3 + object.chain.length * 3;
  bytesCount += 3 + object.direction.name.length * 3;
  {
    final value = object.explorerUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fromAddress.length * 3;
  bytesCount += 3 + object.gasFee.length * 3;
  bytesCount += 3 + object.gasUsed.length * 3;
  bytesCount += 3 + object.hash.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.toAddress.length * 3;
  bytesCount += 3 + object.tokenSymbol.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _transactionHistorySerialize(
  TransactionHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.amount);
  writer.writeLong(offsets[1], object.blockNumber);
  writer.writeDateTime(offsets[2], object.blockTimestamp);
  writer.writeString(offsets[3], object.chain);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.direction.name);
  writer.writeString(offsets[6], object.explorerUrl);
  writer.writeString(offsets[7], object.fromAddress);
  writer.writeString(offsets[8], object.gasFee);
  writer.writeString(offsets[9], object.gasUsed);
  writer.writeString(offsets[10], object.hash);
  writer.writeLong(offsets[11], object.nonce);
  writer.writeString(offsets[12], object.status.name);
  writer.writeDateTime(offsets[13], object.timestamp);
  writer.writeString(offsets[14], object.toAddress);
  writer.writeString(offsets[15], object.tokenSymbol);
  writer.writeLong(offsets[16], object.transactionIndex);
  writer.writeString(offsets[17], object.type.name);
  writer.writeDateTime(offsets[18], object.updatedAt);
}

TransactionHistory _transactionHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionHistory();
  object.amount = reader.readString(offsets[0]);
  object.blockNumber = reader.readLong(offsets[1]);
  object.blockTimestamp = reader.readDateTime(offsets[2]);
  object.chain = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.direction = _TransactionHistorydirectionValueEnumMap[
          reader.readStringOrNull(offsets[5])] ??
      TransactionDirection.incoming;
  object.explorerUrl = reader.readStringOrNull(offsets[6]);
  object.fromAddress = reader.readString(offsets[7]);
  object.gasFee = reader.readString(offsets[8]);
  object.gasUsed = reader.readString(offsets[9]);
  object.hash = reader.readString(offsets[10]);
  object.id = id;
  object.nonce = reader.readLong(offsets[11]);
  object.status = _TransactionHistorystatusValueEnumMap[
          reader.readStringOrNull(offsets[12])] ??
      TransactionStatus.pending;
  object.timestamp = reader.readDateTime(offsets[13]);
  object.toAddress = reader.readString(offsets[14]);
  object.tokenSymbol = reader.readString(offsets[15]);
  object.transactionIndex = reader.readLong(offsets[16]);
  object.type = _TransactionHistorytypeValueEnumMap[
          reader.readStringOrNull(offsets[17])] ??
      TransactionType.transfer;
  object.updatedAt = reader.readDateTime(offsets[18]);
  return object;
}

P _transactionHistoryDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (_TransactionHistorydirectionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionDirection.incoming) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (_TransactionHistorystatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionStatus.pending) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (_TransactionHistorytypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionType.transfer) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TransactionHistorydirectionEnumValueMap = {
  r'incoming': r'incoming',
  r'outgoing': r'outgoing',
};
const _TransactionHistorydirectionValueEnumMap = {
  r'incoming': TransactionDirection.incoming,
  r'outgoing': TransactionDirection.outgoing,
};
const _TransactionHistorystatusEnumValueMap = {
  r'pending': r'pending',
  r'confirmed': r'confirmed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _TransactionHistorystatusValueEnumMap = {
  r'pending': TransactionStatus.pending,
  r'confirmed': TransactionStatus.confirmed,
  r'failed': TransactionStatus.failed,
  r'cancelled': TransactionStatus.cancelled,
};
const _TransactionHistorytypeEnumValueMap = {
  r'transfer': r'transfer',
  r'staking': r'staking',
  r'unstaking': r'unstaking',
  r'reward': r'reward',
  r'nftTransfer': r'nftTransfer',
  r'crossChain': r'crossChain',
  r'contractCall': r'contractCall',
  r'other': r'other',
};
const _TransactionHistorytypeValueEnumMap = {
  r'transfer': TransactionType.transfer,
  r'staking': TransactionType.staking,
  r'unstaking': TransactionType.unstaking,
  r'reward': TransactionType.reward,
  r'nftTransfer': TransactionType.nftTransfer,
  r'crossChain': TransactionType.crossChain,
  r'contractCall': TransactionType.contractCall,
  r'other': TransactionType.other,
};

Id _transactionHistoryGetId(TransactionHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionHistoryGetLinks(
    TransactionHistory object) {
  return [];
}

void _transactionHistoryAttach(
    IsarCollection<dynamic> col, Id id, TransactionHistory object) {
  object.id = id;
}

extension TransactionHistoryQueryWhereSort
    on QueryBuilder<TransactionHistory, TransactionHistory, QWhere> {
  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionHistoryQueryWhere
    on QueryBuilder<TransactionHistory, TransactionHistory, QWhereClause> {
  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhereClause>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterWhereClause>
      idBetween(
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

extension TransactionHistoryQueryFilter
    on QueryBuilder<TransactionHistory, TransactionHistory, QFilterCondition> {
  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      amountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      amountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockTimestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockTimestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      blockTimestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      chainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      chainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      chainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      chainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chain',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionEqualTo(
    TransactionDirection value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionGreaterThan(
    TransactionDirection value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionLessThan(
    TransactionDirection value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionBetween(
    TransactionDirection lower,
    TransactionDirection upper, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      directionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explorerUrl',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explorerUrl',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explorerUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explorerUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explorerUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      explorerUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explorerUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      fromAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      fromAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      fromAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      fromAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeEqualTo(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeGreaterThan(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeLessThan(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasFee',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasFeeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasFee',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedEqualTo(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedGreaterThan(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedLessThan(
    String value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gasUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gasUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      gasUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gasUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hash',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      hashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hash',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      nonceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nonce',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      nonceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nonce',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      nonceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nonce',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      nonceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nonce',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusEqualTo(
    TransactionStatus value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusGreaterThan(
    TransactionStatus value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusLessThan(
    TransactionStatus value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusBetween(
    TransactionStatus lower,
    TransactionStatus upper, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      toAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      toAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      toAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      toAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      tokenSymbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      tokenSymbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenSymbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      tokenSymbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      tokenSymbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      transactionIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      transactionIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      transactionIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      transactionIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeEqualTo(
    TransactionType value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeGreaterThan(
    TransactionType value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeLessThan(
    TransactionType value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeBetween(
    TransactionType lower,
    TransactionType upper, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

extension TransactionHistoryQueryObject
    on QueryBuilder<TransactionHistory, TransactionHistory, QFilterCondition> {}

extension TransactionHistoryQueryLinks
    on QueryBuilder<TransactionHistory, TransactionHistory, QFilterCondition> {}

extension TransactionHistoryQuerySortBy
    on QueryBuilder<TransactionHistory, TransactionHistory, QSortBy> {
  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByBlockTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockTimestamp', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByBlockTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockTimestamp', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByExplorerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerUrl', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByExplorerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerUrl', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonce', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByNonceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonce', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTokenSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTokenSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTransactionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionIndex', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTransactionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionIndex', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TransactionHistoryQuerySortThenBy
    on QueryBuilder<TransactionHistory, TransactionHistory, QSortThenBy> {
  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByBlockNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockNumber', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByBlockTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockTimestamp', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByBlockTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockTimestamp', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chain', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByExplorerUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerUrl', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByExplorerUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerUrl', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByFromAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByFromAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromAddress', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByGasFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByGasFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasFee', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByGasUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByGasUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gasUsed', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hash', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonce', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByNonceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonce', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByToAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByToAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toAddress', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTokenSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTokenSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenSymbol', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTransactionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionIndex', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTransactionIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionIndex', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TransactionHistoryQueryWhereDistinct
    on QueryBuilder<TransactionHistory, TransactionHistory, QDistinct> {
  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByAmount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByBlockNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockNumber');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByBlockTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockTimestamp');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByChain({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByDirection({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByExplorerUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explorerUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByFromAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByGasFee({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasFee', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByGasUsed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gasUsed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByNonce() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nonce');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByToAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByTokenSymbol({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenSymbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByTransactionIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionIndex');
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionHistory, TransactionHistory, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TransactionHistoryQueryProperty
    on QueryBuilder<TransactionHistory, TransactionHistory, QQueryProperty> {
  QueryBuilder<TransactionHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<TransactionHistory, int, QQueryOperations>
      blockNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockNumber');
    });
  }

  QueryBuilder<TransactionHistory, DateTime, QQueryOperations>
      blockTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockTimestamp');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }

  QueryBuilder<TransactionHistory, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TransactionHistory, TransactionDirection, QQueryOperations>
      directionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direction');
    });
  }

  QueryBuilder<TransactionHistory, String?, QQueryOperations>
      explorerUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explorerUrl');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations>
      fromAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromAddress');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations> gasFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasFee');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations> gasUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gasUsed');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations> hashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hash');
    });
  }

  QueryBuilder<TransactionHistory, int, QQueryOperations> nonceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nonce');
    });
  }

  QueryBuilder<TransactionHistory, TransactionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TransactionHistory, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations>
      toAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toAddress');
    });
  }

  QueryBuilder<TransactionHistory, String, QQueryOperations>
      tokenSymbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenSymbol');
    });
  }

  QueryBuilder<TransactionHistory, int, QQueryOperations>
      transactionIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionIndex');
    });
  }

  QueryBuilder<TransactionHistory, TransactionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<TransactionHistory, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) =>
    TransactionHistory()
      ..id = (json['id'] as num).toInt()
      ..hash = json['hash'] as String
      ..blockNumber = (json['blockNumber'] as num).toInt()
      ..chain = json['chain'] as String
      ..type = $enumDecode(_$TransactionTypeEnumMap, json['type'])
      ..status = $enumDecode(_$TransactionStatusEnumMap, json['status'])
      ..direction =
          $enumDecode(_$TransactionDirectionEnumMap, json['direction'])
      ..fromAddress = json['fromAddress'] as String
      ..toAddress = json['toAddress'] as String
      ..amount = json['amount'] as String
      ..tokenSymbol = json['tokenSymbol'] as String
      ..gasFee = json['gasFee'] as String
      ..gasUsed = json['gasUsed'] as String
      ..timestamp = DateTime.parse(json['timestamp'] as String)
      ..blockTimestamp = DateTime.parse(json['blockTimestamp'] as String)
      ..transactionIndex = (json['transactionIndex'] as num).toInt()
      ..nonce = (json['nonce'] as num).toInt()
      ..metadata = json['metadata'] as Map<String, dynamic>?
      ..explorerUrl = json['explorerUrl'] as String?
      ..createdAt = DateTime.parse(json['createdAt'] as String)
      ..updatedAt = DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic> _$TransactionHistoryToJson(TransactionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hash': instance.hash,
      'blockNumber': instance.blockNumber,
      'chain': instance.chain,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'direction': _$TransactionDirectionEnumMap[instance.direction]!,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'amount': instance.amount,
      'tokenSymbol': instance.tokenSymbol,
      'gasFee': instance.gasFee,
      'gasUsed': instance.gasUsed,
      'timestamp': instance.timestamp.toIso8601String(),
      'blockTimestamp': instance.blockTimestamp.toIso8601String(),
      'transactionIndex': instance.transactionIndex,
      'nonce': instance.nonce,
      'metadata': instance.metadata,
      'explorerUrl': instance.explorerUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.transfer: 'transfer',
  TransactionType.staking: 'staking',
  TransactionType.unstaking: 'unstaking',
  TransactionType.reward: 'reward',
  TransactionType.nftTransfer: 'nft_transfer',
  TransactionType.crossChain: 'cross_chain',
  TransactionType.contractCall: 'contract_call',
  TransactionType.other: 'other',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.confirmed: 'confirmed',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
};

const _$TransactionDirectionEnumMap = {
  TransactionDirection.incoming: 'incoming',
  TransactionDirection.outgoing: 'outgoing',
};

TransactionFilter _$TransactionFilterFromJson(Map<String, dynamic> json) =>
    TransactionFilter(
      chain: json['chain'] as String?,
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']),
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']),
      direction:
          $enumDecodeNullable(_$TransactionDirectionEnumMap, json['direction']),
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      address: json['address'] as String?,
      searchQuery: json['searchQuery'] as String?,
      limit: (json['limit'] as num?)?.toInt() ?? 50,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TransactionFilterToJson(TransactionFilter instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'type': _$TransactionTypeEnumMap[instance.type],
      'status': _$TransactionStatusEnumMap[instance.status],
      'direction': _$TransactionDirectionEnumMap[instance.direction],
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'address': instance.address,
      'searchQuery': instance.searchQuery,
      'limit': instance.limit,
      'offset': instance.offset,
    };

TransactionHistoryResult _$TransactionHistoryResultFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryResult(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      hasMore: json['hasMore'] as bool,
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$TransactionHistoryResultToJson(
        TransactionHistoryResult instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'totalCount': instance.totalCount,
      'hasMore': instance.hasMore,
      'nextCursor': instance.nextCursor,
    };

ChainInfo _$ChainInfoFromJson(Map<String, dynamic> json) => ChainInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      explorerUrl: json['explorerUrl'] as String,
      logoUrl: json['logoUrl'] as String,
      isTestnet: json['isTestnet'] as bool? ?? false,
    );

Map<String, dynamic> _$ChainInfoToJson(ChainInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'explorerUrl': instance.explorerUrl,
      'logoUrl': instance.logoUrl,
      'isTestnet': instance.isTestnet,
    };

TransactionStats _$TransactionStatsFromJson(Map<String, dynamic> json) =>
    TransactionStats(
      totalTransactions: (json['totalTransactions'] as num).toInt(),
      pendingTransactions: (json['pendingTransactions'] as num).toInt(),
      confirmedTransactions: (json['confirmedTransactions'] as num).toInt(),
      failedTransactions: (json['failedTransactions'] as num).toInt(),
      transactionsByChain:
          Map<String, int>.from(json['transactionsByChain'] as Map),
      transactionsByType:
          Map<String, int>.from(json['transactionsByType'] as Map),
      totalVolume: json['totalVolume'] as String,
      totalFees: json['totalFees'] as String,
    );

Map<String, dynamic> _$TransactionStatsToJson(TransactionStats instance) =>
    <String, dynamic>{
      'totalTransactions': instance.totalTransactions,
      'pendingTransactions': instance.pendingTransactions,
      'confirmedTransactions': instance.confirmedTransactions,
      'failedTransactions': instance.failedTransactions,
      'transactionsByChain': instance.transactionsByChain,
      'transactionsByType': instance.transactionsByType,
      'totalVolume': instance.totalVolume,
      'totalFees': instance.totalFees,
    };
