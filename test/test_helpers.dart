import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/shared/providers/language_provider.dart';
import 'package:kifepool/core/theme/app_theme.dart';
import 'package:kifepool/features/wallet/presentation/wallet_demo_screen.dart';
import 'package:kifepool/features/wallet/presentation/screens/wallet_selection_screen.dart';
import 'package:kifepool/features/staking/presentation/screens/staking_screen.dart';
import 'package:kifepool/features/transactions/presentation/screens/transaction_history_screen.dart';
import 'package:kifepool/features/news/presentation/screens/news_screen.dart';
import 'package:kifepool/l10n/app_localizations.dart';
import 'package:kifepool/shared/providers/staking_provider.dart';
import 'package:kifepool/shared/providers/news_provider.dart';
import 'package:kifepool/shared/providers/theme_provider.dart';
import 'package:kifepool/core/services/database_service.dart';

// Test environment initialization to avoid MissingPlugin and DB issues
void initializeTestEnvironment() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // Mock SharedPreferences storage
  SharedPreferences.setMockInitialValues(<String, Object>{});
  // Prevent GoogleFonts from hitting platform channels (path_provider)
  GoogleFonts.config.allowRuntimeFetching = false;
  // Use in-memory mocks for database access in tests
  DatabaseService.mockEnabled = true;
  // Initialize database service to ensure mock is ready
  DatabaseService.initialize();
}

// Test environment initialization function is available for use in test files

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
class MockThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;
  bool get isHighContrast => false;
  bool get isLargeText => false;
  bool get isReducedMotion => false;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    _isDarkMode = mode == ThemeMode.dark;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }

  Future<void> toggleHighContrast() async {
    // Mock implementation - do nothing
  }

  Future<void> toggleLargeText() async {
    // Mock implementation - do nothing
  }

  Future<void> toggleReducedMotion() async {
    // Mock implementation - do nothing
  }
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
          create: (_) => ThemeProvider(),
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
                        bottomNavigationBar: TestBottomNavigation(
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
    const TestNFTsScreen(),
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

/// Test-specific NFTs screen that works with MockThemeProvider
class TestNFTsScreen extends StatelessWidget {
  const TestNFTsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFTs'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No NFTs found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your NFT collection will appear here',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/// Test-specific bottom navigation widget that works with MockThemeProvider
class TestBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TestBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: themeProvider.isDarkMode
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: themeProvider.isDarkMode
              ? const Color(0xFF1E1E1E)
              : const Color(0xFFF5F5F5),
          selectedItemColor: const Color(0xFF6366F1),
          unselectedItemColor: themeProvider.isDarkMode
              ? const Color(0xFF9CA3AF)
              : const Color(0xFF6B7280),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_outlined),
              activeIcon: Icon(Icons.trending_up),
              label: 'Staking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              activeIcon: Icon(Icons.image),
              label: 'NFTs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              activeIcon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined),
              activeIcon: Icon(Icons.newspaper),
              label: 'News',
            ),
          ],
        ),
      ),
    );
  }
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
