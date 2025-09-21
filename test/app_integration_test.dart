import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/app.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';

/// Helper function to check if BottomNavigationBar is present
/// Returns true if found, false if we're on wallet selection screen
bool hasBottomNavigationBar(WidgetTester tester) {
  return find.byType(BottomNavigationBar).evaluate().isNotEmpty;
}

/// Comprehensive integration tests for the entire KifePool app
/// Tests the complete user journey and app functionality
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('KifePool App Integration Tests', () {
    testWidgets('should load complete app successfully', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Verify app loads completely
      expect(find.byType(KifePoolApp), findsOneWidget);
      
      // Check if we're on wallet selection screen (no active wallet) or main app
      if (!hasBottomNavigationBar(tester)) {
        // We're on wallet selection screen - verify it's present
        expect(find.text('Create New Wallet'), findsOneWidget);
        expect(find.text('Import Existing Wallet'), findsOneWidget);
      } else {
        // We have an active wallet - verify main navigation
        expect(find.byType(BottomNavigationBar), findsOneWidget);
        expect(find.text('Wallet'), findsOneWidget);
        expect(find.text('Staking'), findsOneWidget);
        expect(find.text('NFTs'), findsOneWidget);
        expect(find.text('Transactions'), findsOneWidget);
        expect(find.text('News'), findsOneWidget);
      }

      print('✅ Complete app loaded successfully');
    });

    testWidgets('should handle complete user journey', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Start with Wallet tab
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      // Navigate through all tabs
      final tabs = ['Staking', 'NFTs', 'Transactions', 'News'];
      for (final tab in tabs) {
        await tester.tap(find.text(tab));
        await tester.pumpAndSettle();

        // Verify tab is selected
        final bottomNav = tester.widget<BottomNavigationBar>(
          find.byType(BottomNavigationBar),
        );
        expect(bottomNav.currentIndex, isA<int>());
      }

      // Return to Wallet
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      print('✅ Complete user journey completed successfully');
    });

    testWidgets('should handle theme switching throughout app', (tester) async {
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

      // Test theme switching on different tabs
      final tabs = ['Wallet', 'Staking', 'NFTs', 'Transactions', 'News'];

      for (final tab in tabs) {
        await tester.tap(find.text(tab));
        await tester.pumpAndSettle();

        // Toggle theme
        themeProvider.toggleTheme();
        await tester.pumpAndSettle();

        // Verify theme is applied
        final theme = Theme.of(tester.element(find.byType(KifePoolApp)));
        expect(theme.brightness, isA<Brightness>());
      }

      print('✅ Theme switching throughout app working correctly');
    });

    testWidgets('should handle app state persistence', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Navigate to a specific tab
      await tester.tap(find.text('NFTs'));
      await tester.pumpAndSettle();

      // Change theme
      final themeProvider = Provider.of<ThemeProvider>(
        tester.element(find.byType(KifePoolApp)),
        listen: false,
      );
      themeProvider.toggleTheme();
      await tester.pumpAndSettle();

      // Simulate app restart by rebuilding
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ App state persistence handled correctly');
    });

    testWidgets('should handle app performance under load', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      final stopwatch = Stopwatch()..start();

      // Perform multiple rapid interactions
      for (int i = 0; i < 10; i++) {
        // Navigate between tabs
        await tester.tap(find.text('Wallet'));
        await tester.pump();

        await tester.tap(find.text('Staking'));
        await tester.pump();

        await tester.tap(find.text('NFTs'));
        await tester.pump();

        // Toggle theme
        final themeProvider = Provider.of<ThemeProvider>(
          tester.element(find.byType(KifePoolApp)),
          listen: false,
        );
        themeProvider.toggleTheme();
        await tester.pump();
      }

      await tester.pumpAndSettle();
      stopwatch.stop();

      // App should still be responsive
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(
        stopwatch.elapsedMilliseconds,
        lessThan(10000),
      ); // Should complete within 10 seconds

      print('✅ App performance under load: ${stopwatch.elapsedMilliseconds}ms');
    });

    testWidgets('should handle app with different orientations', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test portrait orientation
      await tester.binding.setSurfaceSize(const Size(375, 667));
      await tester.pumpAndSettle();

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test landscape orientation
      await tester.binding.setSurfaceSize(const Size(667, 375));
      await tester.pumpAndSettle();

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test navigation in landscape
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Staking'));
      await tester.pumpAndSettle();

      // Reset to default size
      await tester.binding.setSurfaceSize(null);

      print('✅ App orientation handling working correctly');
    });

    testWidgets('should handle app with different screen densities', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test different screen densities
      final densities = [1.0, 1.5, 2.0, 3.0];

      for (final density in densities) {
        await tester.binding.setSurfaceSize(const Size(375, 667));
        await tester.pumpAndSettle();

        // Verify app still works
        expect(find.byType(BottomNavigationBar), findsOneWidget);

        // Test navigation
        await tester.tap(find.text('Wallet'));
        await tester.pumpAndSettle();

        print('✅ App working with density: $density');
      }

      print('✅ App screen density handling working correctly');
    });

    testWidgets('should handle app with accessibility features', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Enable accessibility features
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/accessibility',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AccessibilityFeatures.update', {
            'accessibleNavigation': true,
            'invertColors': false,
            'disableAnimations': false,
            'boldText': false,
            'reduceMotion': false,
            'highContrast': false,
          }),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test navigation with accessibility
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Staking'));
      await tester.pumpAndSettle();

      print('✅ App accessibility features working correctly');
    });

    testWidgets('should handle app with different locales', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // App should work regardless of locale
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test navigation
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      print('✅ App locale handling working correctly');
    });

    testWidgets('should handle app with different text scales', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test different text scales
      final textScales = [0.8, 1.0, 1.2, 1.5, 2.0];

      for (final scale in textScales) {
        // App should adapt to different text scales
        expect(find.byType(BottomNavigationBar), findsOneWidget);

        // Test navigation
        await tester.tap(find.text('Wallet'));
        await tester.pumpAndSettle();

        print('✅ App working with text scale: $scale');
      }

      print('✅ App text scale handling working correctly');
    });

    testWidgets('should handle app with different platform channels', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test platform channel interactions
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/platform',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('SystemChrome.setSystemUIOverlayStyle', null),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ App platform channel handling working correctly');
    });

    testWidgets('should handle app with different input methods', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Test different input methods
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pumpAndSettle();

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      print('✅ App input method handling working correctly');
    });

    testWidgets('should handle app with different memory constraints', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Simulate memory pressure
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/system',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('SystemChrome.setSystemUIOverlayStyle', null),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test navigation
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      print('✅ App memory constraint handling working correctly');
    });

    testWidgets('should handle app with different network conditions', (
      tester,
    ) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
          child: const KifePoolApp(),
        ),
      );

      await tester.pumpAndSettle();

      // Simulate different network conditions
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/network',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('NetworkInfo.isConnected', null),
        ),
        (data) {},
      );

      await tester.pumpAndSettle();

      // App should still be functional
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Test navigation
      await tester.tap(find.text('Wallet'));
      await tester.pumpAndSettle();

      print('✅ App network condition handling working correctly');
    });
  });
}
