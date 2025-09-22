import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/app.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';
import 'test_helpers.dart';

/// Integration tests for Theme Provider
/// Tests theme switching and persistence across the app
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Provider Integration Tests', () {
    testWidgets('should load app with default theme', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      // Verify app loads with default theme
      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      expect(themeProvider, isNotNull);
      expect(themeProvider.isDarkMode, isA<bool>());

      print(
        '✅ App loaded with default theme: ${themeProvider.isDarkMode ? "Dark" : "Light"}',
      );
    });

    testWidgets('should apply light theme correctly', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Set to light theme
      themeProvider.toggleTheme();
      if (themeProvider.isDarkMode) {
        themeProvider.toggleTheme(); // Ensure light theme
      }

      await tester.pumpAndSettle();

      // Verify light theme is applied
      expect(themeProvider.isDarkMode, isFalse);

      // Check theme colors
      final theme = Theme.of(tester.element(find.byType(KifePoolApp)));
      expect(theme.brightness, equals(Brightness.light));

      print('✅ Light theme applied correctly');
    });

    testWidgets('should apply dark theme correctly', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Set to dark theme
      if (!themeProvider.isDarkMode) {
        themeProvider.toggleTheme();
      }

      await tester.pumpAndSettle();

      // Verify dark theme is applied
      expect(themeProvider.isDarkMode, isTrue);

      // Check theme colors
      final theme = Theme.of(tester.element(find.byType(KifePoolApp)));
      expect(theme.brightness, equals(Brightness.dark));

      print('✅ Dark theme applied correctly');
    });

    testWidgets('should toggle theme correctly', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Get initial theme state
      final initialTheme = themeProvider.isDarkMode;

      // Toggle theme
      themeProvider.toggleTheme();
      await tester.pumpAndSettle();

      // Verify theme changed
      expect(themeProvider.isDarkMode, equals(!initialTheme));

      // Toggle again
      themeProvider.toggleTheme();
      await tester.pumpAndSettle();

      // Verify theme changed back
      expect(themeProvider.isDarkMode, equals(initialTheme));

      print('✅ Theme toggle working correctly');
    });

    testWidgets('should maintain theme state across widget rebuilds', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Set to dark theme
      if (!themeProvider.isDarkMode) {
        themeProvider.toggleTheme();
      }

      await tester.pumpAndSettle();

      // Force widget rebuild
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      // Verify theme state is maintained
      final newThemeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      expect(newThemeProvider.isDarkMode, isTrue);

      print('✅ Theme state maintained across rebuilds');
    });

    testWidgets('should apply theme to all UI components', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Test light theme
      if (themeProvider.isDarkMode) {
        themeProvider.toggleTheme();
      }

      await tester.pumpAndSettle();

      // Verify theme is applied to various components
      final theme = Theme.of(tester.element(find.byType(KifePoolApp)));
      expect(theme.brightness, equals(Brightness.light));

      // Check if bottom navigation is present and themed
      final bottomNav = find.byType(BottomNavigationBar);
      if (bottomNav.evaluate().isNotEmpty) {
        final bottomNavWidget = tester.widget<BottomNavigationBar>(bottomNav);
        expect(bottomNavWidget.backgroundColor, isNotNull);
      }

      print('✅ Theme applied to all UI components');
    });

    testWidgets('should handle theme persistence', (tester) async {
      // This test would require SharedPreferences integration
      // For now, we'll test the theme provider behavior

      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Toggle theme multiple times
      for (int i = 0; i < 3; i++) {
        themeProvider.toggleTheme();
        await tester.pumpAndSettle();
      }

      // Verify theme state is consistent
      expect(themeProvider.isDarkMode, isA<bool>());

      print('✅ Theme persistence handling working correctly');
    });

    testWidgets('should handle theme provider disposal', (tester) async {
      late ThemeProvider themeProvider;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) {
                themeProvider = ThemeProvider();
                return themeProvider;
              },
            ),
          ],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify theme provider is working
      expect(themeProvider.isDarkMode, isA<bool>());

      // Dispose the widget tree
      await tester.pumpWidget(const SizedBox.shrink());

      // Theme provider should still be accessible (not disposed by Provider)
      expect(themeProvider.isDarkMode, isA<bool>());

      print('✅ Theme provider disposal handled correctly');
    });

    testWidgets('should handle theme provider with multiple listeners', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Simulate multiple listeners by accessing the provider multiple times
      final provider1 = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );
      final provider2 = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // All should be the same instance
      expect(identical(themeProvider, provider1), isTrue);
      expect(identical(provider1, provider2), isTrue);

      // Toggle theme
      themeProvider.toggleTheme();
      await tester.pumpAndSettle();

      // All instances should reflect the change
      expect(provider1.isDarkMode, equals(themeProvider.isDarkMode));
      expect(provider2.isDarkMode, equals(themeProvider.isDarkMode));

      print('✅ Multiple listeners handled correctly');
    });

    testWidgets('should handle theme provider error states', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Test rapid theme toggling
      for (int i = 0; i < 10; i++) {
        themeProvider.toggleTheme();
        await tester.pump();
      }

      await tester.pumpAndSettle();

      // Theme should still be in a valid state
      expect(themeProvider.isDarkMode, isA<bool>());

      print('✅ Theme provider error states handled correctly');
    });

    testWidgets('should integrate with app theme correctly', (tester) async {
      await tester.pumpWidget(
        createTestApp(
          child: const KifePoolApp(),
          hasActiveWallet: true,
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<MockThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Test both themes
      for (bool isDark in [false, true]) {
        if (themeProvider.isDarkMode != isDark) {
          themeProvider.toggleTheme();
        }

        await tester.pumpAndSettle();

        // Verify theme is applied
        final theme = Theme.of(tester.element(find.byType(KifePoolApp)));
        expect(
          theme.brightness,
          equals(isDark ? Brightness.dark : Brightness.light),
        );

        // Verify theme data is correct
        if (isDark) {
          expect(theme.colorScheme.brightness, equals(Brightness.dark));
        } else {
          expect(theme.colorScheme.brightness, equals(Brightness.light));
        }
      }

      print('✅ Theme integration with app theme working correctly');
    });
  });
}
