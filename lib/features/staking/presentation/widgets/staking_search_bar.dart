import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Search bar widget for staking dashboard
class StakingSearchBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String? initialValue;

  const StakingSearchBar({
    super.key,
    required this.onSearchChanged,
    this.initialValue,
  });

  @override
  State<StakingSearchBar> createState() => _StakingSearchBarState();
}

class _StakingSearchBarState extends State<StakingSearchBar> {
  late TextEditingController _controller;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onSearchChanged(value);
          setState(() {
            _isSearching = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search validators, pools, or addresses...',
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onSearchChanged('');
                    setState(() {
                      _isSearching = false;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
        ),
        style: AppTypography.bodyMedium,
      ),
    );
  }
}
