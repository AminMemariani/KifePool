// import 'package:isar/isar.dart'; // Removed - using SQLite instead
import 'package:json_annotation/json_annotation.dart';

part 'transfer_models.g.dart';

/// Transfer type enumeration
enum TransferType {
  @JsonValue('token')
  token,
  @JsonValue('nft')
  nft,
  @JsonValue('cross_chain')
  crossChain,
}

/// Transfer status enumeration
enum TransferStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

/// Transfer direction enumeration
enum TransferDirection {
  @JsonValue('send')
  send,
  @JsonValue('receive')
  receive,
}

/// Token transfer model

@JsonSerializable()
class TokenTransfer {
  late String transactionHash;

  late String fromAddress;

  late String toAddress;

  late String tokenSymbol;
  late String tokenName;
  late String amount;
  late String chain;

  late TransferDirection direction;

  late TransferStatus status;

  late String? gasFee;
  late String? gasUsed;
  late String? blockNumber;
  late DateTime timestamp;
  late DateTime createdAt;
  late DateTime? updatedAt;

  // Optional fields
  String? memo;
  String? metadata;

  Map<String, dynamic>? extraData;

  TokenTransfer();

  factory TokenTransfer.fromJson(Map<String, dynamic> json) =>
      _$TokenTransferFromJson(json);
  Map<String, dynamic> toJson() => _$TokenTransferToJson(this);
}

/// NFT transfer model

@JsonSerializable()
class NftTransfer {
  late String transactionHash;

  late String fromAddress;

  late String toAddress;

  late String nftId;
  late String collectionId;
  late String nftName;
  late String? nftImage;
  late String chain;

  late TransferDirection direction;

  late TransferStatus status;

  late String? gasFee;
  late String? gasUsed;
  late String? blockNumber;
  late DateTime timestamp;
  late DateTime createdAt;
  late DateTime? updatedAt;

  // Optional fields
  String? memo;

  Map<String, dynamic>? metadata;

  Map<String, dynamic>? extraData;

  NftTransfer();

  factory NftTransfer.fromJson(Map<String, dynamic> json) =>
      _$NftTransferFromJson(json);
  Map<String, dynamic> toJson() => _$NftTransferToJson(this);
}

/// Transfer request model for sending
@JsonSerializable()
class TransferRequest {
  final String recipientAddress;
  final String amount;
  final String tokenSymbol;
  final String chain;
  final String? memo;
  final Map<String, dynamic>? metadata;

  const TransferRequest({
    required this.recipientAddress,
    required this.amount,
    required this.tokenSymbol,
    required this.chain,
    this.memo,
    this.metadata,
  });

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);
}

/// NFT transfer request model
@JsonSerializable()
class NftTransferRequest {
  final String recipientAddress;
  final String nftId;
  final String collectionId;
  final String chain;
  final String? memo;
  final Map<String, dynamic>? metadata;

  const NftTransferRequest({
    required this.recipientAddress,
    required this.nftId,
    required this.collectionId,
    required this.chain,
    this.memo,
    this.metadata,
  });

  factory NftTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$NftTransferRequestFromJson(json);
  Map<String, dynamic> toJson() => _$NftTransferRequestToJson(this);
}

/// Transfer result model
@JsonSerializable()
class TransferResult {
  final bool success;
  final String? transactionHash;
  final String? error;
  final String? gasUsed;
  final String? gasFee;
  final Map<String, dynamic>? metadata;

  const TransferResult({
    required this.success,
    this.transactionHash,
    this.error,
    this.gasUsed,
    this.gasFee,
    this.metadata,
  });

  factory TransferResult.fromJson(Map<String, dynamic> json) =>
      _$TransferResultFromJson(json);
  Map<String, dynamic> toJson() => _$TransferResultToJson(this);
}

/// QR code data model for transfers
@JsonSerializable()
class TransferQrData {
  final String type; // 'token' or 'nft'
  final String? recipientAddress;
  final String? amount;
  final String? tokenSymbol;
  final String? nftId;
  final String? collectionId;
  final String chain;
  final String? memo;
  final Map<String, dynamic>? metadata;

  const TransferQrData({
    required this.type,
    this.recipientAddress,
    this.amount,
    this.tokenSymbol,
    this.nftId,
    this.collectionId,
    required this.chain,
    this.memo,
    this.metadata,
  });

  factory TransferQrData.fromJson(Map<String, dynamic> json) =>
      _$TransferQrDataFromJson(json);
  Map<String, dynamic> toJson() => _$TransferQrDataToJson(this);
}

/// Transfer validation result
@JsonSerializable()
class TransferValidation {
  final bool isValid;
  final List<String> errors;
  final String? estimatedGasFee;
  final String? estimatedGasUsed;

  const TransferValidation({
    required this.isValid,
    required this.errors,
    this.estimatedGasFee,
    this.estimatedGasUsed,
  });

  factory TransferValidation.fromJson(Map<String, dynamic> json) =>
      _$TransferValidationFromJson(json);
  Map<String, dynamic> toJson() => _$TransferValidationToJson(this);
}

/// Transfer exception
class TransferException implements Exception {
  final String message;
  final String? details;
  final String? transactionHash;

  const TransferException({
    required this.message,
    this.details,
    this.transactionHash,
  });

  @override
  String toString() {
    return 'TransferException: $message${details != null ? ' - $details' : ''}';
  }
}
