import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../providers/theme_provider.dart';
import '../../l10n/app_localizations.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final l10n = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: themeProvider.isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.radiusLg),
          topRight: Radius.circular(AppSpacing.radiusLg),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            // Add haptic feedback for micro-interaction
            HapticFeedback.lightImpact();
            onTap(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: themeProvider.isDarkMode
              ? AppColors.darkSurface
              : AppColors.lightSurface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: themeProvider.isDarkMode
              ? AppColors.grey400
              : AppColors.grey500,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          elevation: 0,
          items: [
            _buildAnimatedNavItem(
              icon: Icons.account_balance_wallet_outlined,
              activeIcon: Icons.account_balance_wallet,
              label: l10n.wallet,
              isSelected: currentIndex == 0,
            ),
            _buildAnimatedNavItem(
              icon: Icons.trending_up_outlined,
              activeIcon: Icons.trending_up,
              label: l10n.staking,
              isSelected: currentIndex == 1,
            ),
            _buildAnimatedNavItem(
              icon: Icons.image_outlined,
              activeIcon: Icons.image,
              label: l10n.nfts,
              isSelected: currentIndex == 2,
            ),
            _buildAnimatedNavItem(
              icon: Icons.history_outlined,
              activeIcon: Icons.history,
              label: l10n.history,
              isSelected: currentIndex == 3,
            ),
            _buildAnimatedNavItem(
              icon: Icons.newspaper_outlined,
              activeIcon: Icons.newspaper,
              label: l10n.news,
              isSelected: currentIndex == 4,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildAnimatedNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: AnimatedScale(
          scale: isSelected ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Icon(
            isSelected ? activeIcon : icon,
            size: isSelected ? 26 : 24,
          ),
        ),
      ),
      activeIcon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          color: AppColors.primary.withValues(alpha: 0.1),
        ),
        child: AnimatedScale(
          scale: 1.1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Icon(activeIcon, size: 26),
        ),
      ),
      label: label,
    );
  }
}
