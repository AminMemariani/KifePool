import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/features/cross_chain/presentation/widgets/chain_selector_widget.dart';
import 'package:kifepool/features/cross_chain/presentation/widgets/asset_selector_widget.dart';
import 'package:kifepool/features/cross_chain/presentation/widgets/transfer_progress_widget.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';

/// Cross-chain transfer screen
class CrossChainTransferScreen extends StatefulWidget {
  const CrossChainTransferScreen({super.key});

  @override
  State<CrossChainTransferScreen> createState() =>
      _CrossChainTransferScreenState();
}

class _CrossChainTransferScreenState extends State<CrossChainTransferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _destinationAddressController = TextEditingController();
  final _memoController = TextEditingController();

  List<XcmChainInfo> _supportedChains = [];
  XcmChainInfo? _sourceChain;
  XcmChainInfo? _destinationChain;
  XcmAssetInfo? _selectedAsset;
  XcmTransferType _transferType = XcmTransferType.token;
  XcmTransferValidation? _validation;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _destinationAddressController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Set default chains
      final supportedChains = await XcmTransferService.getSupportedChains();
      if (supportedChains.isNotEmpty) {
        setState(() {
          _supportedChains = supportedChains;
          _sourceChain = supportedChains.first;
          _destinationChain = supportedChains.length > 1
              ? supportedChains[1]
              : null;
        });
        await _loadAssets();
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

  Future<void> _loadAssets() async {
    if (_sourceChain == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final walletProvider = Provider.of<WalletProvider>(
        context,
        listen: false,
      );
      final address = walletProvider.activeAccount?.address;

      if (address != null) {
        final assets = await XcmTransferService.getAvailableAssets(
          chain: _sourceChain!.id,
          address: address,
        );

        if (assets.isNotEmpty) {
          setState(() {
            _selectedAsset = assets.first;
          });
        }
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

  Future<void> _validateTransfer() async {
    if (_sourceChain == null ||
        _destinationChain == null ||
        _selectedAsset == null) {
      return;
    }

    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    final sourceAddress = walletProvider.activeAccount?.address;

    if (sourceAddress == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final request = XcmTransferRequest(
        sourceChain: _sourceChain!.id,
        destinationChain: _destinationChain!.id,
        type: _transferType,
        sourceAddress: sourceAddress,
        destinationAddress: _destinationAddressController.text,
        assetSymbol: _selectedAsset!.symbol,
        amount: _amountController.text,
        memo: _memoController.text.isNotEmpty ? _memoController.text : null,
      );

      final validation = await XcmTransferService.validateTransfer(request);
      setState(() {
        _validation = validation;
        _error = validation.isValid ? null : validation.errors.first;
      });
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

  Future<void> _initiateTransfer() async {
    if (!_formKey.currentState!.validate()) return;
    if (_validation == null || !_validation!.isValid) return;

    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    final sourceAddress = walletProvider.activeAccount?.address;

    if (sourceAddress == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final request = XcmTransferRequest(
        sourceChain: _sourceChain!.id,
        destinationChain: _destinationChain!.id,
        type: _transferType,
        sourceAddress: sourceAddress,
        destinationAddress: _destinationAddressController.text,
        assetSymbol: _selectedAsset!.symbol,
        amount: _amountController.text,
        memo: _memoController.text.isNotEmpty ? _memoController.text : null,
      );

      final result = await XcmTransferService.initiateTransfer(request);

      if (result.success && result.transferId != null) {
        // Show transfer progress
        _showTransferProgress(result.transferId!);
      } else {
        setState(() {
          _error = result.errorMessage ?? 'Transfer failed';
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

  void _showTransferProgress(String transferId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => TransferProgressWidget(transferId: transferId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cross-Chain Transfer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).pushNamed('/cross-chain/history');
            },
            tooltip: 'Transfer History',
          ),
        ],
      ),
      body: _isLoading && _sourceChain == null
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _sourceChain == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Error loading data',
                    style: AppTypography.headlineSmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    _error!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton(
                    onPressed: _loadInitialData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Transfer type selector
                    _buildTransferTypeSelector(),
                    const SizedBox(height: AppSpacing.lg),

                    // Source chain selector
                    _buildSourceChainSelector(),
                    const SizedBox(height: AppSpacing.lg),

                    // Destination chain selector
                    _buildDestinationChainSelector(),
                    const SizedBox(height: AppSpacing.lg),

                    // Asset selector
                    if (_sourceChain != null) _buildAssetSelector(),
                    if (_sourceChain != null)
                      const SizedBox(height: AppSpacing.lg),

                    // Amount input
                    _buildAmountInput(),
                    const SizedBox(height: AppSpacing.lg),

                    // Destination address
                    _buildDestinationAddressInput(),
                    const SizedBox(height: AppSpacing.lg),

                    // Memo (optional)
                    _buildMemoInput(),
                    const SizedBox(height: AppSpacing.lg),

                    // Validation info
                    if (_validation != null) _buildValidationInfo(),
                    if (_validation != null)
                      const SizedBox(height: AppSpacing.lg),

                    // Error display
                    if (_error != null) _buildErrorDisplay(),
                    if (_error != null) const SizedBox(height: AppSpacing.lg),

                    // Transfer button
                    _buildTransferButton(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTransferTypeSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfer Type',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<XcmTransferType>(
                    title: const Text('Token'),
                    value: XcmTransferType.token,
                    groupValue: _transferType,
                    onChanged: (value) {
                      setState(() {
                        _transferType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<XcmTransferType>(
                    title: const Text('NFT'),
                    value: XcmTransferType.nft,
                    groupValue: _transferType,
                    onChanged: (value) {
                      setState(() {
                        _transferType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceChainSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Source Chain',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ChainSelectorWidget(
              selectedChain: _sourceChain,
              onChainSelected: (chain) {
                setState(() {
                  _sourceChain = chain;
                  _selectedAsset = null;
                });
                _loadAssets();
              },
              supportedChains: _supportedChains,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationChainSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destination Chain',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ChainSelectorWidget(
              selectedChain: _destinationChain,
              onChainSelected: (chain) {
                setState(() {
                  _destinationChain = chain;
                });
                _validateTransfer();
              },
              supportedChains: _supportedChains
                  .where((c) => c.id != _sourceChain?.id)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Asset',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AssetSelectorWidget(
              selectedAsset: _selectedAsset,
              onAssetSelected: (asset) {
                setState(() {
                  _selectedAsset = asset;
                });
                _validateTransfer();
              },
              chain: _sourceChain!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                suffixText: _selectedAsset?.symbol,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                final amount = double.tryParse(value);
                if (amount == null || amount <= 0) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
              onChanged: (_) => _validateTransfer(),
            ),
            if (_selectedAsset != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Available: ${_selectedAsset!.balance} ${_selectedAsset!.symbol}',
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationAddressInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destination Address',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _destinationAddressController,
              decoration: const InputDecoration(
                labelText: 'Recipient Address',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a destination address';
                }
                return null;
              },
              onChanged: (_) => _validateTransfer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Memo (Optional)',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _memoController,
              decoration: const InputDecoration(
                labelText: 'Memo',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => _validateTransfer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidationInfo() {
    if (_validation == null) return const SizedBox.shrink();

    return Card(
      color: _validation!.isValid
          ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
          : Theme.of(context).colorScheme.errorContainer.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _validation!.isValid ? Icons.check_circle : Icons.error,
                  color: _validation!.isValid
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  _validation!.isValid ? 'Transfer Valid' : 'Transfer Invalid',
                  style: AppTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _validation!.isValid
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            if (_validation!.isValid) ...[
              const SizedBox(height: AppSpacing.sm),
              if (_validation!.estimatedFee != null)
                Text(
                  'Estimated Fee: ${_validation!.estimatedFee} ${_selectedAsset?.symbol}',
                  style: AppTypography.bodySmall,
                ),
              if (_validation!.estimatedTime != null)
                Text(
                  'Estimated Time: ${_validation!.estimatedTime}',
                  style: AppTypography.bodySmall,
                ),
            ] else ...[
              const SizedBox(height: AppSpacing.sm),
              ..._validation!.errors.map(
                (error) => Text(
                  '• $error',
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildErrorDisplay() {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                _error!,
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (_isLoading || _validation == null || !_validation!.isValid)
            ? null
            : _initiateTransfer,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(
                'Initiate Cross-Chain Transfer',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
