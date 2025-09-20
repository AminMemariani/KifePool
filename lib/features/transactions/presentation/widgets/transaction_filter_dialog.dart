import 'package:flutter/material.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Dialog for filtering transactions
class TransactionFilterDialog extends StatefulWidget {
  final TransactionFilter initialFilter;
  final String? address;

  const TransactionFilterDialog({
    super.key,
    required this.initialFilter,
    this.address,
  });

  @override
  State<TransactionFilterDialog> createState() =>
      _TransactionFilterDialogState();
}

class _TransactionFilterDialogState extends State<TransactionFilterDialog> {
  late TransactionFilter _filter;
  DateTime? _fromDate;
  DateTime? _toDate;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
    _fromDate = widget.initialFilter.fromDate;
    _toDate = widget.initialFilter.toDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Transactions', style: AppTypography.headlineSmall),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chain filter
            _buildDropdownFilter<TransactionType>(
              label: 'Transaction Type',
              value: _filter.type,
              items: TransactionType.values,
              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(type: value);
                });
              },
              itemBuilder: (type) =>
                  Text(type.name.replaceAll('_', ' ').toUpperCase()),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Status filter
            _buildDropdownFilter<TransactionStatus>(
              label: 'Status',
              value: _filter.status,
              items: TransactionStatus.values,
              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(status: value);
                });
              },
              itemBuilder: (status) => Text(status.name.toUpperCase()),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Direction filter
            _buildDropdownFilter<TransactionDirection>(
              label: 'Direction',
              value: _filter.direction,
              items: TransactionDirection.values,
              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(direction: value);
                });
              },
              itemBuilder: (direction) => Text(direction.name.toUpperCase()),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Chain filter
            _buildChainFilter(),

            const SizedBox(height: AppSpacing.lg),

            // Date range
            _buildDateRangeFilter(),

            const SizedBox(height: AppSpacing.lg),

            // Search query
            TextFormField(
              initialValue: _filter.searchQuery,
              decoration: const InputDecoration(
                labelText: 'Search (hash, address)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _filter = _filter.copyWith(
                    searchQuery: value.isEmpty ? null : value,
                  );
                });
              },
            ),
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

  Widget _buildDropdownFilter<T>({
    required String label,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required Widget Function(T) itemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        DropdownButtonFormField<T>(
          value: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
          ),
          hint: Text('All ${label.toLowerCase()}s'),
          items: [
            DropdownMenuItem<T>(
              value: null,
              child: Text('All ${label.toLowerCase()}s'),
            ),
            ...items.map(
              (item) =>
                  DropdownMenuItem<T>(value: item, child: itemBuilder(item)),
            ),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildChainFilter() {
    final chains = ['polkadot', 'kusama', 'moonbeam', 'astar'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chain',
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        DropdownButtonFormField<String>(
          value: _filter.chain,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
          ),
          hint: const Text('All chains'),
          items: [
            const DropdownMenuItem<String>(
              value: null,
              child: Text('All chains'),
            ),
            ...chains.map(
              (chain) => DropdownMenuItem<String>(
                value: chain,
                child: Text(chain.toUpperCase()),
              ),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _filter = _filter.copyWith(chain: value);
            });
          },
        ),
      ],
    );
  }

  Widget _buildDateRangeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Range',
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: _selectFromDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _fromDate != null
                              ? _fromDate!.toLocal().toString().split(' ')[0]
                              : 'From date',
                          style: AppTypography.bodyMedium.copyWith(
                            color: _fromDate != null
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            const Text('to'),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: InkWell(
                onTap: _selectToDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          _toDate != null
                              ? _toDate!.toLocal().toString().split(' ')[0]
                              : 'To date',
                          style: AppTypography.bodyMedium.copyWith(
                            color: _toDate != null
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withOpacity(0.6),
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
        if (_fromDate != null || _toDate != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: TextButton(
              onPressed: _clearDateRange,
              child: const Text('Clear date range'),
            ),
          ),
      ],
    );
  }

  Future<void> _selectFromDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _fromDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _fromDate = date;
        _filter = _filter.copyWith(fromDate: date);
      });
    }
  }

  Future<void> _selectToDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _toDate ?? DateTime.now(),
      firstDate: _fromDate ?? DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        _toDate = date;
        _filter = _filter.copyWith(toDate: date);
      });
    }
  }

  void _clearDateRange() {
    setState(() {
      _fromDate = null;
      _toDate = null;
      _filter = _filter.copyWith(fromDate: null, toDate: null);
    });
  }

  void _clearFilters() {
    setState(() {
      _filter = const TransactionFilter();
      _fromDate = null;
      _toDate = null;
    });
  }

  void _applyFilters() {
    Navigator.of(context).pop(_filter);
  }
}
