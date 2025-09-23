import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _highContrastKey = 'high_contrast';
  static const String _largeTextKey = 'large_text';
  static const String _reducedMotionKey = 'reduced_motion';

  ThemeMode _themeMode = ThemeMode.dark; // Default to dark mode
  bool _isDarkMode = true;
  bool _isHighContrast = false;
  bool _isLargeText = false;
  bool _isReducedMotion = false;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;
  bool get isHighContrast => _isHighContrast;
  bool get isLargeText => _isLargeText;
  bool get isReducedMotion => _isReducedMotion;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themeKey);
      _isHighContrast = prefs.getBool(_highContrastKey) ?? false;
      _isLargeText = prefs.getBool(_largeTextKey) ?? false;
      _isReducedMotion = prefs.getBool(_reducedMotionKey) ?? false;

      if (savedTheme != null) {
        switch (savedTheme) {
          case 'light':
            _themeMode = ThemeMode.light;
            _isDarkMode = false;
            break;
          case 'dark':
            _themeMode = ThemeMode.dark;
            _isDarkMode = true;
            break;
          case 'system':
            _themeMode = ThemeMode.system;
            _isDarkMode = _getSystemTheme();
            break;
        }
        notifyListeners();
      }
    } catch (e) {
      // In test environment, silently ignore SharedPreferences errors
      if (!_isTestEnvironment()) {
        debugPrint('Error loading theme: $e');
      }
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;

    switch (mode) {
      case ThemeMode.light:
        _isDarkMode = false;
        break;
      case ThemeMode.dark:
        _isDarkMode = true;
        break;
      case ThemeMode.system:
        _isDarkMode = _getSystemTheme();
        break;
    }

    await _saveTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      await setThemeMode(ThemeMode.light);
    } else {
      await setThemeMode(ThemeMode.dark);
    }
  }

  Future<void> _saveTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String themeString;

      switch (_themeMode) {
        case ThemeMode.light:
          themeString = 'light';
          break;
        case ThemeMode.dark:
          themeString = 'dark';
          break;
        case ThemeMode.system:
          themeString = 'system';
          break;
      }

      await prefs.setString(_themeKey, themeString);
    } catch (e) {
      // In test environment, silently ignore SharedPreferences errors
      if (!_isTestEnvironment()) {
        debugPrint('Error saving theme: $e');
      }
    }
  }

  bool _getSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  void updateSystemTheme() {
    if (_themeMode == ThemeMode.system) {
      _isDarkMode = _getSystemTheme();
      notifyListeners();
    }
  }

  Future<void> toggleHighContrast() async {
    _isHighContrast = !_isHighContrast;
    await _saveAccessibilitySettings();
    notifyListeners();
  }

  Future<void> toggleLargeText() async {
    _isLargeText = !_isLargeText;
    await _saveAccessibilitySettings();
    notifyListeners();
  }

  Future<void> toggleReducedMotion() async {
    _isReducedMotion = !_isReducedMotion;
    await _saveAccessibilitySettings();
    notifyListeners();
  }

  Future<void> _saveAccessibilitySettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_highContrastKey, _isHighContrast);
      await prefs.setBool(_largeTextKey, _isLargeText);
      await prefs.setBool(_reducedMotionKey, _isReducedMotion);
    } catch (e) {
      // In test environment, silently ignore SharedPreferences errors
      if (!_isTestEnvironment()) {
        debugPrint('Error saving accessibility settings: $e');
      }
    }
  }

  bool _isTestEnvironment() {
    return const bool.fromEnvironment('dart.vm.product') == false &&
        (const bool.fromEnvironment('flutter.inspector.structuredErrors') ==
                true ||
            const bool.fromEnvironment('dart.vm.test') == true ||
            kDebugMode);
  }
}
