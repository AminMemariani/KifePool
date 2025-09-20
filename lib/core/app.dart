import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/providers/theme_provider.dart';
import '../shared/widgets/bottom_navigation.dart';
import '../features/wallet/presentation/screens/wallet_screen.dart';
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

  final List<Widget> _screens = [
    const WalletScreen(),
    const StakingScreen(),
    const NFTsScreen(),
    const TransactionsScreen(),
    const NewsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'KifePool',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: Scaffold(
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
        );
      },
    );
  }
}
