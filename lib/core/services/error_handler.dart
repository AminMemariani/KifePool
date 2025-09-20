import 'dart:developer' as developer;
import '../models/blockchain_models.dart';

/// Service for handling blockchain errors and logging
class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();
  factory ErrorHandler() => _instance;
  ErrorHandler._internal();

  /// Handle blockchain exceptions and return user-friendly messages
  static String handleBlockchainError(BlockchainException error) {
    switch (error.type) {
      case BlockchainErrorType.networkError:
        return 'Network connection failed. Please check your internet connection and try again.';
      case BlockchainErrorType.rpcError:
        return 'Server error occurred. Please try again later.';
      case BlockchainErrorType.insufficientBalance:
        return 'Insufficient balance to complete this transaction.';
      case BlockchainErrorType.invalidAddress:
        return 'Invalid wallet address provided.';
      case BlockchainErrorType.transactionFailed:
        return 'Transaction failed. Please try again.';
      case BlockchainErrorType.stakingError:
        return 'Staking operation failed. Please try again.';
      case BlockchainErrorType.crossChainError:
        return 'Cross-chain transfer failed. Please try again.';
      case BlockchainErrorType.unknown:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Log blockchain errors with context
  static void logError(
    BlockchainException error, {
    String? context,
    Map<String, dynamic>? additionalData,
  }) {
    final logData = {
      'error_type': error.type.name,
      'message': error.message,
      'details': error.details,
      'code': error.code,
      'context': context,
      'timestamp': DateTime.now().toIso8601String(),
      ...?additionalData,
    };

    developer.log(
      'Blockchain Error: ${error.message}',
      name: 'BlockchainService',
      error: error,
      stackTrace: StackTrace.current,
    );

    // In production, you might want to send this to a crash reporting service
    // like Sentry, Crashlytics, etc.
    _sendToCrashReporting(logData);
  }

  /// Log successful operations
  static void logSuccess(
    String operation, {
    String? context,
    Map<String, dynamic>? additionalData,
  }) {
    final logData = {
      'operation': operation,
      'context': context,
      'timestamp': DateTime.now().toIso8601String(),
      ...?additionalData,
    };

    developer.log('Blockchain Success: $operation', name: 'BlockchainService');

    // Log to analytics or monitoring service
    _sendToAnalytics(logData);
  }

  /// Send error data to crash reporting service
  static void _sendToCrashReporting(Map<String, dynamic> data) {
    // Implement crash reporting integration here
    // Examples: Sentry, Crashlytics, Bugsnag, etc.
    developer.log('Crash reporting data: $data');
  }

  /// Send success data to analytics service
  static void _sendToAnalytics(Map<String, dynamic> data) {
    // Implement analytics integration here
    // Examples: Firebase Analytics, Mixpanel, etc.
    developer.log('Analytics data: $data');
  }

  /// Get retry delay based on error type
  static Duration getRetryDelay(BlockchainException error, int attempt) {
    switch (error.type) {
      case BlockchainErrorType.networkError:
        return Duration(seconds: 2 * attempt); // Exponential backoff
      case BlockchainErrorType.rpcError:
        return Duration(seconds: 5 * attempt);
      case BlockchainErrorType.insufficientBalance:
      case BlockchainErrorType.invalidAddress:
        return Duration.zero; // Don't retry these
      default:
        return Duration(seconds: 3 * attempt);
    }
  }

  /// Check if error is retryable
  static bool isRetryable(BlockchainException error) {
    switch (error.type) {
      case BlockchainErrorType.insufficientBalance:
      case BlockchainErrorType.invalidAddress:
        return false;
      default:
        return true;
    }
  }
}
