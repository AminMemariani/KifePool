import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kifepool/core/theme/app_colors.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/widgets/app_card.dart';
import 'package:kifepool/features/wallet/presentation/screens/wallet_creation_screen.dart';
import 'package:kifepool/features/wallet/presentation/screens/wallet_import_screen.dart';

class WalletSelectionScreen extends StatelessWidget {
  const WalletSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  (AppSpacing.lg * 2),
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(),

                  // App Logo/Title
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'KifePool',
                        style: AppTypography.headlineLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Your Gateway to Polkadot Ecosystem',
                        style: AppTypography.bodyLarge.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Description
                  Text(
                    'Choose how you\'d like to get started with KifePool',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // Action Cards
                  Column(
                    children: [
                      // Create New Wallet Card
                      AppCard(
                        child: InkWell(
                          onTap: () => _navigateToCreateWallet(context),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: AppColors.primary,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Create New Wallet',
                                            style: AppTypography.headlineSmall
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          const SizedBox(height: AppSpacing.xs),
                                          Text(
                                            'Generate a new seed phrase and create a secure wallet',
                                            style: AppTypography.bodyMedium
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface
                                                      .withValues(alpha: 0.7),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.5),
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.md),

                      // Import Existing Wallet Card
                      AppCard(
                        child: InkWell(
                          onTap: () => _navigateToImportWallet(context),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMd,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary.withValues(
                                          alpha: 0.1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        Icons.download,
                                        color: AppColors.secondary,
                                        size: 24,
                                      ),
                                    ),
                                    const SizedBox(width: AppSpacing.md),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Import Existing Wallet',
                                            style: AppTypography.headlineSmall
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          const SizedBox(height: AppSpacing.xs),
                                          Text(
                                            'Import your existing wallet using seed phrase or private key',
                                            style: AppTypography.bodyMedium
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface
                                                      .withValues(alpha: 0.7),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.5),
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCreateWallet(BuildContext context) {
    HapticFeedback.lightImpact();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const WalletCreationScreen()),
    );
  }

  void _navigateToImportWallet(BuildContext context) {
    HapticFeedback.lightImpact();
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const WalletImportScreen()));
  }
}
