import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/providers/theme_provider.dart';
import '../shared/providers/wallet_provider.dart';
import '../shared/providers/staking_provider.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/wallet/presentation/screens/account_dashboard_screen.dart';
import '../features/wallet/presentation/screens/wallet_creation_screen.dart';
import '../features/wallet/presentation/screens/wallet_import_screen.dart';
import '../features/wallet/presentation/screens/seed_phrase_backup_screen.dart';
import '../features/staking/presentation/screens/staking_screen.dart';
import '../features/nfts/presentation/screens/nfts_screen.dart';
import '../features/transactions/presentation/screens/transactions_screen.dart';
import '../features/news/presentation/screens/news_screen.dart';
import 'theme/app_theme.dart';

class KifePoolApp extends StatefulWidget {
  const KifePoolApp({super.key});

  @override
  State<KifePoolApp> createState() => _KifePoolAppState();
}

class _KifePoolAppState extends State<KifePoolApp> {
  int _currentIndex = 0;
  bool _showOnboarding = true;

  final List<Widget> _screens = [
    const AccountDashboardScreen(),
    const StakingScreen(),
    const NFTsScreen(),
    const TransactionsScreen(),
    const NewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  void _checkOnboardingStatus() async {
    // Check if user has completed onboarding
    // For now, we'll show onboarding on first launch
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _showOnboarding = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
      ],
      child: Consumer2<ThemeProvider, WalletProvider>(
        builder: (context, themeProvider, walletProvider, child) {
          return MaterialApp(
            title: 'KifePool',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: _showOnboarding
                ? OnboardingScreen(
                    onComplete: () {
                      setState(() {
                        _showOnboarding = false;
                      });
                    },
                  )
                : Scaffold(
                    body: IndexedStack(
                      index: _currentIndex,
                      children: _screens,
                    ),
                    bottomNavigationBar: AppBottomNavigation(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
            routes: {
              '/wallet/create': (context) => const WalletCreationScreen(),
              '/wallet/import': (context) => const WalletImportScreen(),
              '/wallet/backup': (context) {
                final args =
                    ModalRoute.of(context)!.settings.arguments
                        as Map<String, dynamic>;
                return SeedPhraseBackupScreen(
                  mnemonic: args['mnemonic'],
                  walletName: args['walletName'],
                );
              },
            },
          );
        },
      ),
    );
  }
}
