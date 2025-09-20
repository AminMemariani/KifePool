import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Filter chips widget for staking dashboard
class StakingFilterChips extends StatefulWidget {
  final Function(String) onFilterChanged;
  final String? initialFilter;

  const StakingFilterChips({
    super.key,
    required this.onFilterChanged,
    this.initialFilter,
  });

  @override
  State<StakingFilterChips> createState() => _StakingFilterChipsState();
}

class _StakingFilterChipsState extends State<StakingFilterChips> {
  String _selectedFilter = 'all';

  final List<FilterOption> _filterOptions = [
    FilterOption(value: 'all', label: 'All', icon: Icons.apps),
    FilterOption(
      value: 'validators',
      label: 'Validators',
      icon: Icons.verified_user,
    ),
    FilterOption(value: 'pools', label: 'Pools', icon: Icons.group),
    FilterOption(value: 'active', label: 'Active', icon: Icons.check_circle),
    FilterOption(value: 'inactive', label: 'Inactive', icon: Icons.cancel),
  ];

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialFilter ?? 'all';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _filterOptions.map((option) {
          final isSelected = _selectedFilter == option.value;

          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    option.icon,
                    size: 16,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    option.label,
                    style: AppTypography.bodySmall.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimary
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
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = option.value;
                });
                widget.onFilterChanged(option.value);
              },
              selectedColor: Theme.of(context).colorScheme.primary,
              checkmarkColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              side: BorderSide(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FilterOption {
  final String value;
  final String label;
  final IconData icon;

  FilterOption({required this.value, required this.label, required this.icon});
}
