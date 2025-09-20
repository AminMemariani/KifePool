import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/models/transaction_history_models.dart';
import 'package:kifepool/core/services/transaction_history_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/features/transactions/presentation/widgets/transaction_filter_dialog.dart';
import 'package:kifepool/features/transactions/presentation/widgets/transaction_list_item.dart';
import 'package:kifepool/features/transactions/presentation/widgets/transaction_stats_card.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';

/// Transaction history screen
class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  List<TransactionHistory> _transactions = [];
  TransactionFilter _filter = const TransactionFilter();
  TransactionStats? _stats;
  bool _isLoading = false;
  bool _isRefreshing = false;
  String? _error;
  String? _selectedAddress;

  @override
  void initState() {
    super.initState();
    _loadTransactionHistory();
  }

  Future<void> _loadTransactionHistory() async {
    if (_selectedAddress == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await TransactionHistoryService.getTransactionHistory(
        address: _selectedAddress!,
        filter: _filter,
      );

      final stats = await TransactionHistoryService.getTransactionStats(
        _selectedAddress!,
      );

      setState(() {
        _transactions = result.transactions;
        _stats = stats;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshTransactionHistory() async {
    if (_selectedAddress == null) return;

    setState(() {
      _isRefreshing = true;
    });

    try {
      await TransactionHistoryService.refreshTransactionHistory(
        _selectedAddress!,
      );
      await _loadTransactionHistory();
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  Future<void> _showFilterDialog() async {
    final newFilter = await showDialog<TransactionFilter>(
      context: context,
      builder: (context) => TransactionFilterDialog(
        initialFilter: _filter,
        address: _selectedAddress,
      ),
    );

    if (newFilter != null) {
      setState(() {
        _filter = newFilter;
      });
      await _loadTransactionHistory();
    }
  }

  void _clearFilters() {
    setState(() {
      _filter = const TransactionFilter();
    });
    _loadTransactionHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
            tooltip: 'Filter Transactions',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshTransactionHistory,
            tooltip: 'Refresh',
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
              _loadTransactionHistory();
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
                    'No Wallet Selected',
                    style: AppTypography.headlineSmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Please select a wallet to view transaction history',
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
            onRefresh: _refreshTransactionHistory,
            child: CustomScrollView(
              slivers: [
                // Stats card
                if (_stats != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: TransactionStatsCard(stats: _stats!),
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

                // Transaction list
                if (_isLoading && _transactions.isEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.xl),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  )
                else if (_error != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              'Error loading transactions',
                              style: AppTypography.titleMedium,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              _error!,
                              style: AppTypography.bodyMedium.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            ElevatedButton(
                              onPressed: _loadTransactionHistory,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else if (_transactions.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.receipt_long_outlined,
                              size: 64,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.5),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              'No Transactions Found',
                              style: AppTypography.headlineSmall,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'No transactions match your current filters',
                              style: AppTypography.bodyMedium.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (_hasActiveFilters()) ...[
                              const SizedBox(height: AppSpacing.lg),
                              OutlinedButton(
                                onPressed: _clearFilters,
                                child: const Text('Clear Filters'),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final transaction = _transactions[index];
                      return TransactionListItem(
                        transaction: transaction,
                        onTap: () => _showTransactionDetails(transaction),
                      );
                    }, childCount: _transactions.length),
                  ),

                // Loading indicator for refresh
                if (_isRefreshing)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.md),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterSummary() {
    final activeFilters = <String>[];

    if (_filter.chain != null) activeFilters.add('Chain: ${_filter.chain}');
    if (_filter.type != null) activeFilters.add('Type: ${_filter.type!.name}');
    if (_filter.status != null)
      activeFilters.add('Status: ${_filter.status!.name}');
    if (_filter.direction != null)
      activeFilters.add('Direction: ${_filter.direction!.name}');
    if (_filter.fromDate != null)
      activeFilters.add(
        'From: ${_filter.fromDate!.toLocal().toString().split(' ')[0]}',
      );
    if (_filter.toDate != null)
      activeFilters.add(
        'To: ${_filter.toDate!.toLocal().toString().split(' ')[0]}',
      );

    if (activeFilters.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(
              Icons.filter_alt,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'Active filters: ${activeFilters.join(', ')}',
                style: AppTypography.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(onPressed: _clearFilters, child: const Text('Clear')),
          ],
        ),
      ),
    );
  }

  bool _hasActiveFilters() {
    return _filter.chain != null ||
        _filter.type != null ||
        _filter.status != null ||
        _filter.direction != null ||
        _filter.fromDate != null ||
        _filter.toDate != null;
  }

  void _showTransactionDetails(TransactionHistory transaction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _TransactionDetailsSheet(transaction: transaction),
    );
  }
}

/// Transaction details bottom sheet
class _TransactionDetailsSheet extends StatelessWidget {
  final TransactionHistory transaction;

  const _TransactionDetailsSheet({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
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
              // Handle
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
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  children: [
                    Text(
                      'Transaction Details',
                      style: AppTypography.headlineSmall,
                    ),
                    const Spacer(),
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
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Hash', transaction.hash),
                      _buildDetailRow(
                        'Block',
                        transaction.blockNumber.toString(),
                      ),
                      _buildDetailRow('Chain', transaction.chain),
                      _buildDetailRow('Type', transaction.type.name),
                      _buildDetailRow('Status', transaction.status.name),
                      _buildDetailRow('Direction', transaction.direction.name),
                      _buildDetailRow('From', transaction.fromAddress),
                      _buildDetailRow('To', transaction.toAddress),
                      _buildDetailRow(
                        'Amount',
                        '${transaction.amount} ${transaction.tokenSymbol}',
                      ),
                      _buildDetailRow(
                        'Gas Fee',
                        '${transaction.gasFee} ${transaction.tokenSymbol}',
                      ),
                      _buildDetailRow('Gas Used', transaction.gasUsed),
                      _buildDetailRow('Nonce', transaction.nonce.toString()),
                      _buildDetailRow(
                        'Timestamp',
                        transaction.timestamp.toLocal().toString(),
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      // Explorer link
                      if (transaction.explorerUrl != null)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Open explorer URL
                              // url_launcher would be used here
                            },
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('View on Explorer'),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
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
}
