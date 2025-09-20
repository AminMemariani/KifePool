import 'package:flutter/material.dart';
import 'package:kifepool/core/services/parachain_service.dart';
import 'package:kifepool/core/theme/app_colors.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Dynamic chain selector widget that loads parachains from API
class DynamicChainSelector extends StatefulWidget {
  final String? selectedChainId;
  final ValueChanged<String?> onChainChanged;
  final String? label;
  final bool enabled;
  final bool showSearch;
  final List<String>? excludedChains;

  const DynamicChainSelector({
    super.key,
    this.selectedChainId,
    required this.onChainChanged,
    this.label,
    this.enabled = true,
    this.showSearch = true,
    this.excludedChains,
  });

  @override
  State<DynamicChainSelector> createState() => _DynamicChainSelectorState();
}

class _DynamicChainSelectorState extends State<DynamicChainSelector> {
  List<ParachainInfo> _parachains = [];
  List<ParachainInfo> _filteredParachains = [];
  bool _isLoading = true;
  String? _error;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadParachains();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadParachains() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final parachains = await ParachainService.getActiveParachains();

      // Filter out excluded chains
      final filtered = widget.excludedChains != null
          ? parachains
                .where((p) => !widget.excludedChains!.contains(p.id))
                .toList()
          : parachains;

      setState(() {
        _parachains = filtered;
        _filteredParachains = filtered;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load parachains: $e';
        _isLoading = false;
      });
    }
  }

  void _filterParachains(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredParachains = _parachains;
      } else {
        _filteredParachains = _parachains
            .where(
              (p) =>
                  p.name.toLowerCase().contains(query.toLowerCase()) ||
                  p.symbol.toLowerCase().contains(query.toLowerCase()) ||
                  (p.description?.toLowerCase().contains(query.toLowerCase()) ??
                      false),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],

        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: _buildSelector(),
        ),
      ],
    );
  }

  Widget _buildSelector() {
    if (_isLoading) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Loading parachains...',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 16,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                _error!,
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            TextButton(onPressed: _loadParachains, child: const Text('Retry')),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Selected chain display
        InkWell(
          onTap: widget.enabled ? _showChainSelector : null,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                _buildChainIcon(),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: _buildSelectedChainInfo()),
                if (widget.enabled)
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChainIcon() {
    final selectedChain = _parachains.firstWhere(
      (p) => p.id == widget.selectedChainId,
      orElse: () => _parachains.isNotEmpty
          ? _parachains.first
          : const ParachainInfo(
              id: 'unknown',
              name: 'Unknown',
              symbol: 'UNK',
              isActive: false,
            ),
    );

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: selectedChain.logoUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                selectedChain.logoUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.account_balance,
                  size: 16,
                  color: AppColors.primary,
                ),
              ),
            )
          : Icon(Icons.account_balance, size: 16, color: AppColors.primary),
    );
  }

  Widget _buildSelectedChainInfo() {
    if (widget.selectedChainId == null) {
      return Text(
        'Select a chain',
        style: AppTypography.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      );
    }

    final selectedChain = _parachains.firstWhere(
      (p) => p.id == widget.selectedChainId,
      orElse: () => const ParachainInfo(
        id: 'unknown',
        name: 'Unknown Chain',
        symbol: 'UNK',
        isActive: false,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedChain.name,
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        if (selectedChain.description != null)
          Text(
            selectedChain.description!,
            style: AppTypography.bodySmall.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }

  void _showChainSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ChainSelectorBottomSheet(
        parachains: _filteredParachains,
        selectedChainId: widget.selectedChainId,
        onChainSelected: (chainId) {
          widget.onChainChanged(chainId);
          Navigator.of(context).pop();
        },
        searchQuery: _searchQuery,
        onSearchChanged: _filterParachains,
        showSearch: widget.showSearch,
      ),
    );
  }
}

class _ChainSelectorBottomSheet extends StatefulWidget {
  final List<ParachainInfo> parachains;
  final String? selectedChainId;
  final ValueChanged<String?> onChainSelected;
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final bool showSearch;

  const _ChainSelectorBottomSheet({
    required this.parachains,
    required this.selectedChainId,
    required this.onChainSelected,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.showSearch,
  });

  @override
  State<_ChainSelectorBottomSheet> createState() =>
      _ChainSelectorBottomSheetState();
}

class _ChainSelectorBottomSheetState extends State<_ChainSelectorBottomSheet> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: AppSpacing.sm),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Text(
                  'Select Chain',
                  style: AppTypography.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Search bar
          if (widget.showSearch) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: TextField(
                controller: _searchController,
                onChanged: widget.onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search chains...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],

          // Chain list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              itemCount: widget.parachains.length,
              itemBuilder: (context, index) {
                final parachain = widget.parachains[index];
                final isSelected = parachain.id == widget.selectedChainId;

                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: parachain.logoUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              parachain.logoUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.account_balance,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                            ),
                          )
                        : Icon(
                            Icons.account_balance,
                            size: 20,
                            color: AppColors.primary,
                          ),
                  ),
                  title: Text(
                    parachain.name,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (parachain.description != null)
                        Text(
                          parachain.description!,
                          style: AppTypography.bodySmall.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 2),
                      Text(
                        '${parachain.symbol} • ${parachain.supportedAssets.join(', ')}',
                        style: AppTypography.bodySmall.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check_circle, color: AppColors.primary)
                      : null,
                  onTap: () => widget.onChainSelected(parachain.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
