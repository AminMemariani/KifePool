// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xcm_transfer_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetXcmTransferCollection on Isar {
  IsarCollection<XcmTransfer> get xcmTransfers => this.collection();
}

const XcmTransferSchema = CollectionSchema(
  name: r'XcmTransfer',
  id: 2963886405334006986,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.string,
    ),
    r'assetSymbol': PropertySchema(
      id: 1,
      name: r'assetSymbol',
      type: IsarType.string,
    ),
    r'confirmationTimestamp': PropertySchema(
      id: 2,
      name: r'confirmationTimestamp',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'destinationAddress': PropertySchema(
      id: 4,
      name: r'destinationAddress',
      type: IsarType.string,
    ),
    r'destinationChain': PropertySchema(
      id: 5,
      name: r'destinationChain',
      type: IsarType.string,
    ),
    r'destinationTransactionHash': PropertySchema(
      id: 6,
      name: r'destinationTransactionHash',
      type: IsarType.string,
    ),
    r'direction': PropertySchema(
      id: 7,
      name: r'direction',
      type: IsarType.string,
      enumMap: _XcmTransferdirectionEnumValueMap,
    ),
    r'errorMessage': PropertySchema(
      id: 8,
      name: r'errorMessage',
      type: IsarType.string,
    ),
    r'sourceAddress': PropertySchema(
      id: 9,
      name: r'sourceAddress',
      type: IsarType.string,
    ),
    r'sourceChain': PropertySchema(
      id: 10,
      name: r'sourceChain',
      type: IsarType.string,
    ),
    r'sourceTransactionHash': PropertySchema(
      id: 11,
      name: r'sourceTransactionHash',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
      enumMap: _XcmTransferstatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 13,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'transferFee': PropertySchema(
      id: 14,
      name: r'transferFee',
      type: IsarType.string,
    ),
    r'transferId': PropertySchema(
      id: 15,
      name: r'transferId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 16,
      name: r'type',
      type: IsarType.string,
      enumMap: _XcmTransfertypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'xcmFee': PropertySchema(
      id: 18,
      name: r'xcmFee',
      type: IsarType.string,
    ),
    r'xcmMessageHash': PropertySchema(
      id: 19,
      name: r'xcmMessageHash',
      type: IsarType.string,
    )
  },
  estimateSize: _xcmTransferEstimateSize,
  serialize: _xcmTransferSerialize,
  deserialize: _xcmTransferDeserialize,
  deserializeProp: _xcmTransferDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _xcmTransferGetId,
  getLinks: _xcmTransferGetLinks,
  attach: _xcmTransferAttach,
  version: '3.1.0+1',
);

int _xcmTransferEstimateSize(
  XcmTransfer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.amount.length * 3;
  bytesCount += 3 + object.assetSymbol.length * 3;
  bytesCount += 3 + object.destinationAddress.length * 3;
  bytesCount += 3 + object.destinationChain.length * 3;
  {
    final value = object.destinationTransactionHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.direction.name.length * 3;
  {
    final value = object.errorMessage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sourceAddress.length * 3;
  bytesCount += 3 + object.sourceChain.length * 3;
  {
    final value = object.sourceTransactionHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.transferFee.length * 3;
  bytesCount += 3 + object.transferId.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  bytesCount += 3 + object.xcmFee.length * 3;
  {
    final value = object.xcmMessageHash;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _xcmTransferSerialize(
  XcmTransfer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.amount);
  writer.writeString(offsets[1], object.assetSymbol);
  writer.writeDateTime(offsets[2], object.confirmationTimestamp);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.destinationAddress);
  writer.writeString(offsets[5], object.destinationChain);
  writer.writeString(offsets[6], object.destinationTransactionHash);
  writer.writeString(offsets[7], object.direction.name);
  writer.writeString(offsets[8], object.errorMessage);
  writer.writeString(offsets[9], object.sourceAddress);
  writer.writeString(offsets[10], object.sourceChain);
  writer.writeString(offsets[11], object.sourceTransactionHash);
  writer.writeString(offsets[12], object.status.name);
  writer.writeDateTime(offsets[13], object.timestamp);
  writer.writeString(offsets[14], object.transferFee);
  writer.writeString(offsets[15], object.transferId);
  writer.writeString(offsets[16], object.type.name);
  writer.writeDateTime(offsets[17], object.updatedAt);
  writer.writeString(offsets[18], object.xcmFee);
  writer.writeString(offsets[19], object.xcmMessageHash);
}

XcmTransfer _xcmTransferDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = XcmTransfer();
  object.amount = reader.readString(offsets[0]);
  object.assetSymbol = reader.readString(offsets[1]);
  object.confirmationTimestamp = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.destinationAddress = reader.readString(offsets[4]);
  object.destinationChain = reader.readString(offsets[5]);
  object.destinationTransactionHash = reader.readStringOrNull(offsets[6]);
  object.direction =
      _XcmTransferdirectionValueEnumMap[reader.readStringOrNull(offsets[7])] ??
          XcmTransferDirection.outbound;
  object.errorMessage = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.sourceAddress = reader.readString(offsets[9]);
  object.sourceChain = reader.readString(offsets[10]);
  object.sourceTransactionHash = reader.readStringOrNull(offsets[11]);
  object.status =
      _XcmTransferstatusValueEnumMap[reader.readStringOrNull(offsets[12])] ??
          XcmTransferStatus.initiated;
  object.timestamp = reader.readDateTime(offsets[13]);
  object.transferFee = reader.readString(offsets[14]);
  object.transferId = reader.readString(offsets[15]);
  object.type =
      _XcmTransfertypeValueEnumMap[reader.readStringOrNull(offsets[16])] ??
          XcmTransferType.token;
  object.updatedAt = reader.readDateTime(offsets[17]);
  object.xcmFee = reader.readString(offsets[18]);
  object.xcmMessageHash = reader.readStringOrNull(offsets[19]);
  return object;
}

P _xcmTransferDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_XcmTransferdirectionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          XcmTransferDirection.outbound) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (_XcmTransferstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          XcmTransferStatus.initiated) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (_XcmTransfertypeValueEnumMap[reader.readStringOrNull(offset)] ??
          XcmTransferType.token) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _XcmTransferdirectionEnumValueMap = {
  r'outbound': r'outbound',
  r'inbound': r'inbound',
};
const _XcmTransferdirectionValueEnumMap = {
  r'outbound': XcmTransferDirection.outbound,
  r'inbound': XcmTransferDirection.inbound,
};
const _XcmTransferstatusEnumValueMap = {
  r'initiated': r'initiated',
  r'processing': r'processing',
  r'confirmed': r'confirmed',
  r'failed': r'failed',
  r'cancelled': r'cancelled',
};
const _XcmTransferstatusValueEnumMap = {
  r'initiated': XcmTransferStatus.initiated,
  r'processing': XcmTransferStatus.processing,
  r'confirmed': XcmTransferStatus.confirmed,
  r'failed': XcmTransferStatus.failed,
  r'cancelled': XcmTransferStatus.cancelled,
};
const _XcmTransfertypeEnumValueMap = {
  r'token': r'token',
  r'nft': r'nft',
};
const _XcmTransfertypeValueEnumMap = {
  r'token': XcmTransferType.token,
  r'nft': XcmTransferType.nft,
};

Id _xcmTransferGetId(XcmTransfer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _xcmTransferGetLinks(XcmTransfer object) {
  return [];
}

void _xcmTransferAttach(
    IsarCollection<dynamic> col, Id id, XcmTransfer object) {
  object.id = id;
}

extension XcmTransferQueryWhereSort
    on QueryBuilder<XcmTransfer, XcmTransfer, QWhere> {
  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension XcmTransferQueryWhere
    on QueryBuilder<XcmTransfer, XcmTransfer, QWhereClause> {
  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterWhereClause> idBetween(
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

extension XcmTransferQueryFilter
    on QueryBuilder<XcmTransfer, XcmTransfer, QFilterCondition> {
  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountEqualTo(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountLessThan(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountBetween(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountEndsWith(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> amountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'amount',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetSymbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetSymbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetSymbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      assetSymbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetSymbol',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'confirmationTimestamp',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'confirmationTimestamp',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confirmationTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confirmationTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confirmationTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      confirmationTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confirmationTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinationAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinationAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinationAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationChain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinationChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinationChain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationChain',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationChainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinationChain',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationTransactionHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationTransactionHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationTransactionHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinationTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinationTransactionHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationTransactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      destinationTransactionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinationTransactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionEqualTo(
    XcmTransferDirection value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionGreaterThan(
    XcmTransferDirection value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionLessThan(
    XcmTransferDirection value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionBetween(
    XcmTransferDirection lower,
    XcmTransferDirection upper, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      directionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direction',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'errorMessage',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'errorMessage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'errorMessage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'errorMessage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      errorMessageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'errorMessage',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceChain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceChain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceChain',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceChainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceChain',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceTransactionHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceTransactionHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceTransactionHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceTransactionHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceTransactionHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceTransactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      sourceTransactionHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceTransactionHash',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusEqualTo(
    XcmTransferStatus value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      statusGreaterThan(
    XcmTransferStatus value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusLessThan(
    XcmTransferStatus value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusBetween(
    XcmTransferStatus lower,
    XcmTransferStatus upper, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusContains(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transferFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transferFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transferFee',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferFee',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferFeeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transferFee',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transferId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transferId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transferId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transferId',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      transferIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transferId',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeEqualTo(
    XcmTransferType value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeGreaterThan(
    XcmTransferType value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeLessThan(
    XcmTransferType value, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeBetween(
    XcmTransferType lower,
    XcmTransferType upper, {
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
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

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmFeeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xcmFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmFeeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'xcmFee',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition> xcmFeeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'xcmFee',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmFeeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xcmFee',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmFeeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'xcmFee',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xcmMessageHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xcmMessageHash',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xcmMessageHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'xcmMessageHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'xcmMessageHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xcmMessageHash',
        value: '',
      ));
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterFilterCondition>
      xcmMessageHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'xcmMessageHash',
        value: '',
      ));
    });
  }
}

extension XcmTransferQueryObject
    on QueryBuilder<XcmTransfer, XcmTransfer, QFilterCondition> {}

extension XcmTransferQueryLinks
    on QueryBuilder<XcmTransfer, XcmTransfer, QFilterCondition> {}

extension XcmTransferQuerySortBy
    on QueryBuilder<XcmTransfer, XcmTransfer, QSortBy> {
  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByAssetSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetSymbol', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByAssetSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetSymbol', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByConfirmationTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmationTimestamp', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByConfirmationTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmationTimestamp', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationAddress', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationAddress', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationChain', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationChain', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationTransactionHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByDestinationTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationTransactionHash', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortBySourceAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceAddress', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortBySourceAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceAddress', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortBySourceChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceChain', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortBySourceChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceChain', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortBySourceTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTransactionHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortBySourceTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTransactionHash', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTransferFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferFee', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTransferFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferFee', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTransferId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferId', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTransferIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferId', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByXcmFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmFee', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByXcmFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmFee', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> sortByXcmMessageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmMessageHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      sortByXcmMessageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmMessageHash', Sort.desc);
    });
  }
}

extension XcmTransferQuerySortThenBy
    on QueryBuilder<XcmTransfer, XcmTransfer, QSortThenBy> {
  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByAssetSymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetSymbol', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByAssetSymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetSymbol', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByConfirmationTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmationTimestamp', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByConfirmationTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confirmationTimestamp', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationAddress', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationAddress', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationChain', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationChain', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationTransactionHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByDestinationTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationTransactionHash', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByDirection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByDirectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direction', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByErrorMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByErrorMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorMessage', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenBySourceAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceAddress', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenBySourceAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceAddress', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenBySourceChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceChain', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenBySourceChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceChain', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenBySourceTransactionHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTransactionHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenBySourceTransactionHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceTransactionHash', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTransferFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferFee', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTransferFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferFee', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTransferId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferId', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTransferIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transferId', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByXcmFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmFee', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByXcmFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmFee', Sort.desc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy> thenByXcmMessageHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmMessageHash', Sort.asc);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QAfterSortBy>
      thenByXcmMessageHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xcmMessageHash', Sort.desc);
    });
  }
}

extension XcmTransferQueryWhereDistinct
    on QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> {
  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByAssetSymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetSymbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct>
      distinctByConfirmationTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confirmationTimestamp');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct>
      distinctByDestinationAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByDestinationChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationChain',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct>
      distinctByDestinationTransactionHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationTransactionHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByDirection(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByErrorMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorMessage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctBySourceAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctBySourceChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceChain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct>
      distinctBySourceTransactionHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceTransactionHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByTransferFee(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transferFee', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByTransferId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transferId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByXcmFee(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xcmFee', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<XcmTransfer, XcmTransfer, QDistinct> distinctByXcmMessageHash(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xcmMessageHash',
          caseSensitive: caseSensitive);
    });
  }
}

extension XcmTransferQueryProperty
    on QueryBuilder<XcmTransfer, XcmTransfer, QQueryProperty> {
  QueryBuilder<XcmTransfer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> assetSymbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetSymbol');
    });
  }

  QueryBuilder<XcmTransfer, DateTime?, QQueryOperations>
      confirmationTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confirmationTimestamp');
    });
  }

  QueryBuilder<XcmTransfer, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations>
      destinationAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationAddress');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations>
      destinationChainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationChain');
    });
  }

  QueryBuilder<XcmTransfer, String?, QQueryOperations>
      destinationTransactionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationTransactionHash');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransferDirection, QQueryOperations>
      directionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direction');
    });
  }

  QueryBuilder<XcmTransfer, String?, QQueryOperations> errorMessageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorMessage');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> sourceAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceAddress');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> sourceChainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceChain');
    });
  }

  QueryBuilder<XcmTransfer, String?, QQueryOperations>
      sourceTransactionHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceTransactionHash');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransferStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<XcmTransfer, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> transferFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transferFee');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> transferIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transferId');
    });
  }

  QueryBuilder<XcmTransfer, XcmTransferType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<XcmTransfer, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<XcmTransfer, String, QQueryOperations> xcmFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xcmFee');
    });
  }

  QueryBuilder<XcmTransfer, String?, QQueryOperations>
      xcmMessageHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xcmMessageHash');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XcmTransfer _$XcmTransferFromJson(Map<String, dynamic> json) => XcmTransfer()
  ..id = (json['id'] as num).toInt()
  ..transferId = json['transferId'] as String
  ..sourceChain = json['sourceChain'] as String
  ..destinationChain = json['destinationChain'] as String
  ..type = $enumDecode(_$XcmTransferTypeEnumMap, json['type'])
  ..status = $enumDecode(_$XcmTransferStatusEnumMap, json['status'])
  ..direction = $enumDecode(_$XcmTransferDirectionEnumMap, json['direction'])
  ..sourceAddress = json['sourceAddress'] as String
  ..destinationAddress = json['destinationAddress'] as String
  ..assetSymbol = json['assetSymbol'] as String
  ..amount = json['amount'] as String
  ..xcmMessageHash = json['xcmMessageHash'] as String?
  ..sourceTransactionHash = json['sourceTransactionHash'] as String?
  ..destinationTransactionHash = json['destinationTransactionHash'] as String?
  ..transferFee = json['transferFee'] as String
  ..xcmFee = json['xcmFee'] as String
  ..timestamp = DateTime.parse(json['timestamp'] as String)
  ..confirmationTimestamp = json['confirmationTimestamp'] == null
      ? null
      : DateTime.parse(json['confirmationTimestamp'] as String)
  ..errorMessage = json['errorMessage'] as String?
  ..metadata = json['metadata'] as Map<String, dynamic>?
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..updatedAt = DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic> _$XcmTransferToJson(XcmTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transferId': instance.transferId,
      'sourceChain': instance.sourceChain,
      'destinationChain': instance.destinationChain,
      'type': _$XcmTransferTypeEnumMap[instance.type]!,
      'status': _$XcmTransferStatusEnumMap[instance.status]!,
      'direction': _$XcmTransferDirectionEnumMap[instance.direction]!,
      'sourceAddress': instance.sourceAddress,
      'destinationAddress': instance.destinationAddress,
      'assetSymbol': instance.assetSymbol,
      'amount': instance.amount,
      'xcmMessageHash': instance.xcmMessageHash,
      'sourceTransactionHash': instance.sourceTransactionHash,
      'destinationTransactionHash': instance.destinationTransactionHash,
      'transferFee': instance.transferFee,
      'xcmFee': instance.xcmFee,
      'timestamp': instance.timestamp.toIso8601String(),
      'confirmationTimestamp':
          instance.confirmationTimestamp?.toIso8601String(),
      'errorMessage': instance.errorMessage,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$XcmTransferTypeEnumMap = {
  XcmTransferType.token: 'token',
  XcmTransferType.nft: 'nft',
};

const _$XcmTransferStatusEnumMap = {
  XcmTransferStatus.initiated: 'initiated',
  XcmTransferStatus.processing: 'processing',
  XcmTransferStatus.confirmed: 'confirmed',
  XcmTransferStatus.failed: 'failed',
  XcmTransferStatus.cancelled: 'cancelled',
};

const _$XcmTransferDirectionEnumMap = {
  XcmTransferDirection.outbound: 'outbound',
  XcmTransferDirection.inbound: 'inbound',
};

XcmTransferRequest _$XcmTransferRequestFromJson(Map<String, dynamic> json) =>
    XcmTransferRequest(
      sourceChain: json['sourceChain'] as String,
      destinationChain: json['destinationChain'] as String,
      type: $enumDecode(_$XcmTransferTypeEnumMap, json['type']),
      sourceAddress: json['sourceAddress'] as String,
      destinationAddress: json['destinationAddress'] as String,
      assetSymbol: json['assetSymbol'] as String,
      amount: json['amount'] as String,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$XcmTransferRequestToJson(XcmTransferRequest instance) =>
    <String, dynamic>{
      'sourceChain': instance.sourceChain,
      'destinationChain': instance.destinationChain,
      'type': _$XcmTransferTypeEnumMap[instance.type]!,
      'sourceAddress': instance.sourceAddress,
      'destinationAddress': instance.destinationAddress,
      'assetSymbol': instance.assetSymbol,
      'amount': instance.amount,
      'memo': instance.memo,
    };

XcmTransferResult _$XcmTransferResultFromJson(Map<String, dynamic> json) =>
    XcmTransferResult(
      success: json['success'] as bool,
      transferId: json['transferId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      status: $enumDecode(_$XcmTransferStatusEnumMap, json['status']),
      sourceTransactionHash: json['sourceTransactionHash'] as String?,
      xcmMessageHash: json['xcmMessageHash'] as String?,
    );

Map<String, dynamic> _$XcmTransferResultToJson(XcmTransferResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'transferId': instance.transferId,
      'errorMessage': instance.errorMessage,
      'status': _$XcmTransferStatusEnumMap[instance.status]!,
      'sourceTransactionHash': instance.sourceTransactionHash,
      'xcmMessageHash': instance.xcmMessageHash,
    };

XcmTransferProgress _$XcmTransferProgressFromJson(Map<String, dynamic> json) =>
    XcmTransferProgress(
      transferId: json['transferId'] as String,
      status: $enumDecode(_$XcmTransferStatusEnumMap, json['status']),
      currentStep: (json['currentStep'] as num).toInt(),
      totalSteps: (json['totalSteps'] as num).toInt(),
      currentStepDescription: json['currentStepDescription'] as String,
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$XcmTransferProgressToJson(
        XcmTransferProgress instance) =>
    <String, dynamic>{
      'transferId': instance.transferId,
      'status': _$XcmTransferStatusEnumMap[instance.status]!,
      'currentStep': instance.currentStep,
      'totalSteps': instance.totalSteps,
      'currentStepDescription': instance.currentStepDescription,
      'progressPercentage': instance.progressPercentage,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'errorMessage': instance.errorMessage,
    };

XcmChainInfo _$XcmChainInfoFromJson(Map<String, dynamic> json) => XcmChainInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      rpcUrl: json['rpcUrl'] as String,
      explorerUrl: json['explorerUrl'] as String,
      isRelayChain: json['isRelayChain'] as bool,
      supportedAssets: (json['supportedAssets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      assetSymbols: Map<String, String>.from(json['assetSymbols'] as Map),
    );

Map<String, dynamic> _$XcmChainInfoToJson(XcmChainInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'rpcUrl': instance.rpcUrl,
      'explorerUrl': instance.explorerUrl,
      'isRelayChain': instance.isRelayChain,
      'supportedAssets': instance.supportedAssets,
      'assetSymbols': instance.assetSymbols,
    };

XcmAssetInfo _$XcmAssetInfoFromJson(Map<String, dynamic> json) => XcmAssetInfo(
      symbol: json['symbol'] as String,
      assetId: json['assetId'] as String,
      chain: json['chain'] as String,
      decimals: json['decimals'] as String,
      balance: json['balance'] as String,
      isNative: json['isNative'] as bool,
      contractAddress: json['contractAddress'] as String?,
    );

Map<String, dynamic> _$XcmAssetInfoToJson(XcmAssetInfo instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'assetId': instance.assetId,
      'chain': instance.chain,
      'decimals': instance.decimals,
      'balance': instance.balance,
      'isNative': instance.isNative,
      'contractAddress': instance.contractAddress,
    };

XcmTransferValidation _$XcmTransferValidationFromJson(
        Map<String, dynamic> json) =>
    XcmTransferValidation(
      isValid: json['isValid'] as bool,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
      estimatedFee: json['estimatedFee'] as String?,
      estimatedTime: json['estimatedTime'] as String?,
      isSupported: json['isSupported'] as bool,
    );

Map<String, dynamic> _$XcmTransferValidationToJson(
        XcmTransferValidation instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'errors': instance.errors,
      'estimatedFee': instance.estimatedFee,
      'estimatedTime': instance.estimatedTime,
      'isSupported': instance.isSupported,
    };

XcmTransferStats _$XcmTransferStatsFromJson(Map<String, dynamic> json) =>
    XcmTransferStats(
      totalTransfers: (json['totalTransfers'] as num).toInt(),
      successfulTransfers: (json['successfulTransfers'] as num).toInt(),
      failedTransfers: (json['failedTransfers'] as num).toInt(),
      pendingTransfers: (json['pendingTransfers'] as num).toInt(),
      transfersByChain: Map<String, int>.from(json['transfersByChain'] as Map),
      transfersByType: Map<String, int>.from(json['transfersByType'] as Map),
      totalVolume: json['totalVolume'] as String,
      totalFees: json['totalFees'] as String,
    );

Map<String, dynamic> _$XcmTransferStatsToJson(XcmTransferStats instance) =>
    <String, dynamic>{
      'totalTransfers': instance.totalTransfers,
      'successfulTransfers': instance.successfulTransfers,
      'failedTransfers': instance.failedTransfers,
      'pendingTransfers': instance.pendingTransfers,
      'transfersByChain': instance.transfersByChain,
      'transfersByType': instance.transfersByType,
      'totalVolume': instance.totalVolume,
      'totalFees': instance.totalFees,
    };
