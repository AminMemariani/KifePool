import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/transfer_models.dart';
import 'package:kifepool/core/services/transfer_service.dart';
import 'package:kifepool/features/transactions/presentation/widgets/transfer_confirmation_dialog.dart';
import 'package:kifepool/features/transactions/presentation/widgets/qr_scanner_dialog.dart';

/// Token send screen
class TokenSendScreen extends StatefulWidget {
  final String tokenSymbol;
  final String chain;
  final String availableBalance;

  const TokenSendScreen({
    super.key,
    required this.tokenSymbol,
    required this.chain,
    required this.availableBalance,
  });

  @override
  State<TokenSendScreen> createState() => _TokenSendScreenState();
}

class _TokenSendScreenState extends State<TokenSendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();
  final _memoController = TextEditingController();

  bool _isLoading = false;
  String? _error;
  TransferValidation? _validation;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_validateTransfer);
    _recipientController.addListener(_validateTransfer);
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _validateTransfer() async {
    if (_recipientController.text.isNotEmpty &&
        _amountController.text.isNotEmpty) {
      final request = TransferRequest(
        recipientAddress: _recipientController.text,
        amount: _amountController.text,
        tokenSymbol: widget.tokenSymbol,
        chain: widget.chain,
        memo: _memoController.text.isNotEmpty ? _memoController.text : null,
      );

      final validation = await TransferService.validateTokenTransfer(request);
      setState(() {
        _validation = validation;
        _error = validation.isValid ? null : validation.errors.first;
      });
    }
  }

  Future<void> _sendToken() async {
    if (!_formKey.currentState!.validate()) return;
    if (_validation == null || !_validation!.isValid) return;

    final request = TransferRequest(
      recipientAddress: _recipientController.text,
      amount: _amountController.text,
      tokenSymbol: widget.tokenSymbol,
      chain: widget.chain,
      memo: _memoController.text.isNotEmpty ? _memoController.text : null,
    );

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => TransferConfirmationDialog(
        transferRequest: request,
        estimatedGasFee: _validation!.estimatedGasFee ?? '0',
        estimatedGasUsed: _validation!.estimatedGasUsed ?? '0',
      ),
    );

    if (confirmed == true) {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      try {
        final result = await TransferService.sendToken(request);

        if (result.success) {
          if (mounted) {
            Navigator.of(context).pop(true);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Transfer sent successfully! Hash: ${result.transactionHash}',
                ),
                backgroundColor: Colors.green,
              ),
            );
          }
        } else {
          setState(() {
            _error = result.error;
          });
        }
      } catch (e) {
        setState(() {
          _error = e.toString();
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _scanQrCode() async {
    final qrData = await showDialog<TransferQrData>(
      context: context,
      builder: (context) => const QrScannerDialog(),
    );

    if (qrData != null && qrData.type == 'token') {
      setState(() {
        _recipientController.text = qrData.recipientAddress ?? '';
        if (qrData.amount != null) {
          _amountController.text = qrData.amount!;
        }
        if (qrData.memo != null) {
          _memoController.text = qrData.memo!;
        }
      });
      _validateTransfer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send ${widget.tokenSymbol}'),
        actions: [
          IconButton(
            onPressed: _scanQrCode,
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Scan QR Code',
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
              // Available balance
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Column(
                  children: [
                    Text(
                      'Available Balance',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${widget.availableBalance} ${widget.tokenSymbol}',
                      style: AppTypography.headlineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Recipient address
              TextFormField(
                controller: _recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient Address',
                  hintText: 'Enter recipient address or scan QR code',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _scanQrCode,
                    icon: const Icon(Icons.qr_code_scanner),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient address';
                  }
                  return null;
                },
                maxLines: 2,
              ),

              const SizedBox(height: AppSpacing.lg),

              // Amount
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter amount to send',
                  border: const OutlineInputBorder(),
                  suffixText: widget.tokenSymbol,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppSpacing.lg),

              // Memo (optional)
              TextFormField(
                controller: _memoController,
                decoration: const InputDecoration(
                  labelText: 'Memo (Optional)',
                  hintText: 'Add a note to this transfer',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),

              const SizedBox(height: AppSpacing.lg),

              // Gas fee estimation
              if (_validation != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Details',
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estimated Gas Fee:'),
                          Text(
                            '${_validation!.estimatedGasFee} ${widget.tokenSymbol}',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gas Limit:'),
                          Text(
                            _validation!.estimatedGasUsed ?? '0',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],

              // Error message
              if (_error != null) ...[
                Container(
                  width: double.infinity,
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
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],

              // Send button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading || _validation?.isValid != true
                      ? null
                      : _sendToken,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          'Send ${widget.tokenSymbol}',
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
