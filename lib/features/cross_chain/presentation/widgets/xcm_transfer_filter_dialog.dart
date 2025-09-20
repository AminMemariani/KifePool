import 'package:flutter/material.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Dialog for filtering XCM transfers
class XcmTransferFilterDialog extends StatefulWidget {
  final String? currentChain;
  final XcmTransferType? currentType;
  final XcmTransferStatus? currentStatus;

  const XcmTransferFilterDialog({
    super.key,
    this.currentChain,
    this.currentType,
    this.currentStatus,
  });

  @override
  State<XcmTransferFilterDialog> createState() =>
      _XcmTransferFilterDialogState();
}

class _XcmTransferFilterDialogState extends State<XcmTransferFilterDialog> {
  String? _selectedChain;
  XcmTransferType? _selectedType;
  XcmTransferStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedChain = widget.currentChain;
    _selectedType = widget.currentType;
    _selectedStatus = widget.currentStatus;
  }

  void _applyFilters() {
    Navigator.of(context).pop({
      'chain': _selectedChain,
      'type': _selectedType,
      'status': _selectedStatus,
    });
  }

  void _clearFilters() {
    setState(() {
      _selectedChain = null;
      _selectedType = null;
      _selectedStatus = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Transfers', style: AppTypography.headlineSmall),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownFilter<XcmTransferType>(
              context,
              'Type',
              XcmTransferType.values,
              _selectedType,
              (type) => Text(type.name.replaceAll('_', ' ').toUpperCase()),
              (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildDropdownFilter<XcmTransferStatus>(
              context,
              'Status',
              XcmTransferStatus.values,
              _selectedStatus,
              (status) => Text(status.name.toUpperCase()),
              (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildChainFilter(),
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

  Widget _buildDropdownFilter<T>(
    BuildContext context,
    String label,
    List<T> items,
    T? currentValue,
    Widget Function(T) itemBuilder,
    ValueChanged<T?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        DropdownButtonFormField<T>(
          value: currentValue,
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
    return FutureBuilder<List<XcmChainInfo>>(
      future: XcmTransferService.getSupportedChains(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final chains = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chain',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            DropdownButtonFormField<String>(
              value: _selectedChain,
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
                    value: chain.id,
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _getChainColor(chain.id),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusXs,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              chain.symbol.substring(0, 2),
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(chain.name),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedChain = value;
                });
              },
            ),
          ],
        );
      },
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
