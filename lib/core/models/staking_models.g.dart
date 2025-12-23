// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validator _$ValidatorFromJson(Map<String, dynamic> json) => Validator()
  ..address = json['address'] as String
  ..name = json['name'] as String
  ..chain = json['chain'] as String
  ..commission = (json['commission'] as num).toDouble()
  ..apy = (json['apy'] as num).toDouble()
  ..totalStake = (json['totalStake'] as num).toInt()
  ..nominatorCount = (json['nominatorCount'] as num).toInt()
  ..isActive = json['isActive'] as bool
  ..isOversubscribed = json['isOversubscribed'] as bool
  ..lastUpdated = DateTime.parse(json['lastUpdated'] as String)
  ..identity = json['identity'] as String
  ..website = json['website'] as String
  ..description = json['description'] as String;

Map<String, dynamic> _$ValidatorToJson(Validator instance) => <String, dynamic>{
      'address': instance.address,
      'name': instance.name,
      'chain': instance.chain,
      'commission': instance.commission,
      'apy': instance.apy,
      'totalStake': instance.totalStake,
      'nominatorCount': instance.nominatorCount,
      'isActive': instance.isActive,
      'isOversubscribed': instance.isOversubscribed,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'identity': instance.identity,
      'website': instance.website,
      'description': instance.description,
    };

NominationPool _$NominationPoolFromJson(Map<String, dynamic> json) =>
    NominationPool()
      ..poolId = (json['poolId'] as num).toInt()
      ..name = json['name'] as String
      ..chain = json['chain'] as String
      ..state = json['state'] as String
      ..apy = (json['apy'] as num).toDouble()
      ..totalStake = (json['totalStake'] as num).toInt()
      ..memberCount = (json['memberCount'] as num).toInt()
      ..poolAccount = json['poolAccount'] as String
      ..lastUpdated = DateTime.parse(json['lastUpdated'] as String)
      ..description = json['description'] as String;

Map<String, dynamic> _$NominationPoolToJson(NominationPool instance) =>
    <String, dynamic>{
      'poolId': instance.poolId,
      'name': instance.name,
      'chain': instance.chain,
      'state': instance.state,
      'apy': instance.apy,
      'totalStake': instance.totalStake,
      'memberCount': instance.memberCount,
      'poolAccount': instance.poolAccount,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'description': instance.description,
    };

StakingPosition _$StakingPositionFromJson(Map<String, dynamic> json) =>
    StakingPosition()
      ..accountAddress = json['accountAddress'] as String
      ..chain = json['chain'] as String
      ..stakingType = json['stakingType'] as String
      ..targetAddress = json['targetAddress'] as String
      ..targetName = json['targetName'] as String
      ..stakedAmount = (json['stakedAmount'] as num).toInt()
      ..pendingRewards = (json['pendingRewards'] as num).toInt()
      ..totalRewards = (json['totalRewards'] as num).toInt()
      ..stakedAt = DateTime.parse(json['stakedAt'] as String)
      ..lastClaimed = DateTime.parse(json['lastClaimed'] as String)
      ..isActive = json['isActive'] as bool
      ..status = json['status'] as String
      ..unbondingAmount = (json['unbondingAmount'] as num).toInt()
      ..unbondingEndsAt = DateTime.parse(json['unbondingEndsAt'] as String)
      ..apy = (json['apy'] as num).toDouble()
      ..poolId = (json['poolId'] as num).toInt()
      ..validatorAddress = json['validatorAddress'] as String;

Map<String, dynamic> _$StakingPositionToJson(StakingPosition instance) =>
    <String, dynamic>{
      'accountAddress': instance.accountAddress,
      'chain': instance.chain,
      'stakingType': instance.stakingType,
      'targetAddress': instance.targetAddress,
      'targetName': instance.targetName,
      'stakedAmount': instance.stakedAmount,
      'pendingRewards': instance.pendingRewards,
      'totalRewards': instance.totalRewards,
      'stakedAt': instance.stakedAt.toIso8601String(),
      'lastClaimed': instance.lastClaimed.toIso8601String(),
      'isActive': instance.isActive,
      'status': instance.status,
      'unbondingAmount': instance.unbondingAmount,
      'unbondingEndsAt': instance.unbondingEndsAt.toIso8601String(),
      'apy': instance.apy,
      'poolId': instance.poolId,
      'validatorAddress': instance.validatorAddress,
    };

StakingReward _$StakingRewardFromJson(Map<String, dynamic> json) =>
    StakingReward()
      ..accountAddress = json['accountAddress'] as String
      ..chain = json['chain'] as String
      ..validatorAddress = json['validatorAddress'] as String
      ..amount = (json['amount'] as num).toInt()
      ..earnedAt = DateTime.parse(json['earnedAt'] as String)
      ..claimedAt = DateTime.parse(json['claimedAt'] as String)
      ..isClaimed = json['isClaimed'] as bool
      ..era = json['era'] as String
      ..symbol = json['symbol'] as String
      ..timestamp = DateTime.parse(json['timestamp'] as String);

Map<String, dynamic> _$StakingRewardToJson(StakingReward instance) =>
    <String, dynamic>{
      'accountAddress': instance.accountAddress,
      'chain': instance.chain,
      'validatorAddress': instance.validatorAddress,
      'amount': instance.amount,
      'earnedAt': instance.earnedAt.toIso8601String(),
      'claimedAt': instance.claimedAt.toIso8601String(),
      'isClaimed': instance.isClaimed,
      'era': instance.era,
      'symbol': instance.symbol,
      'timestamp': instance.timestamp.toIso8601String(),
    };

StakingOperationResult _$StakingOperationResultFromJson(
        Map<String, dynamic> json) =>
    StakingOperationResult(
      success: json['success'] as bool,
      transactionHash: json['transactionHash'] as String?,
      error: json['error'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StakingOperationResultToJson(
        StakingOperationResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'transactionHash': instance.transactionHash,
      'error': instance.error,
      'data': instance.data,
    };

StakingStats _$StakingStatsFromJson(Map<String, dynamic> json) => StakingStats(
      totalStaked: (json['totalStaked'] as num).toInt(),
      totalRewards: (json['totalRewards'] as num).toInt(),
      pendingRewards: (json['pendingRewards'] as num).toInt(),
      averageApy: (json['averageApy'] as num).toDouble(),
      activePositions: (json['activePositions'] as num).toInt(),
      supportedChains: (json['supportedChains'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      stakingRatio: (json['stakingRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$StakingStatsToJson(StakingStats instance) =>
    <String, dynamic>{
      'totalStaked': instance.totalStaked,
      'totalRewards': instance.totalRewards,
      'pendingRewards': instance.pendingRewards,
      'averageApy': instance.averageApy,
      'activePositions': instance.activePositions,
      'supportedChains': instance.supportedChains,
      'stakingRatio': instance.stakingRatio,
    };
