class AppConstants {
  // App Information
  static const String appName = 'KifePool';
  static const String appVersion = '1.0.0';
  static const String packageName = 'com.kifepool.app';

  // API Configuration
  static const String baseApiUrl = 'https://api.kifepool.com';
  static const String stagingApiUrl = 'https://staging-api.kifepool.com';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Database Configuration
  static const String databaseName = 'kifepool_db';
  static const int databaseVersion = 1;

  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 1);
  static const int maxCacheSize = 100; // MB

  // Security
  static const int minPasswordLength = 8;
  static const int maxLoginAttempts = 5;
  static const Duration lockoutDuration = Duration(minutes: 15);

  // UI Configuration
  static const double maxContentWidth = 600.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);

  // Feature Flags
  static const bool enableBiometrics = true;
  static const bool enablePushNotifications = true;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;

  // Supported Cryptocurrencies
  static const List<String> supportedCryptos = [
    'BTC',
    'ETH',
    'BNB',
    'ADA',
    'SOL',
    'DOT',
    'MATIC',
    'AVAX',
  ];

  // Supported Networks
  static const List<String> supportedNetworks = [
    'Ethereum',
    'Binance Smart Chain',
    'Polygon',
    'Avalanche',
    'Solana',
    'Cardano',
    'Polkadot',
  ];

  // Error Messages
  static const String networkErrorMessage =
      'Network connection error. Please check your internet connection.';
  static const String serverErrorMessage =
      'Server error. Please try again later.';
  static const String unknownErrorMessage =
      'An unknown error occurred. Please try again.';
  static const String invalidCredentialsMessage =
      'Invalid credentials. Please check your email and password.';
  static const String accountLockedMessage =
      'Account temporarily locked due to multiple failed attempts.';

  // Success Messages
  static const String loginSuccessMessage = 'Login successful!';
  static const String registrationSuccessMessage =
      'Account created successfully!';
  static const String transactionSuccessMessage =
      'Transaction completed successfully!';
  static const String settingsSavedMessage = 'Settings saved successfully!';

  // Validation Messages
  static const String emailRequiredMessage = 'Email is required';
  static const String emailInvalidMessage =
      'Please enter a valid email address';
  static const String passwordRequiredMessage = 'Password is required';
  static const String passwordTooShortMessage =
      'Password must be at least 8 characters long';
  static const String confirmPasswordMessage = 'Passwords do not match';
  static const String nameRequiredMessage = 'Name is required';
  static const String phoneRequiredMessage = 'Phone number is required';
}
