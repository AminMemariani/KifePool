// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:kifepool/core/app.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
        child: const KifePoolApp(),
      ),
    );

    // Wait for the app to load
    await tester.pumpAndSettle();

    // Check if we're on the onboarding screen first
    if (find.text('Welcome to KifePool').evaluate().isNotEmpty) {
      // Skip onboarding by tapping the skip button
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();
    }

    // Verify that the app loads with the main navigation
    expect(find.text('Wallet'), findsOneWidget);
    expect(find.text('Staking'), findsOneWidget);
    expect(find.text('NFTs'), findsOneWidget);
    expect(find.text('Transactions'), findsOneWidget);
    expect(find.text('News'), findsOneWidget);
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
