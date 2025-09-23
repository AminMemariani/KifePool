// import 'package:isar/isar.dart'; // Removed - using SQLite instead
import 'package:json_annotation/json_annotation.dart';

part 'xcm_transfer_models.g.dart';

/// XCM transfer status
enum XcmTransferStatus {
  @JsonValue('initiated')
  initiated,
  @JsonValue('processing')
  processing,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

/// XCM transfer type
enum XcmTransferType {
  @JsonValue('token')
  token,
  @JsonValue('nft')
  nft,
}

/// XCM transfer direction
enum XcmTransferDirection {
  @JsonValue('outbound')
  outbound,
  @JsonValue('inbound')
  inbound,
}

/// XCM transfer model

@JsonSerializable()
class XcmTransfer {
  /// Transfer hash/ID
  late String transferId;

  /// Source chain
  late String sourceChain;

  /// Destination chain
  late String destinationChain;

  /// Transfer type

  late XcmTransferType type;

  /// Transfer status

  late XcmTransferStatus status;

  /// Transfer direction

  late XcmTransferDirection direction;

  /// Source address
  late String sourceAddress;

  /// Destination address
  late String destinationAddress;

  /// Asset symbol
  late String assetSymbol;

  /// Asset amount
  late String amount;

  /// XCM message hash
  String? xcmMessageHash;

  /// Source transaction hash
  String? sourceTransactionHash;

  /// Destination transaction hash
  String? destinationTransactionHash;

  /// Transfer fee
  late String transferFee;

  /// XCM fee
  late String xcmFee;

  /// Transfer timestamp
  late DateTime timestamp;

  /// Confirmation timestamp
  DateTime? confirmationTimestamp;

  /// Error message
  String? errorMessage;

  /// Additional metadata

  Map<String, dynamic>? metadata;

  /// Created at timestamp
  late DateTime createdAt;

  /// Updated at timestamp
  late DateTime updatedAt;

  XcmTransfer();

  factory XcmTransfer.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferToJson(this);
}

/// XCM transfer request
@JsonSerializable()
class XcmTransferRequest {
  final String sourceChain;
  final String destinationChain;
  final XcmTransferType type;
  final String sourceAddress;
  final String destinationAddress;
  final String assetSymbol;
  final String amount;
  final String? memo;

  const XcmTransferRequest({
    required this.sourceChain,
    required this.destinationChain,
    required this.type,
    required this.sourceAddress,
    required this.destinationAddress,
    required this.assetSymbol,
    required this.amount,
    this.memo,
  });

  factory XcmTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferRequestFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferRequestToJson(this);
}

/// XCM transfer result
@JsonSerializable()
class XcmTransferResult {
  final bool success;
  final String? transferId;
  final String? errorMessage;
  final XcmTransferStatus status;
  final String? sourceTransactionHash;
  final String? xcmMessageHash;

  const XcmTransferResult({
    required this.success,
    this.transferId,
    this.errorMessage,
    required this.status,
    this.sourceTransactionHash,
    this.xcmMessageHash,
  });

  factory XcmTransferResult.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferResultFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferResultToJson(this);
}

/// XCM transfer progress
@JsonSerializable()
class XcmTransferProgress {
  final String transferId;
  final XcmTransferStatus status;
  final int currentStep;
  final int totalSteps;
  final String currentStepDescription;
  final double progressPercentage;
  final DateTime lastUpdated;
  final String? errorMessage;

  const XcmTransferProgress({
    required this.transferId,
    required this.status,
    required this.currentStep,
    required this.totalSteps,
    required this.currentStepDescription,
    required this.progressPercentage,
    required this.lastUpdated,
    this.errorMessage,
  });

  factory XcmTransferProgress.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferProgressFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferProgressToJson(this);
}

/// XCM chain information
@JsonSerializable()
class XcmChainInfo {
  final String id;
  final String name;
  final String symbol;
  final String rpcUrl;
  final String explorerUrl;
  final bool isRelayChain;
  final List<String> supportedAssets;
  final Map<String, String> assetSymbols; // assetId -> symbol mapping

  const XcmChainInfo({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.isRelayChain,
    required this.supportedAssets,
    required this.assetSymbols,
  });

  factory XcmChainInfo.fromJson(Map<String, dynamic> json) =>
      _$XcmChainInfoFromJson(json);
  Map<String, dynamic> toJson() => _$XcmChainInfoToJson(this);
}

/// XCM asset information
@JsonSerializable()
class XcmAssetInfo {
  final String symbol;
  final String assetId;
  final String chain;
  final String decimals;
  final String balance;
  final bool isNative;
  final String? contractAddress;

  const XcmAssetInfo({
    required this.symbol,
    required this.assetId,
    required this.chain,
    required this.decimals,
    required this.balance,
    required this.isNative,
    this.contractAddress,
  });

  factory XcmAssetInfo.fromJson(Map<String, dynamic> json) =>
      _$XcmAssetInfoFromJson(json);
  Map<String, dynamic> toJson() => _$XcmAssetInfoToJson(this);
}

/// XCM transfer validation
@JsonSerializable()
class XcmTransferValidation {
  final bool isValid;
  final List<String> errors;
  final String? estimatedFee;
  final String? estimatedTime;
  final bool isSupported;

  const XcmTransferValidation({
    required this.isValid,
    required this.errors,
    this.estimatedFee,
    this.estimatedTime,
    required this.isSupported,
  });

  factory XcmTransferValidation.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferValidationFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferValidationToJson(this);
}

/// XCM transfer statistics
@JsonSerializable()
class XcmTransferStats {
  final int totalTransfers;
  final int successfulTransfers;
  final int failedTransfers;
  final int pendingTransfers;
  final Map<String, int> transfersByChain;
  final Map<String, int> transfersByType;
  final String totalVolume;
  final String totalFees;

  const XcmTransferStats({
    required this.totalTransfers,
    required this.successfulTransfers,
    required this.failedTransfers,
    required this.pendingTransfers,
    required this.transfersByChain,
    required this.transfersByType,
    required this.totalVolume,
    required this.totalFees,
  });

  factory XcmTransferStats.fromJson(Map<String, dynamic> json) =>
      _$XcmTransferStatsFromJson(json);
  Map<String, dynamic> toJson() => _$XcmTransferStatsToJson(this);
}
