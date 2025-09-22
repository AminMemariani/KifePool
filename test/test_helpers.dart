import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/shared/providers/language_provider.dart';
import 'package:kifepool/core/theme/app_theme.dart';
import 'package:kifepool/shared/widgets/bottom_navigation.dart';
import 'package:kifepool/features/wallet/presentation/wallet_demo_screen.dart';
import 'package:kifepool/features/wallet/presentation/screens/wallet_selection_screen.dart';
import 'package:kifepool/features/staking/presentation/screens/staking_screen.dart';
import 'package:kifepool/features/nfts/presentation/screens/nfts_screen.dart';
import 'package:kifepool/features/transactions/presentation/screens/transaction_history_screen.dart';
import 'package:kifepool/features/news/presentation/screens/news_screen.dart';
import 'package:kifepool/l10n/app_localizations.dart';
import 'package:kifepool/shared/providers/staking_provider.dart';
import 'package:kifepool/shared/providers/news_provider.dart';

/// Mock wallet provider for testing
class MockWalletProvider extends WalletProvider {
  bool _hasActiveWallet = true;
  WalletAccount? _mockAccount;

  MockWalletProvider() {
    _mockAccount = WalletAccount.create(
      address: 'test-address-123',
      name: 'Test Wallet',
      publicKey: 'test-public-key',
      encryptedPrivateKey: 'encrypted-key',
      derivationPath: "m/44'/354'/0'/0/0",
      accountIndex: 0,
      walletType: 'mnemonic',
      mnemonicId: 'test-mnemonic',
    );
  }

  @override
  bool get hasActiveWallet => _hasActiveWallet;

  @override
  WalletAccount? get activeAccount => _hasActiveWallet ? _mockAccount : null;

  @override
  bool get isInitialized => true;

  @override
  bool get hasWallet => true;

  @override
  Future<void> initialize() async {
    // Mock implementation - simulate async initialization
    await Future.delayed(const Duration(milliseconds: 1));
  }

  void setHasActiveWallet(bool value) {
    _hasActiveWallet = value;
    notifyListeners();
  }
}

/// Mock theme provider for testing
class MockThemeProvider extends ThemeProvider {
  @override
  ThemeMode get themeMode => ThemeMode.dark;

  @override
  bool get isDarkMode => true;

  @override
  bool get isHighContrast => false;

  @override
  bool get isLargeText => false;

  @override
  bool get isReducedMotion => false;

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    // Mock implementation - do nothing
  }

  @override
  Future<void> toggleTheme() async {
    // Mock implementation - do nothing
  }

  @override
  Future<void> toggleHighContrast() async {
    // Mock implementation - do nothing
  }

  @override
  Future<void> toggleLargeText() async {
    // Mock implementation - do nothing
  }

  @override
  Future<void> toggleReducedMotion() async {
    // Mock implementation - do nothing
  }

  // Override the constructor to prevent SharedPreferences loading
  MockThemeProvider() : super() {
    // Don't call _loadTheme() to avoid SharedPreferences issues
  }

  // Note: Cannot override private methods, but constructor prevents SharedPreferences access
}

/// Mock language provider for testing
class MockLanguageProvider extends LanguageProvider {
  @override
  bool get isInitialized => true;

  @override
  Locale get currentLocale => const Locale('en', '');

  @override
  Future<void> initialize() async {
    // Mock implementation - simulate async initialization
    await Future.delayed(const Duration(milliseconds: 1));
  }
}

/// Test-specific app widget that uses mock providers
class TestKifePoolApp extends StatefulWidget {
  final bool hasActiveWallet;

  const TestKifePoolApp({super.key, this.hasActiveWallet = true});

  @override
  State<TestKifePoolApp> createState() => _TestKifePoolAppState();
}

class _TestKifePoolAppState extends State<TestKifePoolApp> {
  late PageController _pageController;
  int _currentIndex = 0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _isInitialized = true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mockWalletProvider = MockWalletProvider();
    mockWalletProvider.setHasActiveWallet(widget.hasActiveWallet);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => MockThemeProvider(),
        ),
        ChangeNotifierProvider(create: (_) => MockLanguageProvider()),
        ChangeNotifierProvider<WalletProvider>(
          create: (_) => mockWalletProvider,
        ),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: Consumer3<ThemeProvider, MockLanguageProvider, WalletProvider>(
        builder:
            (context, themeProvider, languageProvider, walletProvider, child) {
              return MaterialApp(
                title: 'KifePool Test',
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
              );
            },
      ),
    );
  }

  List<Widget> get _screens => [
    const WalletDemoScreen(),
    const StakingScreen(),
    const NFTsScreen(),
    const TransactionHistoryScreen(),
    const NewsScreen(),
  ];
}

/// Helper function to create test app with mock providers
Widget createTestApp({required Widget child, bool hasActiveWallet = true}) {
  return TestKifePoolApp(hasActiveWallet: hasActiveWallet);
}

/// Test data constants
class TestData {
  static const String testAddress = 'test-address-123';
  static const String testPublicKey = 'test-public-key';
  static const String testWalletName = 'Test Wallet';
  static const String testMnemonic =
      'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';

  static WalletAccount get testWalletAccount => WalletAccount.create(
    address: testAddress,
    name: testWalletName,
    publicKey: testPublicKey,
    encryptedPrivateKey: 'encrypted-private-key',
    derivationPath: "m/44'/354'/0'/0/0",
    accountIndex: 0,
    walletType: 'mnemonic',
    mnemonicId: 'test-mnemonic',
  );
  
  static List<ChainBalance> get testBalances => [
    const ChainBalance(
      chain: 'Polkadot',
      symbol: 'DOT',
      balance: '10.5',
      usdValue: '85.50',
      decimals: 10,
    ),
    const ChainBalance(
      chain: 'Moonbeam',
      symbol: 'GLMR',
      balance: '100.0',
      usdValue: '25.00',
      decimals: 18,
    ),
    const ChainBalance(
      chain: 'Astar',
      symbol: 'ASTR',
      balance: '500.0',
      usdValue: '15.00',
      decimals: 18,
    ),
  ];
}

/// Helper function to wait for async operations in tests
Future<void> waitForAsyncOperations() async {
  await Future.delayed(const Duration(milliseconds: 100));
}

/// Helper function to pump and settle with timeout
Future<void> pumpAndSettleWithTimeout(
  WidgetTester tester, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  await tester.pumpAndSettle(timeout);
}
