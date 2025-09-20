import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/app.dart';
import 'shared/providers/theme_provider.dart';
import 'shared/providers/wallet_provider.dart';
import 'shared/providers/staking_provider.dart';
import 'core/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  await DatabaseService.initialize();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
      ],
      child: const KifePoolApp(),
    ),
  );
}
