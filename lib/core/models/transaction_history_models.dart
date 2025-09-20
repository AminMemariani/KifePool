// import 'package:isar/isar.dart'; // Removed - using SQLite instead
import 'package:json_annotation/json_annotation.dart';

part 'transaction_history_models.g.dart';

/// Transaction types supported by the app
enum TransactionType {
  @JsonValue('transfer')
  transfer,
  @JsonValue('staking')
  staking,
  @JsonValue('unstaking')
  unstaking,
  @JsonValue('reward')
  reward,
  @JsonValue('nft_transfer')
  nftTransfer,
  @JsonValue('cross_chain')
  crossChain,
  @JsonValue('contract_call')
  contractCall,
  @JsonValue('other')
  other,
}

/// Transaction status
enum TransactionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

/// Transaction direction
enum TransactionDirection {
  @JsonValue('incoming')
  incoming,
  @JsonValue('outgoing')
  outgoing,
}

/// Transaction history model

@JsonSerializable()
class TransactionHistory {
  

  /// Transaction hash
  late String hash;

  /// Block number
  late int blockNumber;

  /// Chain identifier
  late String chain;

  /// Transaction type
  
  late TransactionType type;

  /// Transaction status
  
  late TransactionStatus status;

  /// Transaction direction
  
  late TransactionDirection direction;

  /// From address
  late String fromAddress;

  /// To address
  late String toAddress;

  /// Amount (in smallest unit)
  late String amount;

  /// Token symbol
  late String tokenSymbol;

  /// Gas fee paid
  late String gasFee;

  /// Gas used
  late String gasUsed;

  /// Transaction timestamp
  late DateTime timestamp;

  /// Block timestamp
  late DateTime blockTimestamp;

  /// Transaction index in block
  late int transactionIndex;

  /// Nonce
  late int nonce;

  /// Additional metadata
  
  Map<String, dynamic>? metadata;

  /// Explorer URL
  String? explorerUrl;

  /// Created at timestamp
  late DateTime createdAt;

  /// Updated at timestamp
  late DateTime updatedAt;

  TransactionHistory();

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionHistoryToJson(this);
}

/// Transaction filter options
@JsonSerializable()
class TransactionFilter {
  final String? chain;
  final TransactionType? type;
  final TransactionStatus? status;
  final TransactionDirection? direction;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? address;
  final String? searchQuery;
  final int limit;
  final int offset;

  const TransactionFilter({
    this.chain,
    this.type,
    this.status,
    this.direction,
    this.fromDate,
    this.toDate,
    this.address,
    this.searchQuery,
    this.limit = 50,
    this.offset = 0,
  });

  factory TransactionFilter.fromJson(Map<String, dynamic> json) =>
      _$TransactionFilterFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionFilterToJson(this);

  /// Create a copy with updated values
  TransactionFilter copyWith({
    String? chain,
    TransactionType? type,
    TransactionStatus? status,
    TransactionDirection? direction,
    DateTime? fromDate,
    DateTime? toDate,
    String? address,
    String? searchQuery,
    int? limit,
    int? offset,
  }) {
    return TransactionFilter(
      chain: chain ?? this.chain,
      type: type ?? this.type,
      status: status ?? this.status,
      direction: direction ?? this.direction,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      address: address ?? this.address,
      searchQuery: searchQuery ?? this.searchQuery,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}

/// Transaction history result
@JsonSerializable()
class TransactionHistoryResult {
  final List<TransactionHistory> transactions;
  final int totalCount;
  final bool hasMore;
  final String? nextCursor;

  const TransactionHistoryResult({
    required this.transactions,
    required this.totalCount,
    required this.hasMore,
    this.nextCursor,
  });

  factory TransactionHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryResultFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionHistoryResultToJson(this);
}

/// Chain information for transaction history
@JsonSerializable()
class ChainInfo {
  final String id;
  final String name;
  final String symbol;
  final String explorerUrl;
  final String logoUrl;
  final bool isTestnet;

  const ChainInfo({
    required this.id,
    required this.name,
    required this.symbol,
    required this.explorerUrl,
    required this.logoUrl,
    this.isTestnet = false,
  });

  factory ChainInfo.fromJson(Map<String, dynamic> json) =>
      _$ChainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ChainInfoToJson(this);
}

/// Transaction statistics
@JsonSerializable()
class TransactionStats {
  final int totalTransactions;
  final int pendingTransactions;
  final int confirmedTransactions;
  final int failedTransactions;
  final Map<String, int> transactionsByChain;
  final Map<String, int> transactionsByType;
  final String totalVolume;
  final String totalFees;

  const TransactionStats({
    required this.totalTransactions,
    required this.pendingTransactions,
    required this.confirmedTransactions,
    required this.failedTransactions,
    required this.transactionsByChain,
    required this.transactionsByType,
    required this.totalVolume,
    required this.totalFees,
  });

  factory TransactionStats.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionStatsToJson(this);
}
