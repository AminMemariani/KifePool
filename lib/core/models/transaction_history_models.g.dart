// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) =>
    TransactionHistory()
      ..hash = json['hash'] as String
      ..blockNumber = (json['blockNumber'] as num).toInt()
      ..chain = json['chain'] as String
      ..type = $enumDecode(_$TransactionTypeEnumMap, json['type'])
      ..status = $enumDecode(_$TransactionStatusEnumMap, json['status'])
      ..direction = $enumDecode(
        _$TransactionDirectionEnumMap,
        json['direction'],
      )
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
      direction: $enumDecodeNullable(
        _$TransactionDirectionEnumMap,
        json['direction'],
      ),
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
  Map<String, dynamic> json,
) => TransactionHistoryResult(
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
  hasMore: json['hasMore'] as bool,
  nextCursor: json['nextCursor'] as String?,
);

Map<String, dynamic> _$TransactionHistoryResultToJson(
  TransactionHistoryResult instance,
) => <String, dynamic>{
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
      transactionsByChain: Map<String, int>.from(
        json['transactionsByChain'] as Map,
      ),
      transactionsByType: Map<String, int>.from(
        json['transactionsByType'] as Map,
      ),
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
