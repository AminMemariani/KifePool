import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';
import 'package:kifepool/core/theme/app_colors.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

void main() {
  group('Theme Provider Tests', () {
    test('Theme provider initializes correctly', () {
      final themeProvider = ThemeProvider();
      expect(themeProvider.isDarkMode, true);
      expect(themeProvider.themeMode, ThemeMode.dark);
    });

    test('Theme provider toggles correctly', () {
      final themeProvider = ThemeProvider();

      // Toggle to light mode
      themeProvider.toggleTheme();
      expect(themeProvider.isDarkMode, false);
      expect(themeProvider.themeMode, ThemeMode.light);

      // Toggle back to dark mode
      themeProvider.toggleTheme();
      expect(themeProvider.isDarkMode, true);
      expect(themeProvider.themeMode, ThemeMode.dark);
    });
  });

  group('App Colors Tests', () {
    test('App colors are defined', () {
      expect(AppColors.primary, isNotNull);
      expect(AppColors.secondary, isNotNull);
      expect(AppColors.error, isNotNull);
      expect(AppColors.success, isNotNull);
      expect(AppColors.warning, isNotNull);
    });

    test('App colors have valid hex values', () {
      expect(AppColors.primary, startsWith('#'));
      expect(AppColors.secondary, startsWith('#'));
      expect(AppColors.error, startsWith('#'));
      expect(AppColors.success, startsWith('#'));
      expect(AppColors.warning, startsWith('#'));
    });
  });

  group('App Spacing Tests', () {
    test('App spacing values are defined', () {
      expect(AppSpacing.xs, isA<double>());
      expect(AppSpacing.sm, isA<double>());
      expect(AppSpacing.md, isA<double>());
      expect(AppSpacing.lg, isA<double>());
      expect(AppSpacing.xl, isA<double>());
    });

    test('App spacing values are positive', () {
      expect(AppSpacing.xs, greaterThan(0));
      expect(AppSpacing.sm, greaterThan(0));
      expect(AppSpacing.md, greaterThan(0));
      expect(AppSpacing.lg, greaterThan(0));
      expect(AppSpacing.xl, greaterThan(0));
    });

    test('App spacing values are in ascending order', () {
      expect(AppSpacing.sm, greaterThan(AppSpacing.xs));
      expect(AppSpacing.md, greaterThan(AppSpacing.sm));
      expect(AppSpacing.lg, greaterThan(AppSpacing.md));
      expect(AppSpacing.xl, greaterThan(AppSpacing.lg));
    });
  });

  group('App Typography Tests', () {
    test('App typography styles are defined', () {
      expect(AppTypography.displayLarge, isNotNull);
      expect(AppTypography.displayMedium, isNotNull);
      expect(AppTypography.displaySmall, isNotNull);
      expect(AppTypography.headlineLarge, isNotNull);
      expect(AppTypography.headlineMedium, isNotNull);
      expect(AppTypography.headlineSmall, isNotNull);
      expect(AppTypography.titleLarge, isNotNull);
      expect(AppTypography.titleMedium, isNotNull);
      expect(AppTypography.titleSmall, isNotNull);
      expect(AppTypography.bodyLarge, isNotNull);
      expect(AppTypography.bodyMedium, isNotNull);
      expect(AppTypography.bodySmall, isNotNull);
      expect(AppTypography.labelLarge, isNotNull);
      expect(AppTypography.labelMedium, isNotNull);
      expect(AppTypography.labelSmall, isNotNull);
    });
  });
}
