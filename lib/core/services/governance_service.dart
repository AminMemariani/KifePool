import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/governance_models.dart';
import '../models/blockchain_models.dart';

/// Service for interacting with Polkadot/Kusama OpenGov
class GovernanceService {
  static final GovernanceService _instance = GovernanceService._internal();
  factory GovernanceService() => _instance;
  GovernanceService._internal();

  /// Check if chain supports OpenGov
  static bool supportsOpenGov(String chain) {
    final chainLower = chain.toLowerCase();
    return chainLower == 'polkadot' || chainLower == 'kusama';
  }

  /// Get all active referenda for a chain
  Future<List<Referendum>> getActiveReferenda(String chain) async {
    if (!supportsOpenGov(chain)) {
      return [];
    }

    try {
      final network = _getBlockchainNetwork(chain);
      if (network == null) return [];

      // Get all referenda from the referendum pallet
      final referenda = await _fetchReferenda(network);

      // Filter active referenda
      return referenda.where((r) => r.isActive).toList();
    } catch (e) {
      debugPrint('Error fetching active referenda: $e');
      return [];
    }
  }

  /// Get all referenda (active and inactive) for a chain
  Future<List<Referendum>> getAllReferenda(String chain) async {
    if (!supportsOpenGov(chain)) {
      return [];
    }

    try {
      final network = _getBlockchainNetwork(chain);
      if (network == null) return [];

      return await _fetchReferenda(network);
    } catch (e) {
      debugPrint('Error fetching referenda: $e');
      return [];
    }
  }

  /// Get a specific referendum by index
  Future<Referendum?> getReferendum(String chain, int referendumIndex) async {
    if (!supportsOpenGov(chain)) {
      return null;
    }

    try {
      final network = _getBlockchainNetwork(chain);
      if (network == null) return null;

      final referenda = await _fetchReferenda(network);
      try {
        return referenda.firstWhere(
          (r) => r.referendumIndex == referendumIndex,
        );
      } catch (e) {
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching referendum: $e');
      return null;
    }
  }

  /// Get user's votes for a chain
  Future<List<UserVote>> getUserVotes(String chain, String address) async {
    if (!supportsOpenGov(chain)) {
      return [];
    }

    try {
      final network = _getBlockchainNetwork(chain);
      if (network == null) return [];

      // Query the voting pallet for user's votes
      return await _fetchUserVotes(network, address);
    } catch (e) {
      debugPrint('Error fetching user votes: $e');
      return [];
    }
  }

  /// Submit a vote on a referendum
  Future<String> submitVote(VoteRequest voteRequest) async {
    if (!supportsOpenGov(voteRequest.chain)) {
      throw Exception('Chain does not support OpenGov');
    }

    try {
      final network = _getBlockchainNetwork(voteRequest.chain);
      if (network == null) {
        throw Exception('Unsupported chain: ${voteRequest.chain}');
      }

      // Create and submit the vote transaction
      // This would use the wallet service to sign and submit
      return await _submitVoteTransaction(network, voteRequest);
    } catch (e) {
      debugPrint('Error submitting vote: $e');
      rethrow;
    }
  }

  /// Get tracks for OpenGov
  Future<List<Track>> getTracks(String chain) async {
    if (!supportsOpenGov(chain)) {
      return [];
    }

    try {
      final network = _getBlockchainNetwork(chain);
      if (network == null) return [];

      return await _fetchTracks(network);
    } catch (e) {
      debugPrint('Error fetching tracks: $e');
      return [];
    }
  }

  /// Fetch referenda from blockchain
  Future<List<Referendum>> _fetchReferenda(BlockchainNetwork network) async {
    // In test mode, return mock data
    if (_isTestEnvironment()) {
      return _getMockReferenda(network.name);
    }

    try {
      // Query referenda from the referendum pallet
      // This is a simplified implementation - in production you'd need
      // to properly decode the storage and handle pagination
      // For now, return mock data as the RPC method is private
      // In production, you'd need to add a public method to BlockchainService
      // or use a Substrate API library
      return _getMockReferenda(network.name);
    } catch (e) {
      debugPrint('Error fetching referenda from storage: $e');
      // Return mock data as fallback
      return _getMockReferenda(network.name);
    }
  }

  /// Fetch user votes from blockchain
  Future<List<UserVote>> _fetchUserVotes(
    BlockchainNetwork network,
    String address,
  ) async {
    // In test mode, return empty list
    if (_isTestEnvironment()) {
      return [];
    }

    try {
      // Query voting storage for the user's address
      // This would query the ConvictionVoting pallet
      return [];
    } catch (e) {
      debugPrint('Error fetching user votes: $e');
      return [];
    }
  }

  /// Submit vote transaction
  Future<String> _submitVoteTransaction(
    BlockchainNetwork network,
    VoteRequest voteRequest,
  ) async {
    // This would create and submit a transaction using the wallet service
    // For now, return a mock transaction hash
    if (_isTestEnvironment()) {
      return '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';
    }

    // TODO: Implement actual transaction submission
    throw UnimplementedError('Vote submission not yet implemented');
  }

  /// Fetch tracks from blockchain
  Future<List<Track>> _fetchTracks(BlockchainNetwork network) async {
    // In test mode, return mock tracks
    if (_isTestEnvironment()) {
      return _getMockTracks(network.name);
    }

    try {
      // Query tracks from the Referenda pallet
      return _getMockTracks(network.name);
    } catch (e) {
      debugPrint('Error fetching tracks: $e');
      return _getMockTracks(network.name);
    }
  }

  /// Get blockchain network from chain string
  BlockchainNetwork? _getBlockchainNetwork(String chain) {
    final chainLower = chain.toLowerCase();
    switch (chainLower) {
      case 'polkadot':
        return BlockchainNetwork.polkadot;
      case 'kusama':
        return BlockchainNetwork.kusama;
      default:
        return null;
    }
  }

  /// Check if in test environment
  bool _isTestEnvironment() {
    return const bool.fromEnvironment('dart.vm.product') == false &&
        (const bool.fromEnvironment('flutter.inspector.structuredErrors') ==
                true ||
            const bool.fromEnvironment('dart.vm.test') == true ||
            kDebugMode);
  }

  /// Get mock referenda for testing
  List<Referendum> _getMockReferenda(String chain) {
    return [
      Referendum(
        referendumIndex: 1,
        chain: chain,
        status: ReferendumStatus.deciding,
        title: 'Treasury Proposal: Ecosystem Development Fund',
        description:
            'Proposal to allocate funds for ecosystem development initiatives.',
        proposer: '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY',
        proposalHash: '0x1234567890abcdef',
        submittedAt: DateTime.now().subtract(const Duration(days: 2)),
        votingEndsAt: DateTime.now().add(const Duration(days: 5)),
        trackId: '0',
        trackName: 'Root',
        origin: 'Root',
        tally: const VoteTally(
          aye: '1000000000000000000',
          nay: '500000000000000000',
          support: '2000000000000000000',
        ),
        ayeVotes: 150,
        nayVotes: 75,
        approvalPercentage: 66.7,
        supportPercentage: 45.2,
      ),
      Referendum(
        referendumIndex: 2,
        chain: chain,
        status: ReferendumStatus.confirming,
        title: 'Runtime Upgrade: v9430',
        description: 'Proposal to upgrade runtime to version 9430.',
        proposer: '5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty',
        proposalHash: '0xabcdef1234567890',
        submittedAt: DateTime.now().subtract(const Duration(days: 5)),
        votingEndsAt: DateTime.now().add(const Duration(days: 2)),
        trackId: '0',
        trackName: 'Root',
        origin: 'Root',
        tally: const VoteTally(
          aye: '5000000000000000000',
          nay: '100000000000000000',
          support: '8000000000000000000',
        ),
        ayeVotes: 450,
        nayVotes: 25,
        approvalPercentage: 95.0,
        supportPercentage: 78.5,
      ),
      Referendum(
        referendumIndex: 3,
        chain: chain,
        status: ReferendumStatus.submitted,
        title: 'Parachain Slot Renewal',
        description: 'Proposal to renew parachain slot allocation.',
        proposer: '5FLSigC9HGRKVhB9FiEo4Y3koPsNmBmLJbpXg2mp1hchcASU',
        proposalHash: '0x9876543210fedcba',
        submittedAt: DateTime.now().subtract(const Duration(days: 1)),
        votingEndsAt: DateTime.now().add(const Duration(days: 7)),
        trackId: '1',
        trackName: 'Whitelisted Caller',
        origin: 'Whitelisted Caller',
        tally: const VoteTally(
          aye: '200000000000000000',
          nay: '50000000000000000',
          support: '300000000000000000',
        ),
        ayeVotes: 30,
        nayVotes: 10,
        approvalPercentage: 80.0,
        supportPercentage: 25.0,
      ),
    ];
  }

  /// Get mock tracks for testing
  List<Track> _getMockTracks(String chain) {
    return [
      const Track(
        id: '0',
        name: 'Root',
        description: 'Origin for system-level changes',
      ),
      const Track(
        id: '1',
        name: 'Whitelisted Caller',
        description: 'Origin for whitelisted calls',
      ),
      const Track(
        id: '10',
        name: 'Staking Admin',
        description: 'Origin for staking administration',
      ),
      const Track(
        id: '11',
        name: 'Treasurer',
        description: 'Origin for treasury operations',
      ),
    ];
  }
}
