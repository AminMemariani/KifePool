import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kifepool/core/services/blockchain_service.dart';
import 'package:google_fonts/google_fonts.dart';

/// Test helpers for setting up mocks and common test configurations
class TestHelpers {
  /// Sets up platform channel mocks for testing
  static void setupPlatformMocks() {
    // Disable network connections for testing
    BlockchainService().setDisableNetworkConnections(true);

    // Set up SharedPreferences mock data
    SharedPreferences.setMockInitialValues({
      'flutter.theme_mode': 'dark',
      'flutter.language_code': 'en',
      'flutter.high_contrast': false,
      'flutter.large_text': false,
      'flutter.reduced_motion': false,
    });

    // Disable Google Fonts network loading for tests
    GoogleFonts.config.allowRuntimeFetching = false;

    // Mock path_provider
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
            switch (methodCall.method) {
              case 'getApplicationSupportDirectory':
                return '/tmp/test_app_support';
              case 'getApplicationDocumentsDirectory':
                return '/tmp/test_app_docs';
              case 'getTemporaryDirectory':
                return '/tmp';
              default:
                throw PlatformException(
                  code: 'UNIMPLEMENTED',
                  message: 'Method ${methodCall.method} not implemented',
                );
            }
          },
        );

    // Mock sqflite
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('com.tekartik.sqflite'), (
          MethodCall methodCall,
        ) async {
          switch (methodCall.method) {
            case 'openDatabase':
              return 1; // Database handle
            case 'execute':
              return null;
            case 'query':
              return <Map<String, dynamic>>[];
            case 'insert':
              return 1; // Row ID
            case 'update':
              return 1; // Number of rows affected
            case 'delete':
              return 1; // Number of rows affected
            case 'close':
              return null;
            default:
              throw PlatformException(
                code: 'UNIMPLEMENTED',
                message: 'Method ${methodCall.method} not implemented',
              );
          }
        });

    // Mock flutter_secure_storage
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.it_nomads.com/flutter_secure_storage'),
          (MethodCall methodCall) async {
            switch (methodCall.method) {
              case 'read':
                return null; // No stored value
              case 'write':
                return null;
              case 'delete':
                return null;
              case 'deleteAll':
                return null;
              case 'readAll':
                return <String, String>{};
              default:
                throw PlatformException(
                  code: 'UNIMPLEMENTED',
                  message: 'Method ${methodCall.method} not implemented',
                );
            }
          },
        );
  }

  /// Cleans up platform channel mocks
  static void cleanupPlatformMocks() {
    // Re-enable network connections
    BlockchainService().setDisableNetworkConnections(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          null,
        );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('com.tekartik.sqflite'),
          null,
        );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.it_nomads.com/flutter_secure_storage'),
          null,
        );
  }

  /// Sets up SharedPreferences with test data
  static Future<void> setupSharedPreferences() async {
    SharedPreferences.setMockInitialValues({
      'theme_mode': 'dark',
      'language_code': 'en',
      'high_contrast': false,
      'large_text': false,
      'reduced_motion': false,
    });
  }
}
