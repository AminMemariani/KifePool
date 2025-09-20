import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en', '');
  bool _isLoading = false;
  bool _isInitialized = false;

  Locale get currentLocale => _currentLocale;
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  /// Initialize the language provider
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('language_code') ?? 'en';
      _currentLocale = Locale(languageCode);
    } catch (e) {
      debugPrint('Error loading language preference: $e');
      _currentLocale = const Locale('en', '');
    } finally {
      _isLoading = false;
      _isInitialized = true;
      notifyListeners();
    }
  }

  /// Change the app language
  Future<void> changeLanguage(Locale locale) async {
    if (_currentLocale == locale) return;

    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', locale.languageCode);
      _currentLocale = locale;
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get available languages
  List<LanguageOption> get availableLanguages => [
    LanguageOption(
      locale: const Locale('en', ''),
      name: 'English',
      flag: '🇺🇸',
    ),
    LanguageOption(
      locale: const Locale('es', ''),
      name: 'Español',
      flag: '🇪🇸',
    ),
  ];

  /// Get current language name
  String get currentLanguageName {
    final option = availableLanguages.firstWhere(
      (lang) => lang.locale.languageCode == _currentLocale.languageCode,
      orElse: () => availableLanguages.first,
    );
    return option.name;
  }

  /// Get current language flag
  String get currentLanguageFlag {
    final option = availableLanguages.firstWhere(
      (lang) => lang.locale.languageCode == _currentLocale.languageCode,
      orElse: () => availableLanguages.first,
    );
    return option.flag;
  }
}

class LanguageOption {
  final Locale locale;
  final String name;
  final String flag;

  LanguageOption({
    required this.locale,
    required this.name,
    required this.flag,
  });
}
