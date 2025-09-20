import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/staking_provider.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_confirmation_dialog.dart';
import 'package:kifepool/features/staking/presentation/widgets/staking_success_dialog.dart';

/// Staking operation screen for stake/unstake/claim operations
class StakingOperationScreen extends StatefulWidget {
  final String operation; // 'stake', 'unstake', 'claim'
  final String? validatorAddress;
  final int? poolId;
  final String? validatorName;
  final String? poolName;

  const StakingOperationScreen({
    super.key,
    required this.operation,
    this.validatorAddress,
    this.poolId,
    this.validatorName,
    this.poolName,
  });

  @override
  State<StakingOperationScreen> createState() => _StakingOperationScreenState();
}

class _StakingOperationScreenState extends State<StakingOperationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  bool _isProcessing = false;
  String? _error;
  double _availableBalance = 1000.0; // Mock balance

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getOperationTitle()),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showOperationInfo,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOperationHeader(),
              const SizedBox(height: AppSpacing.xl),
              _buildAmountInput(),
              const SizedBox(height: AppSpacing.lg),
              _buildBalanceInfo(),
              const SizedBox(height: AppSpacing.lg),
              _buildOperationDetails(),
              const SizedBox(height: AppSpacing.xl),
              _buildActionButton(),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.md),
                _buildErrorDisplay(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperationHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getOperationIcon(),
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getOperationTitle(),
                        style: AppTypography.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        _getOperationSubtitle(),
                        style: AppTypography.bodyMedium.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.validatorName != null || widget.poolName != null) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Row(
                  children: [
                    Icon(
                      widget.validatorName != null
                          ? Icons.verified_user
                          : Icons.group,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      widget.validatorName ?? widget.poolName ?? '',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amount', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        TextFormField(
          controller: _amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: InputDecoration(
            hintText: 'Enter amount to ${widget.operation}',
            suffixText: 'DOT',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.account_balance_wallet),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an amount';
            }

            final amount = double.tryParse(value);
            if (amount == null || amount <= 0) {
              return 'Please enter a valid amount';
            }

            if (widget.operation == 'stake' && amount > _availableBalance) {
              return 'Insufficient balance';
            }

            return null;
          },
          onChanged: (value) {
            setState(() {
              _error = null;
            });
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _amountController.text = (_availableBalance * 0.25)
                    .toStringAsFixed(2);
              },
              child: const Text('25%'),
            ),
            TextButton(
              onPressed: () {
                _amountController.text = (_availableBalance * 0.5)
                    .toStringAsFixed(2);
              },
              child: const Text('50%'),
            ),
            TextButton(
              onPressed: () {
                _amountController.text = (_availableBalance * 0.75)
                    .toStringAsFixed(2);
              },
              child: const Text('75%'),
            ),
            TextButton(
              onPressed: () {
                _amountController.text = _availableBalance.toStringAsFixed(2);
              },
              child: const Text('Max'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceInfo() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Available Balance', style: AppTypography.bodyMedium),
          Text(
            '${_availableBalance.toStringAsFixed(2)} DOT',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOperationDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Operation Details', style: AppTypography.titleMedium),
            const SizedBox(height: AppSpacing.md),
            _buildDetailRow('Operation', _getOperationTitle()),
            _buildDetailRow(
              'Target',
              widget.validatorName ?? widget.poolName ?? 'N/A',
            ),
            _buildDetailRow('Chain', 'Polkadot'),
            _buildDetailRow('Estimated Fee', '0.1 DOT'),
            if (widget.operation == 'stake') ...[
              _buildDetailRow('Estimated APY', '12.5%'),
              _buildDetailRow('Unbonding Period', '28 days'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodyMedium),
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

  Widget _buildActionButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isProcessing ? null : _performOperation,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getOperationColor(),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        ),
        child: _isProcessing
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                _getOperationTitle(),
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildErrorDisplay() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              _error!,
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getOperationTitle() {
    switch (widget.operation) {
      case 'stake':
        return 'Stake Tokens';
      case 'unstake':
        return 'Unstake Tokens';
      case 'claim':
        return 'Claim Rewards';
      default:
        return 'Staking Operation';
    }
  }

  String _getOperationSubtitle() {
    switch (widget.operation) {
      case 'stake':
        return 'Stake your tokens to earn rewards';
      case 'unstake':
        return 'Unstake your tokens (28-day unbonding period)';
      case 'claim':
        return 'Claim your staking rewards';
      default:
        return 'Perform staking operation';
    }
  }

  IconData _getOperationIcon() {
    switch (widget.operation) {
      case 'stake':
        return Icons.trending_up;
      case 'unstake':
        return Icons.trending_down;
      case 'claim':
        return Icons.monetization_on;
      default:
        return Icons.account_balance_wallet;
    }
  }

  Color _getOperationColor() {
    switch (widget.operation) {
      case 'stake':
        return Colors.green;
      case 'unstake':
        return Colors.orange;
      case 'claim':
        return Colors.blue;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  void _showOperationInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${_getOperationTitle()} Information'),
        content: Text(_getOperationInfoText()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _getOperationInfoText() {
    switch (widget.operation) {
      case 'stake':
        return 'Staking allows you to earn rewards by participating in network consensus. Your tokens will be locked and you can unstake them after a 28-day unbonding period.';
      case 'unstake':
        return 'Unstaking will initiate a 28-day unbonding period. During this time, you will not earn rewards and cannot transfer the tokens.';
      case 'claim':
        return 'Claiming rewards will transfer your earned staking rewards to your available balance. This operation has a small transaction fee.';
      default:
        return 'This is a staking operation.';
    }
  }

  Future<void> _performOperation() async {
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text);

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StakingConfirmationDialog(
        operation: widget.operation,
        amount: amount,
        target: widget.validatorName ?? widget.poolName ?? 'N/A',
      ),
    );

    if (confirmed != true) return;

    setState(() {
      _isProcessing = true;
      _error = null;
    });

    try {
      final stakingProvider = context.read<StakingProvider>();
      final accountAddress =
          'user_account_address'; // In real app, get from wallet

      dynamic result;

      switch (widget.operation) {
        case 'stake':
          if (widget.validatorAddress != null) {
            result = await stakingProvider.stakeToValidator(
              accountAddress: accountAddress,
              validatorAddress: widget.validatorAddress!,
              amount: (amount * 1e10).toInt(), // Convert to smallest unit
            );
          } else if (widget.poolId != null) {
            result = await stakingProvider.stakeToPool(
              accountAddress: accountAddress,
              poolId: widget.poolId!,
              amount: (amount * 1e10).toInt(), // Convert to smallest unit
            );
          }
          break;
        case 'unstake':
          if (widget.validatorAddress != null) {
            result = await stakingProvider.unstakeFromValidator(
              accountAddress: accountAddress,
              validatorAddress: widget.validatorAddress!,
              amount: (amount * 1e10).toInt(), // Convert to smallest unit
            );
          } else if (widget.poolId != null) {
            result = await stakingProvider.unstakeFromPool(
              accountAddress: accountAddress,
              poolId: widget.poolId!,
              amount: (amount * 1e10).toInt(), // Convert to smallest unit
            );
          }
          break;
        case 'claim':
          result = await stakingProvider.claimRewards(
            accountAddress: accountAddress,
            validatorAddress: widget.validatorAddress,
            poolId: widget.poolId,
          );
          break;
      }

      if (result != null && result.success) {
        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) => StakingSuccessDialog(
              operation: widget.operation,
              amount: amount,
              transactionHash: result.transactionHash ?? 'N/A',
            ),
          );
          Navigator.pop(context, true); // Return success
        }
      } else {
        setState(() {
          _error = result?.error ?? 'Operation failed';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Operation failed: $e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
}
