// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:kifepool/shared/providers/theme_provider.dart';
import 'test_helpers.dart';
import 'test_app.dart';

void main() {
  setUpAll(() {
    TestHelpers.setupPlatformMocks();
  });

  tearDownAll(() {
    TestHelpers.cleanupPlatformMocks();
  });
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our test app and trigger a frame.
    await tester.pumpWidget(
      const TestKifePoolApp(),
    );

    // Wait for the app to load (use pump instead of pumpAndSettle to avoid timeout)
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Check if we're on wallet selection screen (no active wallet) or main app
    if (find.text('Create New Wallet').evaluate().isNotEmpty) {
      // We're on wallet selection screen - verify it's present
      expect(find.text('Create New Wallet'), findsOneWidget);
      expect(find.text('Import Existing Wallet'), findsOneWidget);
      expect(find.text('KifePool'), findsOneWidget);
    } else {
      // We have an active wallet - verify main navigation
      expect(find.text('Wallet'), findsOneWidget);
      expect(find.text('Staking'), findsOneWidget);
      expect(find.text('NFTs'), findsOneWidget);
      expect(find.text('Transactions'), findsOneWidget);
      expect(find.text('News'), findsOneWidget);
    }
  });

  testWidgets('Theme provider works correctly', (WidgetTester tester) async {
    // Test theme provider independently
    final themeProvider = ThemeProvider();

    // Verify initial theme (defaults to dark mode)
    expect(themeProvider.isDarkMode, true);

    // Toggle theme
    themeProvider.toggleTheme();
    expect(themeProvider.isDarkMode, false);

    // Toggle back
    themeProvider.toggleTheme();
    expect(themeProvider.isDarkMode, true);
  });
}
