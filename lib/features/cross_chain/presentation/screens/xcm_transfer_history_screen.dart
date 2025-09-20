import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/features/cross_chain/presentation/widgets/xcm_transfer_list_item.dart';
import 'package:kifepool/features/cross_chain/presentation/widgets/xcm_transfer_filter_dialog.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';

/// XCM transfer history screen
class XcmTransferHistoryScreen extends StatefulWidget {
  const XcmTransferHistoryScreen({super.key});

  @override
  State<XcmTransferHistoryScreen> createState() =>
      _XcmTransferHistoryScreenState();
}

class _XcmTransferHistoryScreenState extends State<XcmTransferHistoryScreen> {
  List<XcmTransfer> _transfers = [];
  XcmTransferStats? _stats;
  bool _isLoading = false;
  String? _error;
  String? _selectedAddress;

  // Filter options
  String? _selectedChain;
  XcmTransferType? _selectedType;
  XcmTransferStatus? _selectedStatus;

  @override
  void initState() {
    super.initState();
    // Initial load if an account is already active
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final walletProvider = Provider.of<WalletProvider>(
        context,
        listen: false,
      );
      if (walletProvider.activeAccount != null) {
        setState(() {
          _selectedAddress = walletProvider.activeAccount!.address;
        });
        _loadTransferHistory();
      }
    });
  }

  Future<void> _loadTransferHistory() async {
    if (_selectedAddress == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final transfers = await XcmTransferService.getTransferHistory(
        address: _selectedAddress!,
        chain: _selectedChain,
        type: _selectedType,
        status: _selectedStatus,
      );

      final stats = await XcmTransferService.getTransferStats(
        _selectedAddress!,
      );

      setState(() {
        _transfers = transfers;
        _stats = stats;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load transfers: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshHistory() async {
    if (_selectedAddress == null) return;
    await _loadTransferHistory();
  }

  void _applyFilters({
    String? chain,
    XcmTransferType? type,
    XcmTransferStatus? status,
  }) {
    setState(() {
      _selectedChain = chain;
      _selectedType = type;
      _selectedStatus = status;
    });
    _loadTransferHistory();
  }

  void _clearFilters() {
    setState(() {
      _selectedChain = null;
      _selectedType = null;
      _selectedStatus = null;
    });
    _loadTransferHistory();
  }

  void _showTransferDetails(XcmTransfer transfer) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusLg),
                ),
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transfer Details',
                          style: AppTypography.headlineSmall,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  // Content
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      children: [
                        _buildDetailRow('Transfer ID', transfer.transferId),
                        _buildDetailRow('Source Chain', transfer.sourceChain),
                        _buildDetailRow(
                          'Destination Chain',
                          transfer.destinationChain,
                        ),
                        _buildDetailRow('Type', transfer.type.name),
                        _buildDetailRow('Status', transfer.status.name),
                        _buildDetailRow('Direction', transfer.direction.name),
                        _buildDetailRow('From', transfer.sourceAddress),
                        _buildDetailRow('To', transfer.destinationAddress),
                        _buildDetailRow('Asset', transfer.assetSymbol),
                        _buildDetailRow('Amount', transfer.amount),
                        _buildDetailRow('Transfer Fee', transfer.transferFee),
                        _buildDetailRow('XCM Fee', transfer.xcmFee),
                        _buildDetailRow(
                          'Timestamp',
                          transfer.timestamp.toLocal().toString(),
                        ),
                        if (transfer.confirmationTimestamp != null)
                          _buildDetailRow(
                            'Confirmed',
                            transfer.confirmationTimestamp!
                                .toLocal()
                                .toString(),
                          ),
                        if (transfer.errorMessage != null)
                          _buildDetailRow('Error', transfer.errorMessage!),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTypography.bodyMedium)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cross-Chain Transfer History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () async {
              final result = await showDialog<Map<String, dynamic>>(
                context: context,
                builder: (context) => XcmTransferFilterDialog(
                  currentChain: _selectedChain,
                  currentType: _selectedType,
                  currentStatus: _selectedStatus,
                ),
              );
              if (result != null) {
                _applyFilters(
                  chain: result['chain'],
                  type: result['type'],
                  status: result['status'],
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          // Update selected address when wallet changes
          if (walletProvider.activeAccount != null &&
              _selectedAddress != walletProvider.activeAccount!.address) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _selectedAddress = walletProvider.activeAccount!.address;
              });
              _loadTransferHistory();
            });
          }

          if (_selectedAddress == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 64,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.5),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Please select a wallet to view transfer history',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshHistory,
            child: CustomScrollView(
              slivers: [
                // Stats card
                if (_stats != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: _buildStatsCard(),
                    ),
                  ),

                // Filter summary
                if (_hasActiveFilters())
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      child: _buildFilterSummary(),
                    ),
                  ),

                // Transfers list
                if (_isLoading)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_error != null)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        _error!,
                        style: AppTypography.bodyMedium.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else if (_transfers.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.compare_arrows_outlined,
                            size: 64,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.5),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            'No cross-chain transfers found',
                            style: AppTypography.bodyLarge.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            _hasActiveFilters()
                                ? 'No transfers match your current filters'
                                : 'Start by making your first cross-chain transfer',
                            style: AppTypography.bodyMedium.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (_hasActiveFilters()) ...[
                            const SizedBox(height: AppSpacing.lg),
                            ElevatedButton(
                              onPressed: _clearFilters,
                              child: const Text('Clear Filters'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final transfer = _transfers[index];
                      return XcmTransferListItem(
                        transfer: transfer,
                        onTap: () => _showTransferDetails(transfer),
                      );
                    }, childCount: _transfers.length),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatsCard() {
    if (_stats == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfer Overview',
              style: AppTypography.headlineSmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Overview stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  Icons.compare_arrows,
                  Colors.blue,
                  'Total',
                  _stats!.totalTransfers.toString(),
                ),
                _buildStatItem(
                  context,
                  Icons.check_circle_outline,
                  Colors.green,
                  'Successful',
                  _stats!.successfulTransfers.toString(),
                ),
                _buildStatItem(
                  context,
                  Icons.error_outline,
                  Colors.red,
                  'Failed',
                  _stats!.failedTransfers.toString(),
                ),
                _buildStatItem(
                  context,
                  Icons.hourglass_empty,
                  Colors.orange,
                  'Pending',
                  _stats!.pendingTransfers.toString(),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),
            const Divider(),
            const SizedBox(height: AppSpacing.lg),

            // Volume and fees
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  Icons.currency_bitcoin,
                  Colors.purple,
                  'Total Volume',
                  _stats!.totalVolume,
                  isCurrency: true,
                ),
                _buildStatItem(
                  context,
                  Icons.gas_meter,
                  Colors.teal,
                  'Total Fees',
                  _stats!.totalFees,
                  isCurrency: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    Color color,
    String label,
    String value, {
    bool isCurrency = false,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSummary() {
    final activeFilters = <String>[];

    if (_selectedChain != null) activeFilters.add('Chain: $_selectedChain');
    if (_selectedType != null)
      activeFilters.add('Type: ${_selectedType!.name}');
    if (_selectedStatus != null)
      activeFilters.add('Status: ${_selectedStatus!.name}');

    if (activeFilters.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Filters: ${activeFilters.join(', ')}',
              style: AppTypography.bodySmall.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(onPressed: _clearFilters, child: const Text('Clear')),
        ],
      ),
    );
  }

  bool _hasActiveFilters() {
    return _selectedChain != null ||
        _selectedType != null ||
        _selectedStatus != null;
  }
}
