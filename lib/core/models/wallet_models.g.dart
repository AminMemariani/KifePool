// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWalletAccountCollection on Isar {
  IsarCollection<WalletAccount> get walletAccounts => this.collection();
}

const WalletAccountSchema = CollectionSchema(
  name: r'WalletAccount',
  id: 6641094979212723216,
  properties: {
    r'accountIndex': PropertySchema(
      id: 0,
      name: r'accountIndex',
      type: IsarType.long,
    ),
    r'address': PropertySchema(
      id: 1,
      name: r'address',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'derivationPath': PropertySchema(
      id: 3,
      name: r'derivationPath',
      type: IsarType.string,
    ),
    r'encryptedPrivateKey': PropertySchema(
      id: 4,
      name: r'encryptedPrivateKey',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'lastUsed': PropertySchema(
      id: 6,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'mnemonicId': PropertySchema(
      id: 7,
      name: r'mnemonicId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'publicKey': PropertySchema(
      id: 9,
      name: r'publicKey',
      type: IsarType.string,
    ),
    r'walletType': PropertySchema(
      id: 10,
      name: r'walletType',
      type: IsarType.string,
    )
  },
  estimateSize: _walletAccountEstimateSize,
  serialize: _walletAccountSerialize,
  deserialize: _walletAccountDeserialize,
  deserializeProp: _walletAccountDeserializeProp,
  idName: r'id',
  indexes: {
    r'address': IndexSchema(
      id: -259407546592846288,
      name: r'address',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'address',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _walletAccountGetId,
  getLinks: _walletAccountGetLinks,
  attach: _walletAccountAttach,
  version: '3.1.0+1',
);

int _walletAccountEstimateSize(
  WalletAccount object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.derivationPath.length * 3;
  bytesCount += 3 + object.encryptedPrivateKey.length * 3;
  {
    final value = object.mnemonicId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.publicKey.length * 3;
  bytesCount += 3 + object.walletType.length * 3;
  return bytesCount;
}

void _walletAccountSerialize(
  WalletAccount object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accountIndex);
  writer.writeString(offsets[1], object.address);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.derivationPath);
  writer.writeString(offsets[4], object.encryptedPrivateKey);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeDateTime(offsets[6], object.lastUsed);
  writer.writeString(offsets[7], object.mnemonicId);
  writer.writeString(offsets[8], object.name);
  writer.writeString(offsets[9], object.publicKey);
  writer.writeString(offsets[10], object.walletType);
}

WalletAccount _walletAccountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WalletAccount();
  object.accountIndex = reader.readLong(offsets[0]);
  object.address = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.derivationPath = reader.readString(offsets[3]);
  object.encryptedPrivateKey = reader.readString(offsets[4]);
  object.id = id;
  object.isActive = reader.readBool(offsets[5]);
  object.lastUsed = reader.readDateTime(offsets[6]);
  object.mnemonicId = reader.readStringOrNull(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.publicKey = reader.readString(offsets[9]);
  object.walletType = reader.readString(offsets[10]);
  return object;
}

P _walletAccountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _walletAccountGetId(WalletAccount object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _walletAccountGetLinks(WalletAccount object) {
  return [];
}

void _walletAccountAttach(
    IsarCollection<dynamic> col, Id id, WalletAccount object) {
  object.id = id;
}

extension WalletAccountByIndex on IsarCollection<WalletAccount> {
  Future<WalletAccount?> getByAddress(String address) {
    return getByIndex(r'address', [address]);
  }

  WalletAccount? getByAddressSync(String address) {
    return getByIndexSync(r'address', [address]);
  }

  Future<bool> deleteByAddress(String address) {
    return deleteByIndex(r'address', [address]);
  }

  bool deleteByAddressSync(String address) {
    return deleteByIndexSync(r'address', [address]);
  }

  Future<List<WalletAccount?>> getAllByAddress(List<String> addressValues) {
    final values = addressValues.map((e) => [e]).toList();
    return getAllByIndex(r'address', values);
  }

  List<WalletAccount?> getAllByAddressSync(List<String> addressValues) {
    final values = addressValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'address', values);
  }

  Future<int> deleteAllByAddress(List<String> addressValues) {
    final values = addressValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'address', values);
  }

  int deleteAllByAddressSync(List<String> addressValues) {
    final values = addressValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'address', values);
  }

  Future<Id> putByAddress(WalletAccount object) {
    return putByIndex(r'address', object);
  }

  Id putByAddressSync(WalletAccount object, {bool saveLinks = true}) {
    return putByIndexSync(r'address', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAddress(List<WalletAccount> objects) {
    return putAllByIndex(r'address', objects);
  }

  List<Id> putAllByAddressSync(List<WalletAccount> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'address', objects, saveLinks: saveLinks);
  }
}

extension WalletAccountQueryWhereSort
    on QueryBuilder<WalletAccount, WalletAccount, QWhere> {
  QueryBuilder<WalletAccount, WalletAccount, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WalletAccountQueryWhere
    on QueryBuilder<WalletAccount, WalletAccount, QWhereClause> {
  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> idBetween(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause> addressEqualTo(
      String address) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'address',
        value: [address],
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterWhereClause>
      addressNotEqualTo(String address) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'address',
              lower: [],
              upper: [address],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'address',
              lower: [address],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'address',
              lower: [address],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'address',
              lower: [],
              upper: [address],
              includeUpper: false,
            ));
      }
    });
  }
}

extension WalletAccountQueryFilter
    on QueryBuilder<WalletAccount, WalletAccount, QFilterCondition> {
  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      accountIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      accountIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      accountIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      accountIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressEqualTo(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressGreaterThan(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressLessThan(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressBetween(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressStartsWith(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressEndsWith(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'derivationPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'derivationPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'derivationPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'derivationPath',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      derivationPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'derivationPath',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedPrivateKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedPrivateKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedPrivateKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedPrivateKey',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      encryptedPrivateKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedPrivateKey',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      lastUsedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      lastUsedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      lastUsedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      lastUsedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mnemonicId',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mnemonicId',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mnemonicId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mnemonicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mnemonicId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mnemonicId',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      mnemonicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mnemonicId',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publicKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publicKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publicKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publicKey',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      publicKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publicKey',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'walletType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'walletType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'walletType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'walletType',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterFilterCondition>
      walletTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'walletType',
        value: '',
      ));
    });
  }
}

extension WalletAccountQueryObject
    on QueryBuilder<WalletAccount, WalletAccount, QFilterCondition> {}

extension WalletAccountQueryLinks
    on QueryBuilder<WalletAccount, WalletAccount, QFilterCondition> {}

extension WalletAccountQuerySortBy
    on QueryBuilder<WalletAccount, WalletAccount, QSortBy> {
  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByAccountIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountIndex', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByAccountIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountIndex', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByDerivationPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'derivationPath', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByDerivationPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'derivationPath', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByEncryptedPrivateKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedPrivateKey', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByEncryptedPrivateKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedPrivateKey', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByMnemonicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicId', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByMnemonicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicId', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByPublicKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByPublicKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> sortByWalletType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletType', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      sortByWalletTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletType', Sort.desc);
    });
  }
}

extension WalletAccountQuerySortThenBy
    on QueryBuilder<WalletAccount, WalletAccount, QSortThenBy> {
  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByAccountIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountIndex', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByAccountIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountIndex', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByDerivationPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'derivationPath', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByDerivationPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'derivationPath', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByEncryptedPrivateKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedPrivateKey', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByEncryptedPrivateKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedPrivateKey', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByMnemonicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicId', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByMnemonicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicId', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByPublicKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByPublicKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicKey', Sort.desc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy> thenByWalletType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletType', Sort.asc);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QAfterSortBy>
      thenByWalletTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'walletType', Sort.desc);
    });
  }
}

extension WalletAccountQueryWhereDistinct
    on QueryBuilder<WalletAccount, WalletAccount, QDistinct> {
  QueryBuilder<WalletAccount, WalletAccount, QDistinct>
      distinctByAccountIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountIndex');
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct>
      distinctByDerivationPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'derivationPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct>
      distinctByEncryptedPrivateKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedPrivateKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByMnemonicId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mnemonicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByPublicKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletAccount, WalletAccount, QDistinct> distinctByWalletType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'walletType', caseSensitive: caseSensitive);
    });
  }
}

extension WalletAccountQueryProperty
    on QueryBuilder<WalletAccount, WalletAccount, QQueryProperty> {
  QueryBuilder<WalletAccount, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WalletAccount, int, QQueryOperations> accountIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountIndex');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<WalletAccount, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations>
      derivationPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'derivationPath');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations>
      encryptedPrivateKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedPrivateKey');
    });
  }

  QueryBuilder<WalletAccount, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<WalletAccount, DateTime, QQueryOperations> lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<WalletAccount, String?, QQueryOperations> mnemonicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mnemonicId');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations> publicKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicKey');
    });
  }

  QueryBuilder<WalletAccount, String, QQueryOperations> walletTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'walletType');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMnemonicWalletCollection on Isar {
  IsarCollection<MnemonicWallet> get mnemonicWallets => this.collection();
}

const MnemonicWalletSchema = CollectionSchema(
  name: r'MnemonicWallet',
  id: -4968707530093287742,
  properties: {
    r'accountCount': PropertySchema(
      id: 0,
      name: r'accountCount',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'encryptedMnemonic': PropertySchema(
      id: 2,
      name: r'encryptedMnemonic',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'lastUsed': PropertySchema(
      id: 4,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'wordCount': PropertySchema(
      id: 6,
      name: r'wordCount',
      type: IsarType.long,
    )
  },
  estimateSize: _mnemonicWalletEstimateSize,
  serialize: _mnemonicWalletSerialize,
  deserialize: _mnemonicWalletDeserialize,
  deserializeProp: _mnemonicWalletDeserializeProp,
  idName: r'id',
  indexes: {
    r'encryptedMnemonic': IndexSchema(
      id: 1903636869262276364,
      name: r'encryptedMnemonic',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'encryptedMnemonic',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _mnemonicWalletGetId,
  getLinks: _mnemonicWalletGetLinks,
  attach: _mnemonicWalletAttach,
  version: '3.1.0+1',
);

int _mnemonicWalletEstimateSize(
  MnemonicWallet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.encryptedMnemonic.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _mnemonicWalletSerialize(
  MnemonicWallet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accountCount);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.encryptedMnemonic);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeDateTime(offsets[4], object.lastUsed);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.wordCount);
}

MnemonicWallet _mnemonicWalletDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MnemonicWallet();
  object.accountCount = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.encryptedMnemonic = reader.readString(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.lastUsed = reader.readDateTime(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.wordCount = reader.readLong(offsets[6]);
  return object;
}

P _mnemonicWalletDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mnemonicWalletGetId(MnemonicWallet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mnemonicWalletGetLinks(MnemonicWallet object) {
  return [];
}

void _mnemonicWalletAttach(
    IsarCollection<dynamic> col, Id id, MnemonicWallet object) {
  object.id = id;
}

extension MnemonicWalletByIndex on IsarCollection<MnemonicWallet> {
  Future<MnemonicWallet?> getByEncryptedMnemonic(String encryptedMnemonic) {
    return getByIndex(r'encryptedMnemonic', [encryptedMnemonic]);
  }

  MnemonicWallet? getByEncryptedMnemonicSync(String encryptedMnemonic) {
    return getByIndexSync(r'encryptedMnemonic', [encryptedMnemonic]);
  }

  Future<bool> deleteByEncryptedMnemonic(String encryptedMnemonic) {
    return deleteByIndex(r'encryptedMnemonic', [encryptedMnemonic]);
  }

  bool deleteByEncryptedMnemonicSync(String encryptedMnemonic) {
    return deleteByIndexSync(r'encryptedMnemonic', [encryptedMnemonic]);
  }

  Future<List<MnemonicWallet?>> getAllByEncryptedMnemonic(
      List<String> encryptedMnemonicValues) {
    final values = encryptedMnemonicValues.map((e) => [e]).toList();
    return getAllByIndex(r'encryptedMnemonic', values);
  }

  List<MnemonicWallet?> getAllByEncryptedMnemonicSync(
      List<String> encryptedMnemonicValues) {
    final values = encryptedMnemonicValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'encryptedMnemonic', values);
  }

  Future<int> deleteAllByEncryptedMnemonic(
      List<String> encryptedMnemonicValues) {
    final values = encryptedMnemonicValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'encryptedMnemonic', values);
  }

  int deleteAllByEncryptedMnemonicSync(List<String> encryptedMnemonicValues) {
    final values = encryptedMnemonicValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'encryptedMnemonic', values);
  }

  Future<Id> putByEncryptedMnemonic(MnemonicWallet object) {
    return putByIndex(r'encryptedMnemonic', object);
  }

  Id putByEncryptedMnemonicSync(MnemonicWallet object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'encryptedMnemonic', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEncryptedMnemonic(List<MnemonicWallet> objects) {
    return putAllByIndex(r'encryptedMnemonic', objects);
  }

  List<Id> putAllByEncryptedMnemonicSync(List<MnemonicWallet> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'encryptedMnemonic', objects,
        saveLinks: saveLinks);
  }
}

extension MnemonicWalletQueryWhereSort
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QWhere> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MnemonicWalletQueryWhere
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QWhereClause> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause> idBetween(
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause>
      encryptedMnemonicEqualTo(String encryptedMnemonic) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'encryptedMnemonic',
        value: [encryptedMnemonic],
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterWhereClause>
      encryptedMnemonicNotEqualTo(String encryptedMnemonic) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encryptedMnemonic',
              lower: [],
              upper: [encryptedMnemonic],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encryptedMnemonic',
              lower: [encryptedMnemonic],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encryptedMnemonic',
              lower: [encryptedMnemonic],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'encryptedMnemonic',
              lower: [],
              upper: [encryptedMnemonic],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MnemonicWalletQueryFilter
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QFilterCondition> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      accountCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      accountCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      accountCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      accountCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'encryptedMnemonic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'encryptedMnemonic',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'encryptedMnemonic',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'encryptedMnemonic',
        value: '',
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      encryptedMnemonicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'encryptedMnemonic',
        value: '',
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      lastUsedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      lastUsedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      lastUsedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      lastUsedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
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

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      wordCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      wordCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      wordCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterFilterCondition>
      wordCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MnemonicWalletQueryObject
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QFilterCondition> {}

extension MnemonicWalletQueryLinks
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QFilterCondition> {}

extension MnemonicWalletQuerySortBy
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QSortBy> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByAccountCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCount', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByAccountCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCount', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByEncryptedMnemonic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedMnemonic', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByEncryptedMnemonicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedMnemonic', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> sortByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      sortByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension MnemonicWalletQuerySortThenBy
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QSortThenBy> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByAccountCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCount', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByAccountCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCount', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByEncryptedMnemonic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedMnemonic', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByEncryptedMnemonicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'encryptedMnemonic', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy> thenByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.asc);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QAfterSortBy>
      thenByWordCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordCount', Sort.desc);
    });
  }
}

extension MnemonicWalletQueryWhereDistinct
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct> {
  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct>
      distinctByAccountCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountCount');
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct>
      distinctByEncryptedMnemonic({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'encryptedMnemonic',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct> distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MnemonicWallet, MnemonicWallet, QDistinct>
      distinctByWordCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordCount');
    });
  }
}

extension MnemonicWalletQueryProperty
    on QueryBuilder<MnemonicWallet, MnemonicWallet, QQueryProperty> {
  QueryBuilder<MnemonicWallet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MnemonicWallet, int, QQueryOperations> accountCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountCount');
    });
  }

  QueryBuilder<MnemonicWallet, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MnemonicWallet, String, QQueryOperations>
      encryptedMnemonicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encryptedMnemonic');
    });
  }

  QueryBuilder<MnemonicWallet, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<MnemonicWallet, DateTime, QQueryOperations> lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<MnemonicWallet, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MnemonicWallet, int, QQueryOperations> wordCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordCount');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainBalance _$ChainBalanceFromJson(Map<String, dynamic> json) => ChainBalance(
      chain: json['chain'] as String,
      symbol: json['symbol'] as String,
      balance: json['balance'] as String,
      usdValue: json['usdValue'] as String,
      decimals: (json['decimals'] as num).toInt(),
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$ChainBalanceToJson(ChainBalance instance) =>
    <String, dynamic>{
      'chain': instance.chain,
      'symbol': instance.symbol,
      'balance': instance.balance,
      'usdValue': instance.usdValue,
      'decimals': instance.decimals,
      'logoUrl': instance.logoUrl,
    };

WalletCreationResult _$WalletCreationResultFromJson(
        Map<String, dynamic> json) =>
    WalletCreationResult(
      address: json['address'] as String,
      publicKey: json['publicKey'] as String,
      mnemonic: json['mnemonic'] as String,
      derivationPath: json['derivationPath'] as String,
      success: json['success'] as bool,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$WalletCreationResultToJson(
        WalletCreationResult instance) =>
    <String, dynamic>{
      'address': instance.address,
      'publicKey': instance.publicKey,
      'mnemonic': instance.mnemonic,
      'derivationPath': instance.derivationPath,
      'success': instance.success,
      'error': instance.error,
    };

WalletImportResult _$WalletImportResultFromJson(Map<String, dynamic> json) =>
    WalletImportResult(
      address: json['address'] as String,
      publicKey: json['publicKey'] as String,
      success: json['success'] as bool,
      importType: json['importType'] as String,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$WalletImportResultToJson(WalletImportResult instance) =>
    <String, dynamic>{
      'address': instance.address,
      'publicKey': instance.publicKey,
      'success': instance.success,
      'error': instance.error,
      'importType': instance.importType,
    };

OnboardingStep _$OnboardingStepFromJson(Map<String, dynamic> json) =>
    OnboardingStep(
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      buttonText: json['buttonText'] as String?,
    );

Map<String, dynamic> _$OnboardingStepToJson(OnboardingStep instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'buttonText': instance.buttonText,
    };

BackupVerification _$BackupVerificationFromJson(Map<String, dynamic> json) =>
    BackupVerification(
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
      correctIndices: (json['correctIndices'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$BackupVerificationToJson(BackupVerification instance) =>
    <String, dynamic>{
      'words': instance.words,
      'correctIndices': instance.correctIndices,
      'isComplete': instance.isComplete,
    };
