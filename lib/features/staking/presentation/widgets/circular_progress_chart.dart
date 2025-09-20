import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Circular progress chart widget for staking visualization
class CircularProgressChart extends StatelessWidget {
  final double progress;
  final String title;
  final String subtitle;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double size;

  const CircularProgressChart({
    super.key,
    required this.progress,
    required this.title,
    required this.subtitle,
    this.progressColor = Colors.green,
    this.backgroundColor = Colors.grey,
    this.strokeWidth = 8.0,
    this.size = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
            ),
          ),

          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),

          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: progressColor,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Staking progress chart with multiple segments
class StakingProgressChart extends StatelessWidget {
  final double stakedAmount;
  final double totalBalance;
  final double rewards;
  final String symbol;
  final double size;

  const StakingProgressChart({
    super.key,
    required this.stakedAmount,
    required this.totalBalance,
    required this.rewards,
    required this.symbol,
    this.size = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    final stakingRatio = totalBalance > 0 ? stakedAmount / totalBalance : 0.0;
    final rewardsRatio = totalBalance > 0 ? rewards / totalBalance : 0.0;

    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 12.0,
              backgroundColor: Colors.grey.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),

          // Staked amount segment
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: stakingRatio.clamp(0.0, 1.0),
              strokeWidth: 12.0,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),

          // Rewards segment (if any)
          if (rewards > 0)
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: (stakingRatio + rewardsRatio).clamp(0.0, 1.0),
                strokeWidth: 8.0,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),

          // Center content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${(stakingRatio * 100).toStringAsFixed(1)}%',
                  style: AppTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'Staked',
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                if (rewards > 0) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '+${rewards.toStringAsFixed(2)} $symbol',
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// APY comparison chart
class ApyComparisonChart extends StatelessWidget {
  final List<ApyData> apyData;
  final double size;

  const ApyComparisonChart({
    super.key,
    required this.apyData,
    this.size = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    if (apyData.isEmpty) {
      return Container(
        width: size,
        height: size,
        child: Center(
          child: Text(
            'No data available',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ),
      );
    }

    final maxApy = apyData.map((e) => e.apy).reduce((a, b) => a > b ? a : b);

    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: ApyChartPainter(apyData, maxApy),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'APY Comparison',
                style: AppTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Max: ${maxApy.toStringAsFixed(2)}%',
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApyData {
  final String name;
  final double apy;
  final Color color;

  ApyData({required this.name, required this.apy, required this.color});
}

class ApyChartPainter extends CustomPainter {
  final List<ApyData> apyData;
  final double maxApy;

  ApyChartPainter(this.apyData, this.maxApy);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    double startAngle = -90 * (3.14159 / 180); // Start from top

    for (int i = 0; i < apyData.length; i++) {
      final data = apyData[i];
      final sweepAngle = (data.apy / maxApy) * 2 * 3.14159;

      paint.color = data.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
