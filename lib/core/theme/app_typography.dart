import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Font Family
  // static const String _fontFamily = 'Inter';

  /// Check if we're in test environment
  static bool _isTestEnvironment() {
    return const bool.fromEnvironment('dart.vm.product') == false &&
        (const bool.fromEnvironment('flutter.inspector.structuredErrors') ==
                true ||
            const bool.fromEnvironment('dart.vm.test') == true ||
            kDebugMode);
  }

  /// Get text style with appropriate font family
  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    double? height,
    List<FontFeature>? fontFeatures,
  }) {
    if (_isTestEnvironment()) {
      // Use system font in test environment
      return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontFeatures: fontFeatures,
      );
    } else {
      // Use Google Fonts in production
      return GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontFeatures: fontFeatures,
      );
    }
  }

  // Display Styles
  static TextStyle get displayLarge => _getTextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static TextStyle get displayMedium => _getTextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  static TextStyle get displaySmall => _getTextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );

  // Headline Styles
  static TextStyle get headlineLarge => _getTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
  );

  static TextStyle get headlineMedium => _getTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.29,
  );

  static TextStyle get headlineSmall => _getTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title Styles
  static TextStyle get titleLarge => _getTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.27,
  );

  static TextStyle get titleMedium => _getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
  );

  static TextStyle get titleSmall => _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Body Styles
  static TextStyle get bodyLarge => _getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
  );

  static TextStyle get bodyMedium => _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static TextStyle get bodySmall => _getTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Label Styles
  static TextStyle get labelLarge => _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static TextStyle get labelMedium => _getTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static TextStyle get labelSmall => _getTextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // Custom Styles for Crypto App
  static TextStyle get cryptoAmount => _getTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle get cryptoAmountLarge => _getTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static TextStyle get walletAddress => _getTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.33,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static TextStyle get buttonText => _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.43,
  );
}
