import 'package:json_annotation/json_annotation.dart';

part 'blockchain_models.g.dart';

/// Supported blockchain networks
enum BlockchainNetwork {
  polkadot('Polkadot', 'wss://rpc.polkadot.io'),
  kusama('Kusama', 'wss://kusama-rpc.polkadot.io'),
  moonbeam('Moonbeam', 'wss://wss.api.moonbeam.network'),
  moonriver('Moonriver', 'wss://wss.moonriver.moonbeam.network'),
  astar('Astar', 'wss://rpc.astar.network'),
  acala('Acala', 'wss://acala-rpc-0.aca-api.network');

  const BlockchainNetwork(this.name, this.rpcUrl);
  final String name;
  final String rpcUrl;
}

/// Balance information for an account
@JsonSerializable()
class Balance {
  final String address;
  final String chain;
  final String free;
  final String reserved;
  final String frozen;
  final String total;
  final String symbol;
  final int decimals;

  const Balance({
    required this.address,
    required this.chain,
    required this.free,
    required this.reserved,
    required this.frozen,
    required this.total,
    required this.symbol,
    required this.decimals,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);

  double get freeAmount => double.tryParse(free) ?? 0.0;
  double get totalAmount => double.tryParse(total) ?? 0.0;
}

/// Transaction information
@JsonSerializable()
class Transaction {
  final String hash;
  final String from;
  final String to;
  final String amount;
  final String symbol;
  final int blockNumber;
  final DateTime timestamp;
  final TransactionStatus status;
  final String? errorMessage;

  const Transaction({
    required this.hash,
    required this.from,
    required this.to,
    required this.amount,
    required this.symbol,
    required this.blockNumber,
    required this.timestamp,
    required this.status,
    this.errorMessage,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

/// Transaction status enum
enum TransactionStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('failed')
  failed,
}

/// NFT information
@JsonSerializable()
class NFT {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String collection;
  final String owner;
  final String chain;
  final Map<String, dynamic>? metadata;

  const NFT({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.collection,
    required this.owner,
    required this.chain,
    this.metadata,
  });

  factory NFT.fromJson(Map<String, dynamic> json) => _$NFTFromJson(json);
  Map<String, dynamic> toJson() => _$NFTToJson(this);
}

/// Staking information
@JsonSerializable()
class StakingInfo {
  final String address;
  final String chain;
  final String staked;
  final String unstaking;
  final String rewards;
  final String symbol;
  final int decimals;
  final List<Validator> validators;

  const StakingInfo({
    required this.address,
    required this.chain,
    required this.staked,
    required this.unstaking,
    required this.rewards,
    required this.symbol,
    required this.decimals,
    required this.validators,
  });

  factory StakingInfo.fromJson(Map<String, dynamic> json) =>
      _$StakingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StakingInfoToJson(this);
}

/// Validator information
@JsonSerializable()
class Validator {
  final String address;
  final String name;
  final double commission;
  final bool isActive;
  final String? icon;

  const Validator({
    required this.address,
    required this.name,
    required this.commission,
    required this.isActive,
    this.icon,
  });

  factory Validator.fromJson(Map<String, dynamic> json) =>
      _$ValidatorFromJson(json);
  Map<String, dynamic> toJson() => _$ValidatorToJson(this);
}

/// Cross-chain transfer request
@JsonSerializable()
class CrossChainTransferRequest {
  final String from;
  final String to;
  final String assetId;
  final String amount;
  final BlockchainNetwork sourceChain;
  final BlockchainNetwork destChain;
  final String? memo;

  const CrossChainTransferRequest({
    required this.from,
    required this.to,
    required this.assetId,
    required this.amount,
    required this.sourceChain,
    required this.destChain,
    this.memo,
  });

  factory CrossChainTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$CrossChainTransferRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CrossChainTransferRequestToJson(this);
}

/// Transaction result
@JsonSerializable()
class TransactionResult {
  final String hash;
  final bool success;
  final String? errorMessage;
  final int? blockNumber;

  const TransactionResult({
    required this.hash,
    required this.success,
    this.errorMessage,
    this.blockNumber,
  });

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionResultToJson(this);
}

/// Blockchain error types
enum BlockchainErrorType {
  networkError,
  rpcError,
  insufficientBalance,
  invalidAddress,
  transactionFailed,
  stakingError,
  crossChainError,
  unknown,
}

/// Custom blockchain exception
class BlockchainException implements Exception {
  final BlockchainErrorType type;
  final String message;
  final String? details;
  final int? code;

  const BlockchainException({
    required this.type,
    required this.message,
    this.details,
    this.code,
  });

  @override
  String toString() =>
      'BlockchainException: $message${details != null ? ' - $details' : ''}';
}
