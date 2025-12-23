import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/governance_provider.dart';
import 'package:kifepool/core/models/governance_models.dart';
import 'package:kifepool/shared/widgets/loading_widgets.dart';
import '../widgets/referendum_card.dart';
import '../widgets/vote_dialog.dart';

/// Main governance screen for viewing and voting on referenda
class GovernanceScreen extends StatefulWidget {
  final String chain;

  const GovernanceScreen({super.key, required this.chain});

  @override
  State<GovernanceScreen> createState() => _GovernanceScreenState();
}

class _GovernanceScreenState extends State<GovernanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GovernanceProvider>(context, listen: false);
      provider.setSelectedChain(widget.chain);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenGov - ${widget.chain}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: Consumer<GovernanceProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.referenda.isEmpty) {
            return const Center(child: LoadingIndicator());
          }

          if (provider.error != null && provider.referenda.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    provider.error!,
                    style: AppTypography.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton(
                    onPressed: () => provider.refresh(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.refresh(),
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildActiveReferendaTab(provider),
                _buildAllReferendaTab(provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActiveReferendaTab(GovernanceProvider provider) {
    final activeReferenda = provider.activeReferenda;

    if (activeReferenda.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.how_to_vote_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'No active referenda',
              style: AppTypography.bodyLarge.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: activeReferenda.length,
      itemBuilder: (context, index) {
        final referendum = activeReferenda[index];
        return ReferendumCard(
          referendum: referendum,
          onTap: () {
            _showReferendumDetails(context, referendum, provider);
          },
        );
      },
    );
  }

  Widget _buildAllReferendaTab(GovernanceProvider provider) {
    final referenda = provider.referenda;

    if (referenda.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.how_to_vote_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'No referenda found',
              style: AppTypography.bodyLarge.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: referenda.length,
      itemBuilder: (context, index) {
        final referendum = referenda[index];
        return ReferendumCard(
          referendum: referendum,
          onTap: () {
            _showReferendumDetails(context, referendum, provider);
          },
        );
      },
    );
  }

  void _showReferendumDetails(
    BuildContext context,
    Referendum referendum,
    GovernanceProvider provider,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ReferendumDetailScreen(referendum: referendum, chain: widget.chain),
      ),
    );
  }
}

/// Referendum detail screen
class ReferendumDetailScreen extends StatefulWidget {
  final Referendum referendum;
  final String chain;

  const ReferendumDetailScreen({
    super.key,
    required this.referendum,
    required this.chain,
  });

  @override
  State<ReferendumDetailScreen> createState() => _ReferendumDetailScreenState();
}

class _ReferendumDetailScreenState extends State<ReferendumDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final referendum = widget.referendum;
    final provider = Provider.of<GovernanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Referendum #${referendum.referendumIndex}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: _getStatusColor(referendum.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Text(
                _getStatusText(referendum.status),
                style: AppTypography.bodySmall.copyWith(
                  color: _getStatusColor(referendum.status),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Title
            if (referendum.title != null)
              Text(
                referendum.title!,
                style: AppTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: AppSpacing.md),

            // Description
            if (referendum.description != null)
              Text(referendum.description!, style: AppTypography.bodyMedium),

            const SizedBox(height: AppSpacing.lg),

            // Voting stats
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Voting Statistics',
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildStatRow('Aye Votes', '${referendum.ayeVotes ?? 0}'),
                    _buildStatRow('Nay Votes', '${referendum.nayVotes ?? 0}'),
                    if (referendum.approvalPercentage != null)
                      _buildStatRow(
                        'Approval',
                        '${referendum.approvalPercentage!.toStringAsFixed(1)}%',
                      ),
                    if (referendum.supportPercentage != null)
                      _buildStatRow(
                        'Support',
                        '${referendum.supportPercentage!.toStringAsFixed(1)}%',
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Track info
            if (referendum.trackName != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track',
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        referendum.trackName!,
                        style: AppTypography.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: AppSpacing.lg),

            // Dates
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Timeline',
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    if (referendum.submittedAt != null)
                      _buildDateRow('Submitted', referendum.submittedAt!),
                    if (referendum.votingEndsAt != null)
                      _buildDateRow('Voting Ends', referendum.votingEndsAt!),
                  ],
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Vote button (only for active referenda)
            if (referendum.isActive)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showVoteDialog(context, referendum, provider);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                    ),
                  ),
                  child: const Text('Vote'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(String label, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Text(
            '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ReferendumStatus status) {
    switch (status) {
      case ReferendumStatus.approved:
        return Colors.green;
      case ReferendumStatus.rejected:
      case ReferendumStatus.cancelled:
      case ReferendumStatus.killed:
        return Colors.red;
      case ReferendumStatus.deciding:
      case ReferendumStatus.confirming:
        return Colors.orange;
      case ReferendumStatus.submitted:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(ReferendumStatus status) {
    switch (status) {
      case ReferendumStatus.submitted:
        return 'Submitted';
      case ReferendumStatus.deciding:
        return 'Deciding';
      case ReferendumStatus.confirming:
        return 'Confirming';
      case ReferendumStatus.approved:
        return 'Approved';
      case ReferendumStatus.rejected:
        return 'Rejected';
      case ReferendumStatus.cancelled:
        return 'Cancelled';
      case ReferendumStatus.timedOut:
        return 'Timed Out';
      case ReferendumStatus.killed:
        return 'Killed';
    }
  }

  void _showVoteDialog(
    BuildContext context,
    Referendum referendum,
    GovernanceProvider provider,
  ) {
    showDialog(
      context: context,
      builder: (context) =>
          VoteDialog(referendum: referendum, chain: widget.chain),
    );
  }
}
