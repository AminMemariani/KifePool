import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/providers/theme_provider.dart';
import '../shared/providers/wallet_provider.dart';
import '../shared/providers/staking_provider.dart';
import '../shared/providers/news_provider.dart';
import '../shared/providers/auth_provider.dart';
import '../core/services/serverpod_client.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../features/wallet/presentation/screens/account_dashboard_screen.dart';
import '../features/wallet/presentation/screens/wallet_creation_screen.dart';
import '../features/wallet/presentation/screens/wallet_import_screen.dart';
import '../features/wallet/presentation/screens/seed_phrase_backup_screen.dart';
import '../features/staking/presentation/screens/staking_screen.dart';
import '../features/nfts/presentation/screens/nfts_screen.dart';
import '../features/transactions/presentation/screens/transactions_screen.dart';
import '../features/cross_chain/presentation/screens/cross_chain_transfer_screen.dart';
import '../features/cross_chain/presentation/screens/xcm_transfer_history_screen.dart';
import '../features/news/presentation/screens/news_screen.dart';
import '../features/auth/presentation/screens/auth_screen.dart';
import 'theme/app_theme.dart';

class KifePoolApp extends StatefulWidget {
  const KifePoolApp({super.key});

  @override
  State<KifePoolApp> createState() => _KifePoolAppState();
}

class _KifePoolAppState extends State<KifePoolApp> {
  int _currentIndex = 0;
  bool _showOnboarding = true;
  bool _isInitialized = false;

  final List<Widget> _screens = [
    const AccountDashboardScreen(),
    const StakingScreen(),
    const NFTsScreen(),
    const TransactionsScreen(),
    const CrossChainTransferScreen(),
    const NewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Initialize Serverpod client
      await ServerpodClient.initialize();

      // Initialize providers
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.initialize();
      
      setState(() {
        _isInitialized = true;
        _showOnboarding = !authProvider.isAuthenticated;
      });
    } catch (e) {
      debugPrint('App initialization error: $e');
      setState(() {
        _isInitialized = true;
        _showOnboarding = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: Consumer3<ThemeProvider, AuthProvider, WalletProvider>(
        builder: (context, themeProvider, authProvider, walletProvider, child) {
          return MaterialApp(
            title: 'KifePool',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: !_isInitialized
                ? const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  )
                : _showOnboarding
                ? const AuthScreen()
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
              '/dashboard': (context) => Scaffold(
                body: IndexedStack(index: _currentIndex, children: _screens),
                bottomNavigationBar: AppBottomNavigation(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
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
