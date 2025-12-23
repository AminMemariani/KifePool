import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/governance_models.dart';
import 'package:kifepool/core/services/governance_service.dart';

/// Provider for managing governance state
class GovernanceProvider extends ChangeNotifier {
  final GovernanceService _governanceService = GovernanceService();

  String? _selectedChain;
  List<Referendum> _referenda = [];
  List<UserVote> _userVotes = [];
  List<Track> _tracks = [];
  bool _isLoading = false;
  String? _error;
  Referendum? _selectedReferendum;

  // Getters
  String? get selectedChain => _selectedChain;
  List<Referendum> get referenda => _referenda;
  List<UserVote> get userVotes => _userVotes;
  List<Track> get tracks => _tracks;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Referendum? get selectedReferendum => _selectedReferendum;

  List<Referendum> get activeReferenda =>
      _referenda.where((r) => r.isActive).toList();

  /// Set selected chain
  void setSelectedChain(String? chain) {
    _selectedChain = chain;
    notifyListeners();
    if (chain != null) {
      loadReferenda();
      loadTracks();
    }
  }

  /// Load referenda for the selected chain
  Future<void> loadReferenda() async {
    if (_selectedChain == null) return;

    _setLoading(true);
    _clearError();

    try {
      _referenda = await _governanceService.getAllReferenda(_selectedChain!);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load referenda: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Load active referenda only
  Future<void> loadActiveReferenda() async {
    if (_selectedChain == null) return;

    _setLoading(true);
    _clearError();

    try {
      _referenda = await _governanceService.getActiveReferenda(_selectedChain!);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load active referenda: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Load user votes for a specific address
  Future<void> loadUserVotes(String address) async {
    if (_selectedChain == null) return;

    _setLoading(true);
    _clearError();

    try {
      _userVotes =
          await _governanceService.getUserVotes(_selectedChain!, address);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load user votes: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Load tracks
  Future<void> loadTracks() async {
    if (_selectedChain == null) return;

    _setLoading(true);
    _clearError();

    try {
      _tracks = await _governanceService.getTracks(_selectedChain!);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load tracks: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Get a specific referendum
  Future<void> loadReferendum(int referendumIndex) async {
    if (_selectedChain == null) return;

    _setLoading(true);
    _clearError();

    try {
      _selectedReferendum =
          await _governanceService.getReferendum(_selectedChain!, referendumIndex);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load referendum: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Submit a vote
  Future<String> submitVote(VoteRequest voteRequest) async {
    _setLoading(true);
    _clearError();

    try {
      final txHash = await _governanceService.submitVote(voteRequest);
      
      // Reload referenda and user votes after voting
      await Future.wait([
        loadReferenda(),
        if (voteRequest.voter.isNotEmpty) loadUserVotes(voteRequest.voter),
      ]);

      return txHash;
    } catch (e) {
      _setError('Failed to submit vote: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// Check if user has voted on a referendum
  bool hasUserVoted(int referendumIndex, String address) {
    return _userVotes.any(
      (vote) =>
          vote.referendumIndex == referendumIndex && vote.voter == address,
    );
  }

  /// Get user's vote for a referendum
  UserVote? getUserVote(int referendumIndex, String address) {
    try {
      return _userVotes.firstWhere(
        (vote) =>
            vote.referendumIndex == referendumIndex && vote.voter == address,
      );
    } catch (e) {
      return null;
    }
  }

  /// Set selected referendum
  void setSelectedReferendum(Referendum? referendum) {
    _selectedReferendum = referendum;
    notifyListeners();
  }

  /// Clear selected referendum
  void clearSelectedReferendum() {
    _selectedReferendum = null;
    notifyListeners();
  }

  /// Refresh all data
  Future<void> refresh() async {
    if (_selectedChain == null) return;
    await Future.wait([
      loadReferenda(),
      loadTracks(),
    ]);
  }

  /// Set loading state
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Set error message
  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  /// Clear error message
  void _clearError() {
    _error = null;
    notifyListeners();
  }
}

