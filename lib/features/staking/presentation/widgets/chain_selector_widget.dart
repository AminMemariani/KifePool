import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Chain selector widget for staking dashboard
class ChainSelectorWidget extends StatefulWidget {
  final Function(String) onChainChanged;
  final String? initialChain;
  final List<String>? supportedChains;

  const ChainSelectorWidget({
    super.key,
    required this.onChainChanged,
    this.initialChain,
    this.supportedChains,
  });

  @override
  State<ChainSelectorWidget> createState() => _ChainSelectorWidgetState();
}

class _ChainSelectorWidgetState extends State<ChainSelectorWidget> {
  String _selectedChain = 'polkadot';

  List<ChainOption> _chainOptions = [
    ChainOption(
      value: 'polkadot',
      label: 'Polkadot',
      icon: Icons.circle,
      color: Colors.pink,
    ),
    ChainOption(
      value: 'kusama',
      label: 'Kusama',
      icon: Icons.circle,
      color: Colors.black,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedChain = widget.initialChain ?? 'polkadot';
    _loadChainOptions();
  }

  Future<void> _loadChainOptions() async {
    try {
      if (widget.supportedChains != null) {
        setState(() {
          _chainOptions = widget.supportedChains!.map((chain) {
            return ChainOption(
              value: chain,
              label: chain.capitalize(),
              icon: Icons.circle,
              color: _getChainColor(chain),
            );
          }).toList();
        });
      }
    } catch (e) {
      // Fallback to basic chains if loading fails
    }
  }

  Color _getChainColor(String chain) {
    switch (chain.toLowerCase()) {
      case 'polkadot':
        return Colors.pink;
      case 'kusama':
        return Colors.black;
      case 'moonbeam':
        return Colors.blue;
      case 'astar':
        return Colors.purple;
      case 'acala':
        return Colors.green;
      case 'karura':
        return Colors.orange;
      case 'shiden':
        return Colors.indigo;
      case 'khala':
        return Colors.teal;
      case 'bifrost':
        return Colors.cyan;
      case 'statemint':
        return Colors.grey;
      case 'statemine':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        children: [
          Text(
            'Chain:',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _chainOptions.map((option) {
                  final isSelected = _selectedChain == option.value;

                  return Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.sm),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedChain = option.value;
                        });
                        widget.onChainChanged(option.value);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? option.color.withOpacity(0.1)
                              : Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                          border: Border.all(
                            color: isSelected
                                ? option.color
                                : Theme.of(
                                    context,
                                  ).colorScheme.outline.withOpacity(0.3),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: option.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              option.label,
                              style: AppTypography.bodySmall.copyWith(
                                color: isSelected
                                    ? option.color
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurface.withOpacity(0.7),
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChainOption {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  ChainOption({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
