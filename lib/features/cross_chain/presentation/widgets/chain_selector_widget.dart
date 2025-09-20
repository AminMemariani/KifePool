import 'package:flutter/material.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Chain selector widget for XCM transfers
class ChainSelectorWidget extends StatelessWidget {
  final XcmChainInfo? selectedChain;
  final Function(XcmChainInfo) onChainSelected;
  final List<XcmChainInfo> supportedChains;

  const ChainSelectorWidget({
    super.key,
    required this.selectedChain,
    required this.onChainSelected,
    required this.supportedChains,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<XcmChainInfo>(
          value: selectedChain,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          hint: const Text('Select Chain'),
          items: supportedChains.map((chain) {
            return DropdownMenuItem<XcmChainInfo>(
              value: chain,
              child: Row(
                children: [
                  _buildChainLogo(chain),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          chain.name,
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          chain.symbol,
                          style: AppTypography.bodySmall.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (chain.isRelayChain)
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
                        'RELAY',
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
          onChanged: (chain) {
            if (chain != null) {
              onChainSelected(chain);
            }
          },
        ),
      ),
    );
  }

  Widget _buildChainLogo(XcmChainInfo chain) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: _getChainColor(chain.id),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Center(
        child: Text(
          chain.symbol.substring(0, 2),
          style: AppTypography.bodySmall.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color _getChainColor(String chainId) {
    switch (chainId.toLowerCase()) {
      case 'polkadot':
        return const Color(0xFFE6007A);
      case 'kusama':
        return const Color(0xFF000000);
      case 'moonbeam':
        return const Color(0xFF53CBC9);
      case 'astar':
        return const Color(0xFF1B365D);
      case 'acala':
        return const Color(0xFF645AFF);
      default:
        return Colors.grey;
    }
  }
}
