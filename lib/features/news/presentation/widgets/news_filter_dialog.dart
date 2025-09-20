import 'package:flutter/material.dart';
import 'package:kifepool/core/models/news_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Dialog for filtering news articles
class NewsFilterDialog extends StatefulWidget {
  final NewsFilter currentFilter;
  final Function(NewsFilter) onFilterApplied;

  const NewsFilterDialog({
    super.key,
    required this.currentFilter,
    required this.onFilterApplied,
  });

  @override
  State<NewsFilterDialog> createState() => _NewsFilterDialogState();
}

class _NewsFilterDialogState extends State<NewsFilterDialog> {
  late NewsSource? _selectedSource;
  late NewsCategory? _selectedCategory;
  late bool _bookmarkedOnly;
  late bool _unreadOnly;

  @override
  void initState() {
    super.initState();
    _selectedSource = widget.currentFilter.source;
    _selectedCategory = widget.currentFilter.category;
    _bookmarkedOnly = widget.currentFilter.bookmarkedOnly ?? false;
    _unreadOnly = widget.currentFilter.unreadOnly ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter News'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Source filter
            _buildSourceFilter(),
            const SizedBox(height: AppSpacing.lg),

            // Category filter
            _buildCategoryFilter(),
            const SizedBox(height: AppSpacing.lg),

            // Status filters
            _buildStatusFilters(),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: _clearFilters, child: const Text('Clear All')),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: _applyFilters, child: const Text('Apply')),
      ],
    );
  }

  Widget _buildSourceFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Source',
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _buildFilterChip(
              label: 'All',
              selected: _selectedSource == null,
              onSelected: (selected) {
                setState(() {
                  _selectedSource = null;
                });
              },
            ),
            ...NewsSource.values.map((source) {
              return _buildFilterChip(
                label: _getSourceDisplayName(source),
                selected: _selectedSource == source,
                onSelected: (selected) {
                  setState(() {
                    _selectedSource = selected ? source : null;
                  });
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            _buildFilterChip(
              label: 'All',
              selected: _selectedCategory == null,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = null;
                });
              },
            ),
            ...NewsCategory.values.map((category) {
              return _buildFilterChip(
                label: _getCategoryDisplayName(category),
                selected: _selectedCategory == category,
                onSelected: (selected) {
                  setState(() {
                    _selectedCategory = selected ? category : null;
                  });
                },
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        CheckboxListTile(
          title: const Text('Bookmarked only'),
          value: _bookmarkedOnly,
          onChanged: (value) {
            setState(() {
              _bookmarkedOnly = value ?? false;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          title: const Text('Unread only'),
          value: _unreadOnly,
          onChanged: (value) {
            setState(() {
              _unreadOnly = value ?? false;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool selected,
    required Function(bool) onSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }

  void _applyFilters() {
    final filter = NewsFilter(
      source: _selectedSource,
      category: _selectedCategory,
      bookmarkedOnly: _bookmarkedOnly ? true : null,
      unreadOnly: _unreadOnly ? true : null,
    );

    widget.onFilterApplied(filter);
    Navigator.of(context).pop();
  }

  void _clearFilters() {
    setState(() {
      _selectedSource = null;
      _selectedCategory = null;
      _bookmarkedOnly = false;
      _unreadOnly = false;
    });
  }

  String _getSourceDisplayName(NewsSource source) {
    switch (source) {
      case NewsSource.polkadotBlog:
        return 'Polkadot Blog';
      case NewsSource.subsocial:
        return 'Subsocial';
      case NewsSource.medium:
        return 'Medium';
      case NewsSource.twitter:
        return 'Twitter';
      case NewsSource.github:
        return 'GitHub';
      case NewsSource.other:
        return 'Other';
    }
  }

  String _getCategoryDisplayName(NewsCategory category) {
    switch (category) {
      case NewsCategory.ecosystem:
        return 'Ecosystem';
      case NewsCategory.technology:
        return 'Technology';
      case NewsCategory.governance:
        return 'Governance';
      case NewsCategory.partnerships:
        return 'Partnerships';
      case NewsCategory.updates:
        return 'Updates';
      case NewsCategory.events:
        return 'Events';
      case NewsCategory.tutorials:
        return 'Tutorials';
      case NewsCategory.other:
        return 'Other';
    }
  }
}
