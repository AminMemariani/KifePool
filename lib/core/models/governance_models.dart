import 'package:json_annotation/json_annotation.dart';

part 'governance_models.g.dart';

/// Referendum status
enum ReferendumStatus {
  @JsonValue('submitted')
  submitted,
  @JsonValue('deciding')
  deciding,
  @JsonValue('confirming')
  confirming,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('timedOut')
  timedOut,
  @JsonValue('killed')
  killed,
}

/// Vote decision
enum VoteDecision {
  @JsonValue('aye')
  aye,
  @JsonValue('nay')
  nay,
  @JsonValue('abstain')
  abstain,
}

/// Conviction multiplier for voting
enum Conviction {
  @JsonValue('none')
  none(0.1),
  @JsonValue('locked1x')
  locked1x(1.0),
  @JsonValue('locked2x')
  locked2x(2.0),
  @JsonValue('locked3x')
  locked3x(3.0),
  @JsonValue('locked4x')
  locked4x(4.0),
  @JsonValue('locked5x')
  locked5x(5.0),
  @JsonValue('locked6x')
  locked6x(6.0);

  final double multiplier;
  const Conviction(this.multiplier);
}

/// Referendum information
@JsonSerializable()
class Referendum {
  final int referendumIndex;
  final String chain;
  final ReferendumStatus status;
  final String? title;
  final String? description;
  final String proposer;
  final String? proposalHash;
  final DateTime? submittedAt;
  final DateTime? votingEndsAt;
  final DateTime? enactmentAfter;
  final String? trackId;
  final String? trackName;
  final String? origin;
  final VoteTally? tally;
  final int? ayeVotes;
  final int? nayVotes;
  final double? approvalPercentage;
  final double? supportPercentage;
  final String? imageHash;
  final Map<String, dynamic>? metadata;

  const Referendum({
    required this.referendumIndex,
    required this.chain,
    required this.status,
    this.title,
    this.description,
    required this.proposer,
    this.proposalHash,
    this.submittedAt,
    this.votingEndsAt,
    this.enactmentAfter,
    this.trackId,
    this.trackName,
    this.origin,
    this.tally,
    this.ayeVotes,
    this.nayVotes,
    this.approvalPercentage,
    this.supportPercentage,
    this.imageHash,
    this.metadata,
  });

  factory Referendum.fromJson(Map<String, dynamic> json) =>
      _$ReferendumFromJson(json);
  Map<String, dynamic> toJson() => _$ReferendumToJson(this);

  bool get isActive =>
      status == ReferendumStatus.submitted ||
      status == ReferendumStatus.deciding ||
      status == ReferendumStatus.confirming;
}

/// Vote tally information
@JsonSerializable()
class VoteTally {
  final String aye;
  final String nay;
  final String support;

  const VoteTally({
    required this.aye,
    required this.nay,
    required this.support,
  });

  factory VoteTally.fromJson(Map<String, dynamic> json) =>
      _$VoteTallyFromJson(json);
  Map<String, dynamic> toJson() => _$VoteTallyToJson(this);
}

/// User's vote on a referendum
@JsonSerializable()
class UserVote {
  final int referendumIndex;
  final String chain;
  final String voter;
  final VoteDecision decision;
  final String balance;
  final Conviction conviction;
  final DateTime votedAt;
  final String? transactionHash;

  const UserVote({
    required this.referendumIndex,
    required this.chain,
    required this.voter,
    required this.decision,
    required this.balance,
    required this.conviction,
    required this.votedAt,
    this.transactionHash,
  });

  factory UserVote.fromJson(Map<String, dynamic> json) =>
      _$UserVoteFromJson(json);
  Map<String, dynamic> toJson() => _$UserVoteToJson(this);
}

/// Vote request for submitting a vote
@JsonSerializable()
class VoteRequest {
  final int referendumIndex;
  final String chain;
  final String voter;
  final VoteDecision decision;
  final String balance;
  final Conviction conviction;

  const VoteRequest({
    required this.referendumIndex,
    required this.chain,
    required this.voter,
    required this.decision,
    required this.balance,
    required this.conviction,
  });

  factory VoteRequest.fromJson(Map<String, dynamic> json) =>
      _$VoteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VoteRequestToJson(this);
}

/// Track information for OpenGov
@JsonSerializable()
class Track {
  final String id;
  final String name;
  final String description;
  final String? maxDeciding;
  final String? decisionDeposit;
  final String? preparePeriod;
  final String? decisionPeriod;
  final String? confirmPeriod;
  final String? minEnactmentPeriod;
  final String? minApproval;
  final String? minSupport;

  const Track({
    required this.id,
    required this.name,
    required this.description,
    this.maxDeciding,
    this.decisionDeposit,
    this.preparePeriod,
    this.decisionPeriod,
    this.confirmPeriod,
    this.minEnactmentPeriod,
    this.minApproval,
    this.minSupport,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
