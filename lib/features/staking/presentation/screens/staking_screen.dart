import 'package:flutter/material.dart';
import 'package:kifepool/features/staking/presentation/screens/staking_dashboard_screen.dart';

class StakingScreen extends StatelessWidget {
  const StakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 StakingScreen: build() called - User clicked on Staking tab');
    debugPrint('🟢 StakingScreen: Context: $context');
    try {
      debugPrint('🔵 StakingScreen: Creating StakingDashboardScreen');
      return StakingDashboardScreen();
    } catch (e, stackTrace) {
      debugPrint('❌ StakingScreen: Error building StakingDashboardScreen: $e');
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
}
