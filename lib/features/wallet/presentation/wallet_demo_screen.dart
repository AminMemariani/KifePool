import 'package:flutter/material.dart';
import '../../../core/models/blockchain_models.dart';
import '../../../core/services/blockchain_service.dart';
import '../../../core/services/error_handler.dart';
import '../../../shared/widgets/loading_widgets.dart';
import '../../../shared/widgets/error_widgets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

/// Demo screen showing how to use BlockchainService with proper error handling
class WalletDemoScreen extends StatefulWidget {
  const WalletDemoScreen({super.key});

  @override
  State<WalletDemoScreen> createState() => _WalletDemoScreenState();
}

class _WalletDemoScreenState extends State<WalletDemoScreen> {
  final BlockchainService _blockchainService = BlockchainService();
  final TextEditingController _addressController = TextEditingController();

  // State variables
  Balance? _balance;
  List<Transaction> _transactions = [];
  List<NFT> _nfts = [];
  StakingInfo? _stakingInfo;
  bool _isLoading = false;
  BlockchainException? _error;
  BlockchainNetwork _selectedNetwork = BlockchainNetwork.polkadot;

  @override
  void initState() {
    super.initState();
    // Set a default test address
    _addressController.text =
        '15oF4uVJwmo4TdGW7VfQxNLavjCXviqxT9S1MgbjMNHr6Sp5';
  }

  @override
  void dispose() {
    _addressController.dispose();
    _blockchainService.dispose();
    super.dispose();
  }

  /// Load wallet data with error handling
  Future<void> _loadWalletData() async {
    if (_addressController.text.trim().isEmpty) {
      _showErrorToast('Please enter a wallet address');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Load all data in parallel
      final results = await Future.wait([
        _blockchainService.getBalance(
          _addressController.text.trim(),
          _selectedNetwork,
        ),
        _blockchainService.getTransactionHistory(
          _addressController.text.trim(),
          _selectedNetwork,
        ),
        _blockchainService.getNFTs(
          _addressController.text.trim(),
          _selectedNetwork,
        ),
        _blockchainService.getStakingInfo(
          _addressController.text.trim(),
          _selectedNetwork,
        ),
      ]);

      setState(() {
        _balance = results[0] as Balance;
        _transactions = results[1] as List<Transaction>;
        _nfts = results[2] as List<NFT>;
        _stakingInfo = results[3] as StakingInfo;
        _isLoading = false;
      });

      _showSuccessToast('Wallet data loaded successfully');
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e is BlockchainException
            ? e
            : BlockchainException(
                type: BlockchainErrorType.unknown,
                message: 'Failed to load wallet data',
                details: e.toString(),
              );
      });

      if (e is BlockchainException) {
        ErrorHandler.logError(e, context: 'loadWalletData');
        _showErrorToast(ErrorHandler.handleBlockchainError(e));
      }
    }
  }

  /// Send transaction with error handling
  Future<void> _sendTransaction() async {
    if (_addressController.text.trim().isEmpty) {
      _showErrorToast('Please enter a wallet address');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await _blockchainService.sendTransaction(
        from: _addressController.text.trim(),
        to: _addressController.text.trim(), // Self-transfer for demo
        amount: '1000000000', // 0.001 DOT
        chain: _selectedNetwork,
      );

      if (result.success) {
        _showSuccessToast(
          'Transaction sent successfully! Hash: ${result.hash}',
        );
        // Refresh wallet data
        await _loadWalletData();
      } else {
        _showErrorToast('Transaction failed: ${result.errorMessage}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e is BlockchainException
            ? e
            : BlockchainException(
                type: BlockchainErrorType.transactionFailed,
                message: 'Failed to send transaction',
                details: e.toString(),
              );
      });

      if (e is BlockchainException) {
        ErrorHandler.logError(e, context: 'sendTransaction');
        _showErrorToast(ErrorHandler.handleBlockchainError(e));
      }
    }
  }

  /// Show error toast
  void _showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ErrorToast(message: message, onRetry: _loadWalletData),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Show success toast
  void _showSuccessToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SuccessToast(message: message),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Service Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadWalletData,
          ),
        ],
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        message: 'Loading wallet data...',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Network Selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Network',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      DropdownButtonFormField<BlockchainNetwork>(
                        value: _selectedNetwork,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Blockchain Network',
                        ),
                        items: BlockchainNetwork.values.map((network) {
                          return DropdownMenuItem(
                            value: network,
                            child: Text(network.name),
                          );
                        }).toList(),
                        onChanged: (network) {
                          if (network != null) {
                            setState(() {
                              _selectedNetwork = network;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.md),

              // Address Input
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet Address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      TextField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter wallet address',
                        ),
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _loadWalletData,
                              child: const Text('Load Wallet Data'),
                            ),
                          ),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _isLoading ? null : _sendTransaction,
                              child: const Text('Send Transaction'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.md),

              // Error Display
              if (_error != null)
                ErrorDisplay(
                  error: _error!,
                  onRetry: _loadWalletData,
                  context: 'Wallet Demo',
                ),

              // Balance Card
              if (_balance != null) _buildBalanceCard(),
              if (_balance == null && !_isLoading && _error == null)
                const BalanceShimmer(),

              SizedBox(height: AppSpacing.md),

              // Transactions
              if (_transactions.isNotEmpty) _buildTransactionsSection(),
              if (_transactions.isEmpty && !_isLoading && _error == null)
                const TransactionShimmer(),

              SizedBox(height: AppSpacing.md),

              // NFTs
              if (_nfts.isNotEmpty) _buildNFTsSection(),
              if (_nfts.isEmpty && !_isLoading && _error == null)
                const NFTShimmer(),

              SizedBox(height: AppSpacing.md),

              // Staking Info
              if (_stakingInfo != null) _buildStakingSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    if (_balance == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Balance', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: AppSpacing.sm),
            Text(
              '${_balance!.totalAmount.toStringAsFixed(4)} ${_balance!.symbol}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Free', style: Theme.of(context).textTheme.bodySmall),
                    Text(
                      '${_balance!.freeAmount.toStringAsFixed(4)} ${_balance!.symbol}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reserved',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${(double.tryParse(_balance!.reserved) ?? 0.0).toStringAsFixed(4)} ${_balance!.symbol}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacing.sm),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _transactions.take(5).length,
              itemBuilder: (context, index) {
                final tx = _transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tx.status == TransactionStatus.confirmed
                        ? Colors.green
                        : tx.status == TransactionStatus.failed
                        ? Colors.red
                        : Colors.orange,
                    child: Icon(
                      tx.status == TransactionStatus.confirmed
                          ? Icons.check
                          : tx.status == TransactionStatus.failed
                          ? Icons.close
                          : Icons.pending,
                      color: Colors.white,
                    ),
                  ),
                  title: Text('${tx.amount} ${tx.symbol}'),
                  subtitle: Text('Block: ${tx.blockNumber}'),
                  trailing: Text(
                    tx.status.name.toUpperCase(),
                    style: TextStyle(
                      color: tx.status == TransactionStatus.confirmed
                          ? Colors.green
                          : tx.status == TransactionStatus.failed
                          ? Colors.red
                          : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNFTsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NFTs (${_nfts.length})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacing.sm),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: AppSpacing.sm,
                mainAxisSpacing: AppSpacing.sm,
              ),
              itemCount: _nfts.take(4).length,
              itemBuilder: (context, index) {
                final nft = _nfts[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.grey200,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(AppSpacing.radiusMd),
                            ),
                          ),
                          child: const Icon(
                            Icons.image,
                            size: 48,
                            color: AppColors.grey400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nft.name,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              nft.collection,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStakingSection() {
    if (_stakingInfo == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Staking Information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Staked',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${(double.tryParse(_stakingInfo!.staked) ?? 0.0).toStringAsFixed(4)} ${_stakingInfo!.symbol}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rewards',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${(double.tryParse(_stakingInfo!.rewards) ?? 0.0).toStringAsFixed(4)} ${_stakingInfo!.symbol}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (_stakingInfo!.validators.isNotEmpty) ...[
              SizedBox(height: AppSpacing.sm),
              Text(
                'Validators (${_stakingInfo!.validators.length})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              ..._stakingInfo!.validators.take(3).map((validator) {
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundColor: validator.isActive
                        ? Colors.green
                        : Colors.grey,
                    child: Text(
                      validator.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    validator.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: Text(
                    '${validator.commission}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }
}
