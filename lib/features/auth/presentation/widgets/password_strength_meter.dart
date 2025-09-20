import 'package:flutter/material.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Password strength meter widget
class PasswordStrengthMeter extends StatelessWidget {
  final String password;

  const PasswordStrengthMeter({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final strength = _calculatePasswordStrength(password);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Password Strength: ',
              style: AppTypography.bodySmall.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            Text(
              _getStrengthText(strength),
              style: AppTypography.bodySmall.copyWith(
                color: _getStrengthColor(strength),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        _buildStrengthBar(strength),
        const SizedBox(height: AppSpacing.sm),
        _buildRequirements(context),
      ],
    );
  }

  Widget _buildStrengthBar(double strength) {
    return Row(
      children: List.generate(4, (index) {
        final isActive = (index + 1) / 4 <= strength;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < 3 ? AppSpacing.xs : 0),
            decoration: BoxDecoration(
              color: isActive
                  ? _getStrengthColor(strength)
                  : Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRequirements(BuildContext context) {
    final requirements = _getPasswordRequirements(password);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: requirements.map((req) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            children: [
              Icon(
                req.isMet ? Icons.check_circle : Icons.circle_outlined,
                size: 16,
                color: req.isMet
                    ? Colors.green
                    : Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                req.text,
                style: AppTypography.bodySmall.copyWith(
                  color: req.isMet
                      ? Colors.green
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  double _calculatePasswordStrength(String password) {
    if (password.isEmpty) return 0.0;

    double strength = 0.0;

    // Length check
    if (password.length >= 8) strength += 0.25;
    if (password.length >= 12) strength += 0.25;

    // Character variety checks
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.125;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.125;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.125;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) strength += 0.125;

    return strength.clamp(0.0, 1.0);
  }

  String _getStrengthText(double strength) {
    if (strength < 0.25) return 'Weak';
    if (strength < 0.5) return 'Fair';
    if (strength < 0.75) return 'Good';
    return 'Strong';
  }

  Color _getStrengthColor(double strength) {
    if (strength < 0.25) return Colors.red;
    if (strength < 0.5) return Colors.orange;
    if (strength < 0.75) return Colors.yellow.shade700;
    return Colors.green;
  }

  List<PasswordRequirement> _getPasswordRequirements(String password) {
    return [
      PasswordRequirement(
        text: 'At least 8 characters',
        isMet: password.length >= 8,
      ),
      PasswordRequirement(
        text: 'Contains lowercase letter',
        isMet: RegExp(r'[a-z]').hasMatch(password),
      ),
      PasswordRequirement(
        text: 'Contains uppercase letter',
        isMet: RegExp(r'[A-Z]').hasMatch(password),
      ),
      PasswordRequirement(
        text: 'Contains number',
        isMet: RegExp(r'[0-9]').hasMatch(password),
      ),
      PasswordRequirement(
        text: 'Contains special character',
        isMet: RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password),
      ),
    ];
  }
}

class PasswordRequirement {
  final String text;
  final bool isMet;

  PasswordRequirement({required this.text, required this.isMet});
}
