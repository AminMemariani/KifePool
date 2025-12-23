import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/shared/widgets/loading_widgets.dart';
import 'package:kifepool/core/services/governance_service.dart';
import 'package:kifepool/features/governance/presentation/screens/governance_screen.dart';

/// Account dashboard screen with multi-chain balances
class AccountDashboardScreen extends StatefulWidget {
  const AccountDashboardScreen({super.key});

  @override
  State<AccountDashboardScreen> createState() => _AccountDashboardScreenState();
}

class _AccountDashboardScreenState extends State<AccountDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBalances();
    });
  }

  void _loadBalances() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    walletProvider.loadBalances();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Dashboard'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Account switcher
          Consumer<WalletProvider>(
            builder: (context, walletProvider, child) {
              if (walletProvider.accounts.isEmpty) {
                return const SizedBox.shrink();
              }

              return PopupMenuButton<String>(
                icon: const Icon(Icons.account_circle),
                onSelected: (address) {
                  walletProvider.switchAccount(address);
                },
                itemBuilder: (context) {
                  return walletProvider.accounts.map((account) {
                    return PopupMenuItem<String>(
                      value: account.address,
                      child: Row(
                        children: [
                          Icon(
                            account.isActive
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            size: 16,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  account.name,
                                  style: AppTypography.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${account.address.substring(0, 8)}...${account.address.substring(account.address.length - 8)}',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<WalletProvider>(
        builder: (context, walletProvider, child) {
          if (walletProvider.isLoading) {
            return const Center(child: LoadingIndicator());
          }

          if (walletProvider.activeAccount == null) {
            return _buildNoAccountView();
          }

          return RefreshIndicator(
            onRefresh: () async {
              await walletProvider.loadBalances();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account info card
                  _buildAccountInfoCard(walletProvider.activeAccount!),

                  const SizedBox(height: AppSpacing.lg),

                  // Total balance
                  _buildTotalBalanceCard(walletProvider.balances),

                  const SizedBox(height: AppSpacing.lg),

                  // Chain balances
                  _buildChainBalancesSection(walletProvider.balances),

                  const SizedBox(height: AppSpacing.lg),

                  // Quick actions
                  _buildQuickActionsSection(),

                  const SizedBox(height: AppSpacing.lg),

                  // OpenGov section (only for Polkadot/Kusama)
                  if (_hasOpenGovChain(walletProvider.balances))
                    _buildOpenGovSection(walletProvider.balances),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _hasOpenGovChain(List<ChainBalance> balances) {
    return balances.any((balance) =>
        GovernanceService.supportsOpenGov(balance.chain));
  }

  Widget _buildOpenGovSection(List<ChainBalance> balances) {
    final openGovChains = balances
        .where((balance) => GovernanceService.supportsOpenGov(balance.chain))
        .toList();

    if (openGovChains.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'OpenGov Voting',
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to governance screen for the first OpenGov chain
                final chain = openGovChains.first.chain;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GovernanceScreen(chain: chain),
                  ),
                );
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ...openGovChains.map((chainBalance) => _buildOpenGovChainCard(
              chainBalance.chain,
            )),
      ],
    );
  }

  Widget _buildOpenGovChainCard(String chain) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GovernanceScreen(chain: chain),
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Icon(
                  Icons.how_to_vote,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OpenGov - $chain',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'View and vote on active proposals',
                      style: AppTypography.bodySmall.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoAccountView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              'No Wallet Found',
              style: AppTypography.headlineMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              'Create a new wallet or import an existing one to get started',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xl),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/wallet/create');
                    },
                    child: const Text('Create Wallet'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/wallet/import');
                    },
                    child: const Text('Import Wallet'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard(WalletAccount account) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    account.name.isNotEmpty
                        ? account.name[0].toUpperCase()
                        : 'W',
                    style: AppTypography.bodyLarge.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account.name,
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${account.address.substring(0, 8)}...${account.address.substring(account.address.length - 8)}',
                        style: AppTypography.bodySmall.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Copy address to clipboard
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address copied to clipboard'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            Row(
              children: [
                _buildInfoChip('Type', account.walletType.toUpperCase()),
                const SizedBox(width: AppSpacing.sm),
                _buildInfoChip('Chain', 'Polkadot'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        '$label: $value',
        style: AppTypography.bodySmall.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildTotalBalanceCard(List<ChainBalance> balances) {
    final totalUsd = balances.fold<double>(
      0.0,
      (sum, balance) => sum + (double.tryParse(balance.usdValue) ?? 0.0),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Portfolio Value',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              '\$${totalUsd.toStringAsFixed(2)}',
              style: AppTypography.headlineLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              '${balances.length} chains',
              style: AppTypography.bodySmall.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChainBalancesSection(List<ChainBalance> balances) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chain Balances',
          style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: AppSpacing.md),

        if (balances.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.account_balance,
                  size: 48,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'No balances found',
                  style: AppTypography.bodyMedium.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          )
        else
          ...balances.map((balance) => _buildBalanceCard(balance)),
      ],
    );
  }

  Widget _buildBalanceCard(ChainBalance balance) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Chain logo placeholder
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                Icons.account_balance,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            // Balance info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    balance.chain,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${balance.balance} ${balance.symbol}',
                    style: AppTypography.bodySmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            // USD value
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${balance.usdValue}',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'USD',
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: AppSpacing.md),

        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Icons.send,
                label: 'Send',
                onTap: () {
                  // Navigate to send screen
                },
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildActionButton(
                icon: Icons.call_received,
                label: 'Receive',
                onTap: () {
                  // Navigate to receive screen
                },
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildActionButton(
                icon: Icons.swap_horiz,
                label: 'Swap',
                onTap: () {
                  // Navigate to swap screen
                },
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildActionButton(
                icon: Icons.history,
                label: 'History',
                onTap: () {
                  // Navigate to transaction history
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: AppSpacing.xs),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
