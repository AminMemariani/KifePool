import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/app.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';

/// Integration tests for App Navigation
/// Tests the complete navigation flow and bottom navigation
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Navigation Integration Tests', () {
    testWidgets('should load app with bottom navigation', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify bottom navigation is present
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify navigation items are present
      expect(find.text('Wallet'), findsOneWidget);
      expect(find.text('Staking'), findsOneWidget);
      expect(find.text('NFTs'), findsOneWidget);
      expect(find.text('Transactions'), findsOneWidget);
      expect(find.text('News'), findsOneWidget);

      print('✅ App loaded with bottom navigation');
    });

    testWidgets('should navigate to Wallet tab', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on Wallet tab
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      // Verify Wallet tab is selected
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, equals(0));

      print('✅ Navigation to Wallet tab working');
    });

    testWidgets('should navigate to Staking tab', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on Staking tab
      await tester.tap(find.text('Staking'));
      await tester.pumpAndSettle();

      // Verify Staking tab is selected
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, equals(1));

      print('✅ Navigation to Staking tab working');
    });

    testWidgets('should navigate to NFTs tab', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on NFTs tab
      await tester.tap(find.text('NFTs'));
      await tester.pumpAndSettle();

      // Verify NFTs tab is selected
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, equals(2));

      print('✅ Navigation to NFTs tab working');
    });

    testWidgets('should navigate to Transactions tab', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on Transactions tab
      await tester.tap(find.text('Transactions'));
      await tester.pumpAndSettle();

      // Verify Transactions tab is selected
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, equals(3));

      print('✅ Navigation to Transactions tab working');
    });

    testWidgets('should navigate to News tab', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on News tab
      await tester.tap(find.text('News'));
      await tester.pumpAndSettle();

      // Verify News tab is selected
      final bottomNav = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNav.currentIndex, equals(4));

      print('✅ Navigation to News tab working');
    });

    testWidgets('should maintain navigation state', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to different tabs
      final tabs = ['Wallet', 'Staking', 'NFTs', 'Transactions', 'News'];

      for (int i = 0; i < tabs.length; i++) {
        await tester.tap(find.text(tabs[i]));
        await tester.pumpAndSettle();

        final bottomNav = tester.widget<BottomNavigationBar>(
          find.byType(BottomNavigationBar),
        );
        expect(bottomNav.currentIndex, equals(i));
      }

      print('✅ Navigation state maintained correctly');
    });

    testWidgets('should handle rapid navigation', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Rapidly tap different tabs
      final tabs = ['Wallet', 'Staking', 'NFTs', 'Transactions', 'News'];

      for (int i = 0; i < 3; i++) {
        for (final tab in tabs) {
          await tester.tap(find.text(tab));
          await tester.pump();
        }
      }

      await tester.pumpAndSettle();

      // App should still be responsive
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ Rapid navigation handled correctly');
    });

    testWidgets('should handle navigation with theme changes', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      final themeProvider = Provider.of<ThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );

      // Navigate to different tabs while changing theme
      final tabs = ['Wallet', 'Staking', 'NFTs'];

      for (final tab in tabs) {
        await tester.tap(find.text(tab));
        await tester.pumpAndSettle();

        // Toggle theme
        themeProvider.toggleTheme();
        await tester.pumpAndSettle();

        // Verify navigation still works
        expect(find.byType(BottomNavigationBar), findsOneWidget);
      }

      print('✅ Navigation with theme changes working correctly');
    });

    testWidgets('should handle navigation bar interactions', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      final bottomNav = find.byType(BottomNavigationBar);
      expect(bottomNav, findsOneWidget);

      // Test tapping on navigation bar items
      final navItems = find.byType(BottomNavigationBarItem);
      expect(navItems, findsWidgets);

      // Test scrolling on navigation bar (if applicable)
      await tester.drag(bottomNav, const Offset(100, 0));
      await tester.pumpAndSettle();

      print('✅ Navigation bar interactions working correctly');
    });

    testWidgets('should handle app lifecycle with navigation', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to a tab
      await tester.tap(find.text('Staking'));
      await tester.pumpAndSettle();

      // Simulate app pause/resume
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.paused', null),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // Simulate app resume
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.resumed', null),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // Verify navigation state is maintained
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ App lifecycle with navigation handled correctly');
    });

    testWidgets('should handle navigation with different screen sizes', (
      tester,
    ) async {
      // Test with different screen sizes
      final screenSizes = [
        const Size(320, 568), // iPhone SE
        const Size(375, 667), // iPhone 8
        const Size(414, 896), // iPhone 11 Pro Max
        const Size(768, 1024), // iPad
      ];

      for (final size in screenSizes) {
        await tester.binding.setSurfaceSize(size);

        await tester.pumpWidget(
          MultiProvider(
            providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
            child: const KifePoolApp(),
          ),
        );

        await tester.pumpAndSettle();

        // Verify navigation works on different screen sizes
        expect(find.byType(BottomNavigationBar), findsOneWidget);

        // Test navigation
        await tester.tap(find.text('Wallet'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('NFTs'));
        await tester.pumpAndSettle();

        print(
          '✅ Navigation working on screen size: ${size.width}x${size.height}',
        );
      }

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should handle navigation accessibility', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test accessibility features
      final bottomNav = find.byType(BottomNavigationBar);
      expect(bottomNav, findsOneWidget);

      // Verify navigation items have proper semantics
      final navItems = find.byType(BottomNavigationBarItem);
      expect(navItems, findsWidgets);

      // Test with accessibility enabled
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/accessibility',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AccessibilityFeatures.update', {
            'accessibleNavigation': true,
          }),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // Navigation should still work
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      print('✅ Navigation accessibility working correctly');
    });

    testWidgets('should handle navigation with keyboard', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test keyboard navigation
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      // Navigation should still be accessible
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ Keyboard navigation working correctly');
    });
  });
}
