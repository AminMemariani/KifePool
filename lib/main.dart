import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'core/app.dart';
import 'shared/providers/theme_provider.dart';
import 'shared/providers/wallet_provider.dart';
import 'shared/providers/staking_provider.dart';
import 'shared/providers/governance_provider.dart';
import 'core/services/database_service.dart';
import 'core/services/rpc_node_service.dart';
import 'core/services/font_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up global error handlers
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('❌ FlutterError: ${details.exception}');
    debugPrint('Stack trace: ${details.stack}');
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('❌ PlatformDispatcher error: $error');
    debugPrint('Stack trace: $stack');
    return true;
  };

  debugPrint('🟢 main(): Starting app initialization');

  // Initialize services
  try {
    debugPrint('🔵 main(): Initializing DatabaseService');
    await DatabaseService.initialize();
    debugPrint('✅ main(): DatabaseService initialized');
  } catch (e) {
    debugPrint('❌ main(): DatabaseService initialization failed: $e');
  }

  try {
    debugPrint('🔵 main(): Initializing RpcNodeService');
    await RpcNodeService.initialize();
    debugPrint('✅ main(): RpcNodeService initialized');
  } catch (e) {
    debugPrint('❌ main(): RpcNodeService initialization failed: $e');
  }

  try {
    debugPrint('🔵 main(): Initializing FontService');
    await FontService.initialize();
    debugPrint('✅ main(): FontService initialized');
  } catch (e) {
    debugPrint('❌ main(): FontService initialization failed: $e');
  }

  debugPrint('🟢 main(): Running app');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => StakingProvider()),
        ChangeNotifierProvider(create: (_) => GovernanceProvider()),
      ],
      child: const KifePoolApp(),
    ),
  );
}
