import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/blockchain_models.dart';
import 'package:kifepool/core/models/transfer_models.dart';
import 'package:kifepool/core/services/transfer_service.dart';
import 'package:kifepool/features/transactions/presentation/widgets/qr_scanner_dialog.dart';

/// NFT transfer dialog
class NftTransferDialog extends StatefulWidget {
  final NFT nft;

  const NftTransferDialog({super.key, required this.nft});

  @override
  State<NftTransferDialog> createState() => _NftTransferDialogState();
}

class _NftTransferDialogState extends State<NftTransferDialog> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _memoController = TextEditingController();

  bool _isLoading = false;
  String? _error;
  TransferValidation? _validation;

  @override
  void initState() {
    super.initState();
    _recipientController.addListener(_validateTransfer);
  }

  @override
  void dispose() {
    _recipientController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _validateTransfer() async {
    if (_recipientController.text.isNotEmpty) {
      final request = NftTransferRequest(
        recipientAddress: _recipientController.text,
        nftId: widget.nft.id,
        collectionId: widget.nft.collection,
        chain: widget.nft.chain,
        memo: _memoController.text.isNotEmpty ? _memoController.text : null,
      );

      final validation = await TransferService.validateNftTransfer(request);
      setState(() {
        _validation = validation;
        _error = validation.isValid ? null : validation.errors.first;
      });
    }
  }

  Future<void> _scanQrCode() async {
    final qrData = await showDialog<TransferQrData>(
      context: context,
      builder: (context) => const QrScannerDialog(),
    );

    if (qrData != null && (qrData.type == 'nft' || qrData.type == 'receive')) {
      setState(() {
        _recipientController.text = qrData.recipientAddress ?? '';
        if (qrData.memo != null) {
          _memoController.text = qrData.memo!;
        }
      });
      _validateTransfer();
    }
  }

  Future<void> _transferNft() async {
    if (!_formKey.currentState!.validate()) return;
    if (_validation == null || !_validation!.isValid) return;

    final request = NftTransferRequest(
      recipientAddress: _recipientController.text,
      nftId: widget.nft.id,
      collectionId: widget.nft.collection,
      chain: widget.nft.chain,
      memo: _memoController.text.isNotEmpty ? _memoController.text : null,
    );

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await TransferService.sendNft(request);

      if (result.success) {
        if (mounted) {
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'NFT transfer sent successfully! Hash: ${result.transactionHash}',
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: const BoxConstraints(maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.radiusLg),
                  topRight: Radius.circular(AppSpacing.radiusLg),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Transfer NFT',
                      style: AppTypography.titleMedium.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NFT info
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                        ),
                        child: Row(
                          children: [
                            // NFT image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusSm,
                              ),
                              child: Image.network(
                                widget.nft.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 60,
                                    height: 60,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surfaceVariant,
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(width: AppSpacing.md),

                            // NFT details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.nft.name,
                                    style: AppTypography.titleMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    widget.nft.collection,
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    'Chain: ${widget.nft.chain}',
                                    style: AppTypography.bodySmall.copyWith(
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
                      ),

                      const SizedBox(height: AppSpacing.lg),

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
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusMd,
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Estimated Gas Fee:'),
                                  Text(
                                    '${_validation!.estimatedGasFee} ${widget.nft.chain.toUpperCase()}',
                                    style: AppTypography.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusMd,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onErrorContainer,
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

                      // Transfer button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading || _validation?.isValid != true
                              ? null
                              : _transferNft,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
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
                                  'Transfer NFT',
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
            ),
          ],
        ),
      ),
    );
  }
}
