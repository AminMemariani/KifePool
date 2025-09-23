import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/providers/theme_provider.dart';
import '../shared/providers/wallet_provider.dart';
import '../shared/providers/staking_provider.dart';
import '../shared/providers/news_provider.dart';
import '../shared/providers/language_provider.dart';
import '../core/services/serverpod_client.dart';
import '../l10n/app_localizations.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../features/wallet/presentation/screens/account_dashboard_screen.dart';
import '../features/wallet/presentation/screens/wallet_creation_screen.dart';
import '../features/wallet/presentation/screens/wallet_import_screen.dart';
import '../features/wallet/presentation/screens/seed_phrase_backup_screen.dart';
import '../features/staking/presentation/screens/staking_screen.dart';
import '../features/nfts/presentation/screens/nfts_screen.dart';
import '../features/transactions/presentation/screens/transactions_screen.dart';
import '../features/cross_chain/presentation/screens/xcm_transfer_history_screen.dart';
import '../features/news/presentation/screens/news_screen.dart';
import '../features/wallet/presentation/screens/wallet_selection_screen.dart';
import 'theme/app_theme.dart';

class KifePoolApp extends StatefulWidget {
  const KifePoolApp({super.key});

  @override
  State<KifePoolApp> createState() => _KifePoolAppState();
}

class _KifePoolAppState extends State<KifePoolApp>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isInitialized = false;
  late PageController _pageController;

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
    _pageController = PageController(initialPage: _currentIndex);
    _initializeApp();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    try {
      // Initialize Serverpod client
      await ServerpodClient.initialize();

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('App initialization error: $e');
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: Consumer3<ThemeProvider, LanguageProvider, WalletProvider>(
        builder:
            (context, themeProvider, languageProvider, walletProvider, child) {
              // Initialize providers when they become available
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                if (!languageProvider.isInitialized) {
                  await languageProvider.initialize();
                }
                if (!walletProvider.isInitialized) {
                  await walletProvider.initialize();
                }
              });
              return MaterialApp(
                title: 'KifePool',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.themeMode,
                locale: languageProvider.currentLocale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: !_isInitialized
                    ? const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      )
                    : !walletProvider.hasActiveWallet
                    ? const WalletSelectionScreen()
                    : Scaffold(
                        body: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          children: _screens,
                        ),
                        bottomNavigationBar: AppBottomNavigation(
                          currentIndex: _currentIndex,
                          onTap: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                routes: {
                  '/dashboard': (context) => Scaffold(
                    body: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: _screens,
                    ),
                    bottomNavigationBar: AppBottomNavigation(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
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
                  '/cross-chain/history': (context) =>
                      const XcmTransferHistoryScreen(),
                },
              );
            },
      ),
    );
  }
}
