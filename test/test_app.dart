import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'test_wallet_selection_screen.dart';
import 'package:kifepool/shared/widgets/bottom_navigation.dart';
import 'test_theme.dart';
import 'test_helpers.dart';

/// Simple test-specific app that doesn't use Google Fonts
class SimpleTestKifePoolApp extends StatelessWidget {
  const SimpleTestKifePoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MockThemeProvider()),
        ChangeNotifierProvider(create: (_) => MockWalletProvider()),
        ChangeNotifierProvider(create: (_) => MockLanguageProvider()),
      ],
      child:
          Consumer3<
            MockThemeProvider,
            MockWalletProvider,
            MockLanguageProvider
          >(
            builder:
                (
                  context,
                  themeProvider,
                  walletProvider,
                  languageProvider,
                  child,
                ) {
                  return MaterialApp(
                    title: 'KifePool Test',
                    theme: TestTheme.lightTheme,
                    darkTheme: TestTheme.darkTheme,
                    themeMode: themeProvider.themeMode,
                    home: walletProvider.hasActiveWallet
                        ? const TestMainScreen()
                        : const TestWalletSelectionScreen(),
                    routes: {'/dashboard': (context) => const TestMainScreen()},
                  );
                },
          ),
    );
  }
}

/// Test main screen with bottom navigation
class TestMainScreen extends StatelessWidget {
  const TestMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Test Main Screen')),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: 0,
        onTap: (index) {
          // Test navigation handler
        },
      ),
    );
  }
}
