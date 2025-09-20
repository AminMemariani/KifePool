import 'package:flutter/material.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Asset selector widget for XCM transfers
class AssetSelectorWidget extends StatefulWidget {
  final XcmAssetInfo? selectedAsset;
  final Function(XcmAssetInfo) onAssetSelected;
  final XcmChainInfo chain;

  const AssetSelectorWidget({
    super.key,
    required this.selectedAsset,
    required this.onAssetSelected,
    required this.chain,
  });

  @override
  State<AssetSelectorWidget> createState() => _AssetSelectorWidgetState();
}

class _AssetSelectorWidgetState extends State<AssetSelectorWidget> {
  List<XcmAssetInfo> _assets = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // For demo purposes, we'll use mock data
      // In reality, this would query the chain for available assets
      final assets = await XcmTransferService.getAvailableAssets(
        chain: widget.chain.id,
        address:
            '5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY', // Mock address
      );

      setState(() {
        _assets = assets;
        if (assets.isNotEmpty && widget.selectedAsset == null) {
          widget.onAssetSelected(assets.first);
        }
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

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Center(
          child: Text(
            'Error loading assets: $_error',
            style: AppTypography.bodySmall.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      );
    }

    if (_assets.isEmpty) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Center(
          child: Text(
            'No assets available',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<XcmAssetInfo>(
          value: widget.selectedAsset,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          hint: const Text('Select Asset'),
          items: _assets.map((asset) {
            return DropdownMenuItem<XcmAssetInfo>(
              value: asset,
              child: Row(
                children: [
                  _buildAssetIcon(asset),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          asset.symbol,
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Balance: ${asset.balance}',
                          style: AppTypography.bodySmall.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (asset.isNative)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusXs,
                        ),
                      ),
                      child: Text(
                        'NATIVE',
                        style: AppTypography.bodySmall.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
          onChanged: (asset) {
            if (asset != null) {
              widget.onAssetSelected(asset);
            }
          },
        ),
      ),
    );
  }

  Widget _buildAssetIcon(XcmAssetInfo asset) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: _getAssetColor(asset.symbol),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Center(
        child: Text(
          asset.symbol.substring(0, 2),
          style: AppTypography.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color _getAssetColor(String symbol) {
    switch (symbol.toUpperCase()) {
      case 'DOT':
        return const Color(0xFFE6007A);
      case 'KSM':
        return const Color(0xFF000000);
      case 'GLMR':
        return const Color(0xFF53CBC9);
      case 'ASTR':
        return const Color(0xFF1B365D);
      case 'ACA':
        return const Color(0xFF645AFF);
      default:
        return Colors.grey;
    }
  }
}
