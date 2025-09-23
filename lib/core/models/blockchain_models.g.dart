// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
  address: json['address'] as String,
  chain: json['chain'] as String,
  free: json['free'] as String,
  reserved: json['reserved'] as String,
  frozen: json['frozen'] as String,
  total: json['total'] as String,
  symbol: json['symbol'] as String,
  decimals: (json['decimals'] as num).toInt(),
);

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
  'address': instance.address,
  'chain': instance.chain,
  'free': instance.free,
  'reserved': instance.reserved,
  'frozen': instance.frozen,
  'total': instance.total,
  'symbol': instance.symbol,
  'decimals': instance.decimals,
};

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
  hash: json['hash'] as String,
  from: json['from'] as String,
  to: json['to'] as String,
  amount: json['amount'] as String,
  symbol: json['symbol'] as String,
  blockNumber: (json['blockNumber'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'from': instance.from,
      'to': instance.to,
      'amount': instance.amount,
      'symbol': instance.symbol,
      'blockNumber': instance.blockNumber,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.confirmed: 'confirmed',
  TransactionStatus.failed: 'failed',
};

NFT _$NFTFromJson(Map<String, dynamic> json) => NFT(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  collection: json['collection'] as String,
  owner: json['owner'] as String,
  chain: json['chain'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$NFTToJson(NFT instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'collection': instance.collection,
  'owner': instance.owner,
  'chain': instance.chain,
  'metadata': instance.metadata,
};

StakingInfo _$StakingInfoFromJson(Map<String, dynamic> json) => StakingInfo(
  address: json['address'] as String,
  chain: json['chain'] as String,
  staked: json['staked'] as String,
  unstaking: json['unstaking'] as String,
  rewards: json['rewards'] as String,
  symbol: json['symbol'] as String,
  decimals: (json['decimals'] as num).toInt(),
  validators: (json['validators'] as List<dynamic>)
      .map((e) => Validator.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StakingInfoToJson(StakingInfo instance) =>
    <String, dynamic>{
      'address': instance.address,
      'chain': instance.chain,
      'staked': instance.staked,
      'unstaking': instance.unstaking,
      'rewards': instance.rewards,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'validators': instance.validators,
    };

Validator _$ValidatorFromJson(Map<String, dynamic> json) => Validator(
  address: json['address'] as String,
  name: json['name'] as String,
  commission: (json['commission'] as num).toDouble(),
  isActive: json['isActive'] as bool,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$ValidatorToJson(Validator instance) => <String, dynamic>{
  'address': instance.address,
  'name': instance.name,
  'commission': instance.commission,
  'isActive': instance.isActive,
  'icon': instance.icon,
};

CrossChainTransferRequest _$CrossChainTransferRequestFromJson(
  Map<String, dynamic> json,
) => CrossChainTransferRequest(
  from: json['from'] as String,
  to: json['to'] as String,
  assetId: json['assetId'] as String,
  amount: json['amount'] as String,
  sourceChain: $enumDecode(_$BlockchainNetworkEnumMap, json['sourceChain']),
  destChain: $enumDecode(_$BlockchainNetworkEnumMap, json['destChain']),
  memo: json['memo'] as String?,
);

Map<String, dynamic> _$CrossChainTransferRequestToJson(
  CrossChainTransferRequest instance,
) => <String, dynamic>{
  'from': instance.from,
  'to': instance.to,
  'assetId': instance.assetId,
  'amount': instance.amount,
  'sourceChain': _$BlockchainNetworkEnumMap[instance.sourceChain]!,
  'destChain': _$BlockchainNetworkEnumMap[instance.destChain]!,
  'memo': instance.memo,
};

const _$BlockchainNetworkEnumMap = {
  BlockchainNetwork.polkadot: 'polkadot',
  BlockchainNetwork.kusama: 'kusama',
  BlockchainNetwork.moonbeam: 'moonbeam',
  BlockchainNetwork.moonriver: 'moonriver',
  BlockchainNetwork.astar: 'astar',
  BlockchainNetwork.acala: 'acala',
};

TransactionResult _$TransactionResultFromJson(Map<String, dynamic> json) =>
    TransactionResult(
      hash: json['hash'] as String,
      success: json['success'] as bool,
      errorMessage: json['errorMessage'] as String?,
      blockNumber: (json['blockNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionResultToJson(TransactionResult instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'success': instance.success,
      'errorMessage': instance.errorMessage,
      'blockNumber': instance.blockNumber,
    };
