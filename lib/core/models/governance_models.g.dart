// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Referendum _$ReferendumFromJson(Map<String, dynamic> json) => Referendum(
      referendumIndex: (json['referendumIndex'] as num).toInt(),
      chain: json['chain'] as String,
      status: $enumDecode(_$ReferendumStatusEnumMap, json['status']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      proposer: json['proposer'] as String,
      proposalHash: json['proposalHash'] as String?,
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      votingEndsAt: json['votingEndsAt'] == null
          ? null
          : DateTime.parse(json['votingEndsAt'] as String),
      enactmentAfter: json['enactmentAfter'] == null
          ? null
          : DateTime.parse(json['enactmentAfter'] as String),
      trackId: json['trackId'] as String?,
      trackName: json['trackName'] as String?,
      origin: json['origin'] as String?,
      tally: json['tally'] == null
          ? null
          : VoteTally.fromJson(json['tally'] as Map<String, dynamic>),
      ayeVotes: (json['ayeVotes'] as num?)?.toInt(),
      nayVotes: (json['nayVotes'] as num?)?.toInt(),
      approvalPercentage: (json['approvalPercentage'] as num?)?.toDouble(),
      supportPercentage: (json['supportPercentage'] as num?)?.toDouble(),
      imageHash: json['imageHash'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ReferendumToJson(Referendum instance) =>
    <String, dynamic>{
      'referendumIndex': instance.referendumIndex,
      'chain': instance.chain,
      'status': _$ReferendumStatusEnumMap[instance.status]!,
      'title': instance.title,
      'description': instance.description,
      'proposer': instance.proposer,
      'proposalHash': instance.proposalHash,
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'votingEndsAt': instance.votingEndsAt?.toIso8601String(),
      'enactmentAfter': instance.enactmentAfter?.toIso8601String(),
      'trackId': instance.trackId,
      'trackName': instance.trackName,
      'origin': instance.origin,
      'tally': instance.tally,
      'ayeVotes': instance.ayeVotes,
      'nayVotes': instance.nayVotes,
      'approvalPercentage': instance.approvalPercentage,
      'supportPercentage': instance.supportPercentage,
      'imageHash': instance.imageHash,
      'metadata': instance.metadata,
    };

const _$ReferendumStatusEnumMap = {
  ReferendumStatus.submitted: 'submitted',
  ReferendumStatus.deciding: 'deciding',
  ReferendumStatus.confirming: 'confirming',
  ReferendumStatus.approved: 'approved',
  ReferendumStatus.rejected: 'rejected',
  ReferendumStatus.cancelled: 'cancelled',
  ReferendumStatus.timedOut: 'timedOut',
  ReferendumStatus.killed: 'killed',
};

VoteTally _$VoteTallyFromJson(Map<String, dynamic> json) => VoteTally(
      aye: json['aye'] as String,
      nay: json['nay'] as String,
      support: json['support'] as String,
    );

Map<String, dynamic> _$VoteTallyToJson(VoteTally instance) => <String, dynamic>{
      'aye': instance.aye,
      'nay': instance.nay,
      'support': instance.support,
    };

UserVote _$UserVoteFromJson(Map<String, dynamic> json) => UserVote(
      referendumIndex: (json['referendumIndex'] as num).toInt(),
      chain: json['chain'] as String,
      voter: json['voter'] as String,
      decision: $enumDecode(_$VoteDecisionEnumMap, json['decision']),
      balance: json['balance'] as String,
      conviction: $enumDecode(_$ConvictionEnumMap, json['conviction']),
      votedAt: DateTime.parse(json['votedAt'] as String),
      transactionHash: json['transactionHash'] as String?,
    );

Map<String, dynamic> _$UserVoteToJson(UserVote instance) => <String, dynamic>{
      'referendumIndex': instance.referendumIndex,
      'chain': instance.chain,
      'voter': instance.voter,
      'decision': _$VoteDecisionEnumMap[instance.decision]!,
      'balance': instance.balance,
      'conviction': _$ConvictionEnumMap[instance.conviction]!,
      'votedAt': instance.votedAt.toIso8601String(),
      'transactionHash': instance.transactionHash,
    };

const _$VoteDecisionEnumMap = {
  VoteDecision.aye: 'aye',
  VoteDecision.nay: 'nay',
  VoteDecision.abstain: 'abstain',
};

const _$ConvictionEnumMap = {
  Conviction.none: 'none',
  Conviction.locked1x: 'locked1x',
  Conviction.locked2x: 'locked2x',
  Conviction.locked3x: 'locked3x',
  Conviction.locked4x: 'locked4x',
  Conviction.locked5x: 'locked5x',
  Conviction.locked6x: 'locked6x',
};

VoteRequest _$VoteRequestFromJson(Map<String, dynamic> json) => VoteRequest(
      referendumIndex: (json['referendumIndex'] as num).toInt(),
      chain: json['chain'] as String,
      voter: json['voter'] as String,
      decision: $enumDecode(_$VoteDecisionEnumMap, json['decision']),
      balance: json['balance'] as String,
      conviction: $enumDecode(_$ConvictionEnumMap, json['conviction']),
    );

Map<String, dynamic> _$VoteRequestToJson(VoteRequest instance) =>
    <String, dynamic>{
      'referendumIndex': instance.referendumIndex,
      'chain': instance.chain,
      'voter': instance.voter,
      'decision': _$VoteDecisionEnumMap[instance.decision]!,
      'balance': instance.balance,
      'conviction': _$ConvictionEnumMap[instance.conviction]!,
    };

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      maxDeciding: json['maxDeciding'] as String?,
      decisionDeposit: json['decisionDeposit'] as String?,
      preparePeriod: json['preparePeriod'] as String?,
      decisionPeriod: json['decisionPeriod'] as String?,
      confirmPeriod: json['confirmPeriod'] as String?,
      minEnactmentPeriod: json['minEnactmentPeriod'] as String?,
      minApproval: json['minApproval'] as String?,
      minSupport: json['minSupport'] as String?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'maxDeciding': instance.maxDeciding,
      'decisionDeposit': instance.decisionDeposit,
      'preparePeriod': instance.preparePeriod,
      'decisionPeriod': instance.decisionPeriod,
      'confirmPeriod': instance.confirmPeriod,
      'minEnactmentPeriod': instance.minEnactmentPeriod,
      'minApproval': instance.minApproval,
      'minSupport': instance.minSupport,
    };
