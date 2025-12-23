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

  List<Widget> get _screens => [
    const AccountDashboardScreen(),
    _buildStakingScreen(),
    const NFTsScreen(),
    const TransactionsScreen(),
    const NewsScreen(),
  ];

  Widget _buildStakingScreen() {
    debugPrint('🟢 App: Building StakingScreen widget');
    try {
      return const StakingScreen();
    } catch (e, stackTrace) {
      debugPrint('❌ App: Error creating StakingScreen: $e');
      debugPrint('Stack trace: $stackTrace');
      return Scaffold(
        appBar: AppBar(title: const Text('Staking')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error loading staking screen: $e'),
            ],
          ),
        ),
      );
    }
  }

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
                        body: Builder(
                          builder: (context) {
                            debugPrint('🟢 App: Building PageView');
                            try {
                              return PageView.builder(
                                controller: _pageController,
                                itemCount: 5,
                                onPageChanged: (index) {
                                  debugPrint('🟢 App: PageView onPageChanged called, index: $index');
                                  if (index == 1) {
                                    debugPrint('🟢 App: Page changed to Staking screen (index 1)');
                                  }
                                  try {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                    debugPrint('✅ App: State updated for page $index');
                                  } catch (e, stackTrace) {
                                    debugPrint('❌ App: Error in onPageChanged setState: $e');
                                    debugPrint('Stack trace: $stackTrace');
                                  }
                                },
                                itemBuilder: (context, index) {
                                  debugPrint('🔵 App: PageView building page $index');
                                  try {
                                    Widget screen;
                                    switch (index) {
                                      case 0:
                                        screen = const AccountDashboardScreen();
                                        break;
                                      case 1:
                                        debugPrint('🔵 App: Building StakingScreen (index 1)');
                                        screen = _buildStakingScreen();
                                        break;
                                      case 2:
                                        screen = const NFTsScreen();
                                        break;
                                      case 3:
                                        screen = const TransactionsScreen();
                                        break;
                                      case 4:
                                        screen = const NewsScreen();
                                        break;
                                      default:
                                        screen = const Scaffold(body: Center(child: Text('Unknown page')));
                                    }
                                    debugPrint('✅ App: Successfully created screen for index $index');
                                    return screen;
                                  } catch (e, stackTrace) {
                                    debugPrint('❌ App: Error building page $index: $e');
                                    debugPrint('Stack trace: $stackTrace');
                                    return Scaffold(
                                      appBar: AppBar(title: Text('Page $index')),
                                      body: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.error_outline, size: 64, color: Colors.red),
                                            const SizedBox(height: 16),
                                            Text('Error loading page $index: $e'),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            } catch (e, stackTrace) {
                              debugPrint('❌ App: Error building PageView: $e');
                              debugPrint('Stack trace: $stackTrace');
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                                    const SizedBox(height: 16),
                                    Text('Error building PageView: $e'),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        bottomNavigationBar: AppBottomNavigation(
                          currentIndex: _currentIndex,
                          onTap: (index) {
                            debugPrint('🟢 App: Bottom navigation tapped, index: $index');
                            if (index == 1) {
                              debugPrint('🟢 App: Staking tab pressed!');
                            }
                            try {
                              setState(() {
                                _currentIndex = index;
                              });
                              debugPrint('🔵 App: State updated, animating to page $index');
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              ).then((_) {
                                debugPrint('✅ App: Successfully navigated to page $index');
                              }).catchError((error, stackTrace) {
                                debugPrint('❌ App: Error navigating to page $index: $error');
                                debugPrint('Stack trace: $stackTrace');
                              });
                            } catch (e, stackTrace) {
                              debugPrint('❌ App: Error in onTap handler: $e');
                              debugPrint('Stack trace: $stackTrace');
                            }
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
