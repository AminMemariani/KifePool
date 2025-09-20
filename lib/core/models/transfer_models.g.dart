// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenTransfer _$TokenTransferFromJson(Map<String, dynamic> json) =>
    TokenTransfer()
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
