import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staking_models.g.dart';

/// Validator information
@collection
@JsonSerializable()
class Validator {
  Id id = Isar.autoIncrement;
  late String address;
  late String name;
  late String chain;
  late double commission; // Commission rate (0.0 to 1.0)
  late double apy; // Annual Percentage Yield
  late int totalStake; // Total stake in the validator
  late int nominatorCount; // Number of nominators
  late bool isActive; // Whether validator is active
  late bool isOversubscribed; // Whether validator is oversubscribed
  late DateTime lastUpdated;
  late String identity; // Validator identity info
  late String website;
  late String description;

  Validator();

  factory Validator.fromJson(Map<String, dynamic> json) =>
      _$ValidatorFromJson(json);
  Map<String, dynamic> toJson() => _$ValidatorToJson(this);
}

/// Nomination pool information
@collection
@JsonSerializable()
class NominationPool {
  Id id = Isar.autoIncrement;
  late int poolId;
  late String name;
  late String chain;
  late String state; // Active, Destroying, etc.
  late double apy; // Annual Percentage Yield
  late int totalStake; // Total stake in the pool
  late int memberCount; // Number of pool members
  late String poolAccount; // Pool account address
  late DateTime lastUpdated;
  late String description;

  NominationPool();

  // Getters for compatibility with UI
  bool get isActive => state.toLowerCase() == 'active';

  factory NominationPool.fromJson(Map<String, dynamic> json) =>
      _$NominationPoolFromJson(json);
  Map<String, dynamic> toJson() => _$NominationPoolToJson(this);
}

/// User's staking position
@collection
@JsonSerializable()
class StakingPosition {
  Id id = Isar.autoIncrement;
  late String accountAddress;
  late String chain;
  late String stakingType; // 'validator' or 'pool'
  late String targetAddress; // Validator address or pool ID
  late String targetName; // Validator name or pool name
  late int stakedAmount; // Amount staked
  late int pendingRewards; // Pending rewards to claim
  late int totalRewards; // Total rewards earned
  late DateTime stakedAt;
  late DateTime lastClaimed;
  late bool isActive;
  late String status; // Active, Unstaking, etc.
  late int unbondingAmount; // Amount being unbonded
  late DateTime unbondingEndsAt; // When unbonding completes
  late double apy; // Current APY for this position
  late int poolId; // Pool ID if staking to pool
  late String validatorAddress; // Validator address if staking to validator

  StakingPosition();

  // Getters for compatibility with UI
  String get name => targetName;
  String get type => stakingType;
  double get rewards => pendingRewards.toDouble();
  double get unbondingProgress {
    if (unbondingAmount == 0) return 0.0;
    final now = DateTime.now();
    final totalUnbondingTime = const Duration(days: 28);
    final elapsed = now.difference(
      unbondingEndsAt.subtract(totalUnbondingTime),
    );
    return (elapsed.inSeconds / totalUnbondingTime.inSeconds).clamp(0.0, 1.0);
  }

  int get unbondingDaysRemaining {
    if (unbondingAmount == 0) return 0;
    final now = DateTime.now();
    final remaining = unbondingEndsAt.difference(now);
    return remaining.inDays.clamp(0, 28);
  }

  factory StakingPosition.fromJson(Map<String, dynamic> json) =>
      _$StakingPositionFromJson(json);
  Map<String, dynamic> toJson() => _$StakingPositionToJson(this);
}

/// Staking reward information
@collection
@JsonSerializable()
class StakingReward {
  Id id = Isar.autoIncrement;
  late String accountAddress;
  late String chain;
  late String validatorAddress;
  late int amount; // Reward amount
  late DateTime earnedAt;
  late DateTime claimedAt;
  late bool isClaimed;
  late String era; // Era when reward was earned
  late String symbol; // Token symbol (e.g., 'DOT')
  late DateTime timestamp; // When reward was earned

  StakingReward();

  factory StakingReward.fromJson(Map<String, dynamic> json) =>
      _$StakingRewardFromJson(json);
  Map<String, dynamic> toJson() => _$StakingRewardToJson(this);
}

/// Staking operation result
@JsonSerializable()
class StakingOperationResult {
  final bool success;
  final String? transactionHash;
  final String? error;
  final Map<String, dynamic>? data;

  const StakingOperationResult({
    required this.success,
    this.transactionHash,
    this.error,
    this.data,
  });

  factory StakingOperationResult.fromJson(Map<String, dynamic> json) =>
      _$StakingOperationResultFromJson(json);
  Map<String, dynamic> toJson() => _$StakingOperationResultToJson(this);
}

/// Staking statistics
@JsonSerializable()
class StakingStats {
  final int totalStaked;
  final int totalRewards;
  final int pendingRewards;
  final double averageApy;
  final int activePositions;
  final List<String> supportedChains;
  final double stakingRatio; // Ratio of staked to total balance

  const StakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.pendingRewards,
    required this.averageApy,
    required this.activePositions,
    required this.supportedChains,
    required this.stakingRatio,
  });

  factory StakingStats.fromJson(Map<String, dynamic> json) =>
      _$StakingStatsFromJson(json);
  Map<String, dynamic> toJson() => _$StakingStatsToJson(this);
}

/// Staking error types
enum StakingErrorType {
  validatorNotFound,
  poolNotFound,
  insufficientBalance,
  invalidAmount,
  networkError,
  transactionFailed,
  validatorOversubscribed,
  unbondingPeriod,
  unknown,
}

/// Staking exception
class StakingException implements Exception {
  final StakingErrorType type;
  final String message;
  final String? details;

  const StakingException({
    required this.type,
    required this.message,
    this.details,
  });

  @override
  String toString() {
    return 'StakingException: [${type.name}] $message ${details != null ? '- $details' : ''}';
  }
}
