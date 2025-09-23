// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xcm_transfer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XcmTransfer _$XcmTransferFromJson(Map<String, dynamic> json) => XcmTransfer()
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

Map<String, dynamic> _$XcmTransferToJson(
  XcmTransfer instance,
) => <String, dynamic>{
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
  'confirmationTimestamp': instance.confirmationTimestamp?.toIso8601String(),
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
  XcmTransferProgress instance,
) => <String, dynamic>{
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
  Map<String, dynamic> json,
) => XcmTransferValidation(
  isValid: json['isValid'] as bool,
  errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
  estimatedFee: json['estimatedFee'] as String?,
  estimatedTime: json['estimatedTime'] as String?,
  isSupported: json['isSupported'] as bool,
);

Map<String, dynamic> _$XcmTransferValidationToJson(
  XcmTransferValidation instance,
) => <String, dynamic>{
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
