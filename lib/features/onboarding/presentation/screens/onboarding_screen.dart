import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/wallet_models.dart';

/// Onboarding screen with walkthrough carousel
class OnboardingScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const OnboardingScreen({super.key, required this.onComplete});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final carousel.CarouselController _carouselController =
      carousel.CarouselController();
  int _currentIndex = 0;

  final List<OnboardingStep> _steps = [
    const OnboardingStep(
      title: 'Welcome to KifePool',
      description:
          'Your comprehensive crypto management app with wallet, staking, NFTs, and cross-chain functionality.',
      imagePath: 'assets/images/onboarding/welcome.png',
    ),
    const OnboardingStep(
      title: 'Secure Wallet Management',
      description:
          'Create or import wallets with 12/24-word mnemonics. Your private keys are encrypted and stored securely.',
      imagePath: 'assets/images/onboarding/security.png',
    ),
    const OnboardingStep(
      title: 'Multi-Chain Support',
      description:
          'Manage assets across Polkadot, Moonbeam, Astar, and other supported chains from one interface.',
      imagePath: 'assets/images/onboarding/multichain.png',
    ),
    const OnboardingStep(
      title: 'Staking & DeFi',
      description:
          'Stake your tokens, manage NFTs, and access DeFi protocols directly from your wallet.',
      imagePath: 'assets/images/onboarding/defi.png',
    ),
    const OnboardingStep(
      title: 'Cross-Chain Transfers',
      description:
          'Transfer assets between different chains using XCM and other cross-chain protocols.',
      imagePath: 'assets/images/onboarding/crosschain.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 60), // Placeholder for balance
                  Text(
                    'KifePool',
                    style: AppTypography.headlineSmall.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: widget.onComplete,
                    child: Text(
                      'Skip',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Carousel
            Expanded(
              child: carousel.CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _steps.length,
                itemBuilder: (context, index, realIndex) {
                  return _buildOnboardingStep(_steps[index]);
                },
                options: carousel.CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            // Bottom section with indicators and buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _steps.length,
                      (index) => Container(
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Navigation buttons
                  Row(
                    children: [
                      // Previous button
                      if (_currentIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _carouselController.previousPage();
                            },
                            child: Text(
                              'Previous',
                              style: AppTypography.bodyMedium,
                            ),
                          ),
                        ),

                      if (_currentIndex > 0)
                        const SizedBox(width: AppSpacing.md),

                      // Next/Get Started button
                      Expanded(
                        flex: _currentIndex > 0 ? 1 : 2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentIndex < _steps.length - 1) {
                              _carouselController.nextPage();
                            } else {
                              widget.onComplete();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.md,
                            ),
                          ),
                          child: Text(
                            _currentIndex < _steps.length - 1
                                ? 'Next'
                                : 'Get Started',
                            style: AppTypography.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingStep(OnboardingStep step) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image placeholder
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Icon(
              _getStepIcon(step.title),
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Title
          Text(
            step.title,
            style: AppTypography.headlineMedium.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.md),

          // Description
          Text(
            step.description,
            style: AppTypography.bodyLarge.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onBackground.withOpacity(0.7),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getStepIcon(String title) {
    switch (title) {
      case 'Welcome to KifePool':
        return Icons.waving_hand;
      case 'Secure Wallet Management':
        return Icons.security;
      case 'Multi-Chain Support':
        return Icons.account_balance;
      case 'Staking & DeFi':
        return Icons.trending_up;
      case 'Cross-Chain Transfers':
        return Icons.swap_horiz;
      default:
        return Icons.info;
    }
  }
}
