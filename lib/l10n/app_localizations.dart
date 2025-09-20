import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('es', ''),
  ];

  // English translations
  static const Map<String, String> _localizedValues = {
    'en': '''
{
  "appTitle": "KifePool",
  "wallet": "Wallet",
  "staking": "Staking",
  "nfts": "NFTs",
  "history": "History",
  "news": "News",
  "balance": "Balance",
  "totalBalance": "Total Balance",
  "send": "Send",
  "receive": "Receive",
  "stake": "Stake",
  "unstake": "Unstake",
  "claimRewards": "Claim Rewards",
  "loading": "Loading...",
  "error": "Error",
  "retry": "Retry",
  "success": "Success",
  "cancel": "Cancel",
  "confirm": "Confirm",
  "settings": "Settings",
  "logout": "Logout",
  "login": "Login",
  "register": "Register",
  "email": "Email",
  "password": "Password",
  "username": "Username",
  "firstName": "First Name",
  "lastName": "Last Name",
  "welcomeMessage": "Welcome to KifePool",
  "welcomeSubtitle": "Your Gateway to the Polkadot Ecosystem",
  "noTransactions": "No transactions found",
  "noNews": "No news articles found",
  "noNfts": "No NFTs found",
  "refresh": "Refresh",
  "pullToRefresh": "Pull to refresh"
}
''',
    'es': '''
{
  "appTitle": "KifePool",
  "wallet": "Cartera",
  "staking": "Staking",
  "nfts": "NFTs",
  "history": "Historial",
  "news": "Noticias",
  "balance": "Saldo",
  "totalBalance": "Saldo Total",
  "send": "Enviar",
  "receive": "Recibir",
  "stake": "Stake",
  "unstake": "Unstake",
  "claimRewards": "Reclamar Recompensas",
  "loading": "Cargando...",
  "error": "Error",
  "retry": "Reintentar",
  "success": "Éxito",
  "cancel": "Cancelar",
  "confirm": "Confirmar",
  "settings": "Configuración",
  "logout": "Cerrar Sesión",
  "login": "Iniciar Sesión",
  "register": "Registrarse",
  "email": "Correo Electrónico",
  "password": "Contraseña",
  "username": "Nombre de Usuario",
  "firstName": "Nombre",
  "lastName": "Apellido",
  "welcomeMessage": "Bienvenido a KifePool",
  "welcomeSubtitle": "Tu Puerta de Entrada al Ecosistema Polkadot",
  "noTransactions": "No se encontraron transacciones",
  "noNews": "No se encontraron artículos de noticias",
  "noNfts": "No se encontraron NFTs",
  "refresh": "Actualizar",
  "pullToRefresh": "Desliza para actualizar"
}
''',
  };

  String _getValue(String key) {
    final localeKey = locale.languageCode;
    final translations = _localizedValues[localeKey] ?? _localizedValues['en']!;

    // Simple JSON parsing for the translations
    final regex = RegExp('"$key":\\s*"([^"]*)"');
    final match = regex.firstMatch(translations);
    return match?.group(1) ?? key;
  }

  // Getters for all localized strings
  String get appTitle => _getValue('appTitle');
  String get wallet => _getValue('wallet');
  String get staking => _getValue('staking');
  String get nfts => _getValue('nfts');
  String get history => _getValue('history');
  String get news => _getValue('news');
  String get balance => _getValue('balance');
  String get totalBalance => _getValue('totalBalance');
  String get send => _getValue('send');
  String get receive => _getValue('receive');
  String get stake => _getValue('stake');
  String get unstake => _getValue('unstake');
  String get claimRewards => _getValue('claimRewards');
  String get loading => _getValue('loading');
  String get error => _getValue('error');
  String get retry => _getValue('retry');
  String get success => _getValue('success');
  String get cancel => _getValue('cancel');
  String get confirm => _getValue('confirm');
  String get settings => _getValue('settings');
  String get logout => _getValue('logout');
  String get login => _getValue('login');
  String get register => _getValue('register');
  String get email => _getValue('email');
  String get password => _getValue('password');
  String get username => _getValue('username');
  String get firstName => _getValue('firstName');
  String get lastName => _getValue('lastName');
  String get welcomeMessage => _getValue('welcomeMessage');
  String get welcomeSubtitle => _getValue('welcomeSubtitle');
  String get noTransactions => _getValue('noTransactions');
  String get noNews => _getValue('noNews');
  String get noNfts => _getValue('noNfts');
  String get refresh => _getValue('refresh');
  String get pullToRefresh => _getValue('pullToRefresh');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
