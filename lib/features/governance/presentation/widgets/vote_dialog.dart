import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/governance_models.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/shared/providers/governance_provider.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';

/// Dialog for voting on a referendum
class VoteDialog extends StatefulWidget {
  final Referendum referendum;
  final String chain;

  const VoteDialog({
    super.key,
    required this.referendum,
    required this.chain,
  });

  @override
  State<VoteDialog> createState() => _VoteDialogState();
}

class _VoteDialogState extends State<VoteDialog> {
  VoteDecision _selectedDecision = VoteDecision.aye;
  Conviction _selectedConviction = Conviction.none;
  final TextEditingController _balanceController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadUserBalance();
  }

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  Future<void> _loadUserBalance() async {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    if (walletProvider.activeAccount != null) {
      // Load balance from wallet provider
      // For now, set a default value
      final balances = walletProvider.balances;
      ChainBalance? chainBalance;
      try {
        chainBalance = balances.firstWhere(
          (b) => b.chain.toLowerCase() == widget.chain.toLowerCase(),
        );
      } catch (e) {
        if (balances.isNotEmpty) {
          chainBalance = balances.first;
        }
      }
      if (chainBalance != null) {
        _balanceController.text = chainBalance.balance;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vote on Referendum #${widget.referendum.referendumIndex}',
                    style: AppTypography.headlineSmall.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),

              // Title
              if (widget.referendum.title != null)
                Text(
                  widget.referendum.title!,
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

              const SizedBox(height: AppSpacing.lg),

              // Vote decision selection
              Text(
                'Your Vote',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              SegmentedButton<VoteDecision>(
                segments: const [
                  ButtonSegment(
                    value: VoteDecision.aye,
                    label: Text('Aye'),
                    icon: Icon(Icons.thumb_up),
                  ),
                  ButtonSegment(
                    value: VoteDecision.nay,
                    label: Text('Nay'),
                    icon: Icon(Icons.thumb_down),
                  ),
                  ButtonSegment(
                    value: VoteDecision.abstain,
                    label: Text('Abstain'),
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                ],
                selected: {_selectedDecision},
                onSelectionChanged: (Set<VoteDecision> selection) {
                  setState(() {
                    _selectedDecision = selection.first;
                  });
                },
              ),

              const SizedBox(height: AppSpacing.lg),

              // Conviction selection
              Text(
                'Conviction',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              DropdownButtonFormField<Conviction>(
                value: _selectedConviction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select conviction',
                ),
                items: Conviction.values.map((conviction) {
                  return DropdownMenuItem(
                    value: conviction,
                    child: Text(
                      '${conviction.name} (${conviction.multiplier}x)',
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedConviction = value;
                    });
                  }
                },
              ),

              const SizedBox(height: AppSpacing.sm),
              Text(
                'Higher conviction multiplies your voting power but locks your tokens longer.',
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.7),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Balance input
              Text(
                'Voting Balance',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _balanceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount to vote with',
                  suffixText: 'DOT',
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSubmitting
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitVote,
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Submit Vote'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitVote() async {
    if (_balanceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a voting balance'),
        ),
      );
      return;
    }

    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    if (walletProvider.activeAccount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No active wallet account'),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final governanceProvider =
          Provider.of<GovernanceProvider>(context, listen: false);

      final voteRequest = VoteRequest(
        referendumIndex: widget.referendum.referendumIndex,
        chain: widget.chain,
        voter: walletProvider.activeAccount!.address,
        decision: _selectedDecision,
        balance: _balanceController.text,
        conviction: _selectedConviction,
      );

      final txHash = await governanceProvider.submitVote(voteRequest);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Vote submitted successfully! TX: ${txHash.substring(0, 10)}...'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit vote: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}

