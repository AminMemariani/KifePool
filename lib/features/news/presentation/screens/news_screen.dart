import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/providers/theme_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement news search
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Refresh news
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // News Categories
          Container(
            height: 50,
            margin: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: themeProvider.isDarkMode 
                  ? AppColors.darkSurfaceVariant 
                  : AppColors.lightSurfaceVariant,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildCategoryTab('All', true),
                ),
                Expanded(
                  child: _buildCategoryTab('Bitcoin', false),
                ),
                Expanded(
                  child: _buildCategoryTab('Ethereum', false),
                ),
                Expanded(
                  child: _buildCategoryTab('DeFi', false),
                ),
                Expanded(
                  child: _buildCategoryTab('NFTs', false),
                ),
              ],
            ),
          ),
          
          // News List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest News',
                    style: AppTypography.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  
                  // Empty state
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.xxl),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode 
                            ? AppColors.darkSurfaceVariant 
                            : AppColors.lightSurfaceVariant,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.newspaper_outlined,
                            size: 64,
                            color: AppColors.grey400,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            'No news available',
                            style: AppTypography.titleMedium.copyWith(
                              color: AppColors.grey500,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            'Latest cryptocurrency news will appear here',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.grey400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Refresh news
                            },
                            child: const Text('Refresh'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTypography.labelMedium.copyWith(
            color: isSelected ? Colors.white : AppColors.grey500,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
