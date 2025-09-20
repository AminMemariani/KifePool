import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/staking_models.dart' as staking;

/// Widget displaying a list of validators
class ValidatorListWidget extends StatelessWidget {
  final List<staking.Validator> validators;
  final Function(staking.Validator) onValidatorSelected;

  const ValidatorListWidget({
    super.key,
    required this.validators,
    required this.onValidatorSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (validators.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: validators.length,
      itemBuilder: (context, index) {
        final validator = validators[index];
        return _buildValidatorCard(context, validator);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified_user_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'No Validators Found',
              style: AppTypography.headlineSmall.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Try adjusting your search or filter criteria',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidatorCard(
    BuildContext context,
    staking.Validator validator,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: () => onValidatorSelected(validator),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  // Validator status indicator
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: validator.isActive ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),

                  // Validator name
                  Expanded(
                    child: Text(
                      validator.name,
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // APY badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      '${validator.apy.toStringAsFixed(2)}% APY',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Validator details
              Row(
                children: [
                  Expanded(
                    child: _buildDetailItem(
                      context,
                      'Commission',
                      '${validator.commission.toStringAsFixed(2)}%',
                      Icons.percent,
                    ),
                  ),
                  Expanded(
                    child: _buildDetailItem(
                      context,
                      'Total Stake',
                      '${_formatStake(validator.totalStake.toDouble())} DOT',
                      Icons.account_balance_wallet,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sm),

              // Address (truncated)
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      _truncateAddress(validator.address),
                      style: AppTypography.bodySmall.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => onValidatorSelected(validator),
                      icon: const Icon(Icons.info_outline, size: 16),
                      label: const Text('Details'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _showStakeDialog(context, validator),
                      icon: const Icon(Icons.trending_up, size: 16),
                      label: const Text('Stake'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.sm,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              Text(
                value,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatStake(double stake) {
    if (stake >= 1000000) {
      return '${(stake / 1000000).toStringAsFixed(1)}M';
    } else if (stake >= 1000) {
      return '${(stake / 1000).toStringAsFixed(1)}K';
    } else {
      return stake.toStringAsFixed(0);
    }
  }

  String _truncateAddress(String address) {
    if (address.length <= 20) return address;
    return '${address.substring(0, 10)}...${address.substring(address.length - 10)}';
  }

  void _showStakeDialog(BuildContext context, staking.Validator validator) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Stake to ${validator.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('APY: ${validator.apy.toStringAsFixed(2)}%'),
            Text('Commission: ${validator.commission.toStringAsFixed(2)}%'),
            const SizedBox(height: AppSpacing.md),
            const Text('This will open the staking operation screen.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to staking operation screen
              Navigator.pushNamed(
                context,
                '/staking/operation',
                arguments: {
                  'operation': 'stake',
                  'validatorAddress': validator.address,
                  'validatorName': validator.name,
                },
              );
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
