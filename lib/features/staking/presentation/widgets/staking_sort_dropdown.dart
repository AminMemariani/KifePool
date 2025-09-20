import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Sort dropdown widget for staking dashboard
class StakingSortDropdown extends StatefulWidget {
  final Function(String) onSortChanged;
  final String? initialSort;

  const StakingSortDropdown({
    super.key,
    required this.onSortChanged,
    this.initialSort,
  });

  @override
  State<StakingSortDropdown> createState() => _StakingSortDropdownState();
}

class _StakingSortDropdownState extends State<StakingSortDropdown> {
  String _selectedSort = 'apy';

  final List<SortOption> _sortOptions = [
    SortOption(
      value: 'apy',
      label: 'APY (High to Low)',
      icon: Icons.trending_up,
    ),
    SortOption(
      value: 'apy_low',
      label: 'APY (Low to High)',
      icon: Icons.trending_down,
    ),
    SortOption(
      value: 'commission',
      label: 'Commission (Low to High)',
      icon: Icons.percent,
    ),
    SortOption(
      value: 'stake',
      label: 'Total Stake (High to Low)',
      icon: Icons.account_balance_wallet,
    ),
    SortOption(
      value: 'name',
      label: 'Name (A to Z)',
      icon: Icons.sort_by_alpha,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.initialSort ?? 'apy';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedSort,
          isDense: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          style: AppTypography.bodySmall,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedSort = newValue;
              });
              widget.onSortChanged(newValue);
            }
          },
          items: _sortOptions.map<DropdownMenuItem<String>>((
            SortOption option,
          ) {
            return DropdownMenuItem<String>(
              value: option.value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    option.icon,
                    size: 16,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(option.label, style: AppTypography.bodySmall),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SortOption {
  final String value;
  final String label;
  final IconData icon;

  SortOption({required this.value, required this.label, required this.icon});
}
