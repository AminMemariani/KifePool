import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/transfer_models.dart';
import 'package:kifepool/core/services/transfer_service.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/features/transactions/presentation/widgets/transfer_history_item_widget.dart';

/// Transfer history screen
class TransferHistoryScreen extends StatefulWidget {
  const TransferHistoryScreen({super.key});

  @override
  State<TransferHistoryScreen> createState() => _TransferHistoryScreenState();
}

class _TransferHistoryScreenState extends State<TransferHistoryScreen>
    with TickerProviderStateMixin {
  List<dynamic> _transfers = [];
  bool _isLoading = false;
  String? _error;
  String _selectedFilter = 'all';
  String _selectedChain = 'all';

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadTransfers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadTransfers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final walletProvider = Provider.of<WalletProvider>(
        context,
        listen: false,
      );
      final activeAccount = walletProvider.activeAccount;

      if (activeAccount != null) {
        final transfers = await TransferService.getAllTransfers(
          address: activeAccount.address,
          chain: _selectedChain == 'all' ? null : _selectedChain,
        );

        setState(() {
          _transfers = transfers;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<dynamic> get _filteredTransfers {
    var filtered = _transfers.where((transfer) {
      switch (_selectedFilter) {
        case 'sent':
          return transfer is TokenTransfer
              ? transfer.direction == TransferDirection.send
              : (transfer as NftTransfer).direction == TransferDirection.send;
        case 'received':
          return transfer is TokenTransfer
              ? transfer.direction == TransferDirection.receive
              : (transfer as NftTransfer).direction ==
                    TransferDirection.receive;
        case 'pending':
          return transfer is TokenTransfer
              ? transfer.status == TransferStatus.pending
              : (transfer as NftTransfer).status == TransferStatus.pending;
        default:
          return true;
      }
    }).toList();

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer History'),
        actions: [
          IconButton(
            onPressed: _loadTransfers,
            icon: const Icon(Icons.refresh),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Tokens'),
            Tab(text: 'NFTs'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filter bar
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Filter dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedFilter,
                    decoration: const InputDecoration(
                      labelText: 'Filter',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('All')),
                      DropdownMenuItem(value: 'sent', child: Text('Sent')),
                      DropdownMenuItem(
                        value: 'received',
                        child: Text('Received'),
                      ),
                      DropdownMenuItem(
                        value: 'pending',
                        child: Text('Pending'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                      });
                    },
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                // Chain dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedChain,
                    decoration: const InputDecoration(
                      labelText: 'Chain',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('All Chains')),
                      DropdownMenuItem(
                        value: 'polkadot',
                        child: Text('Polkadot'),
                      ),
                      DropdownMenuItem(value: 'kusama', child: Text('Kusama')),
                      DropdownMenuItem(
                        value: 'moonbeam',
                        child: Text('Moonbeam'),
                      ),
                      DropdownMenuItem(value: 'astar', child: Text('Astar')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedChain = value!;
                      });
                      _loadTransfers();
                    },
                  ),
                ),
              ],
            ),
          ),

          // Transfer list
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTransferList(),
                _buildTokenTransferList(),
                _buildNftTransferList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransferList() {
    return _buildTransferListView(_filteredTransfers);
  }

  Widget _buildTokenTransferList() {
    final tokenTransfers = _filteredTransfers
        .whereType<TokenTransfer>()
        .toList();
    return _buildTransferListView(tokenTransfers);
  }

  Widget _buildNftTransferList() {
    final nftTransfers = _filteredTransfers.whereType<NftTransfer>().toList();
    return _buildTransferListView(nftTransfers);
  }

  Widget _buildTransferListView(List<dynamic> transfers) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Failed to load transfers',
              style: AppTypography.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _error!,
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: _loadTransfers,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (transfers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: AppSpacing.md),
            Text('No transfers found', style: AppTypography.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Your transfer history will appear here',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadTransfers,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: transfers.length,
        itemBuilder: (context, index) {
          final transfer = transfers[index];
          return TransferHistoryItemWidget(
            transfer: transfer,
            onTap: () => _showTransferDetails(transfer),
          );
        },
      ),
    );
  }

  void _showTransferDetails(dynamic transfer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          transfer is TokenTransfer ? 'Token Transfer' : 'NFT Transfer',
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (transfer is TokenTransfer) ...[
                _buildDetailRow('Token', transfer.tokenSymbol),
                _buildDetailRow(
                  'Amount',
                  '${transfer.amount} ${transfer.tokenSymbol}',
                ),
              ] else ...[
                _buildDetailRow('NFT', (transfer as NftTransfer).nftName),
                _buildDetailRow('Collection', transfer.collectionId),
              ],
              _buildDetailRow('From', transfer.fromAddress),
              _buildDetailRow('To', transfer.toAddress),
              _buildDetailRow('Chain', transfer.chain),
              _buildDetailRow('Status', transfer.status.name),
              _buildDetailRow('Transaction Hash', transfer.transactionHash),
              if (transfer.gasFee != null)
                _buildDetailRow('Gas Fee', transfer.gasFee!),
              if (transfer.gasUsed != null)
                _buildDetailRow('Gas Used', transfer.gasUsed!),
              if (transfer.blockNumber != null)
                _buildDetailRow('Block Number', transfer.blockNumber!),
              _buildDetailRow('Timestamp', transfer.timestamp.toString()),
              if (transfer.memo != null)
                _buildDetailRow('Memo', transfer.memo!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Text(value, style: AppTypography.bodyMedium)),
        ],
      ),
    );
  }
}
