import 'package:flutter/foundation.dart';
import 'package:kifepool/core/models/serverpod_models.dart';
import 'package:kifepool/core/services/serverpod_client.dart';

/// Provider for managing authentication state
class AuthProvider extends ChangeNotifier {
  PublicUser? _user;
  bool _isLoading = false;
  String? _error;
  bool _isAuthenticated = false;

  // Getters
  PublicUser? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _isAuthenticated;

  /// Initialize authentication provider
  Future<void> initialize() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Check if user is already authenticated
      if (ServerpodClient.isAuthenticated) {
        final user = await AuthService.getCurrentUser();
        if (user != null) {
          _user = user;
          _isAuthenticated = true;
        } else {
          // Invalid session, clear it
          await AuthService.logout();
        }
      }
    } catch (e) {
      _error = 'Failed to initialize authentication: $e';
      debugPrint('Auth initialization error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Register a new user
  Future<AuthResult> register({
    required String email,
    required String password,
    required String username,
    String? firstName,
    String? lastName,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await AuthService.register(
        email: email,
        password: password,
        username: username,
        firstName: firstName,
        lastName: lastName,
      );

      if (result.success && result.user != null) {
        _user = result.user;
        _isAuthenticated = true;
        _error = null;
      } else {
        _error = result.message;
      }

      return result;
    } catch (e) {
      _error = 'Registration failed: $e';
      debugPrint('Registration error: $e');
      return AuthResult(success: false, message: _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Login user
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await AuthService.login(email: email, password: password);

      if (result.success && result.user != null) {
        _user = result.user;
        _isAuthenticated = true;
        _error = null;
      } else {
        _error = result.message;
      }

      return result;
    } catch (e) {
      _error = 'Login failed: $e';
      debugPrint('Login error: $e');
      return AuthResult(success: false, message: _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Social login
  Future<AuthResult> socialLogin({
    required String email,
    required String socialProvider,
    required String socialId,
    String? firstName,
    String? lastName,
    String? avatarUrl,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await AuthService.socialLogin(
        email: email,
        socialProvider: socialProvider,
        socialId: socialId,
        firstName: firstName,
        lastName: lastName,
        avatarUrl: avatarUrl,
      );

      if (result.success && result.user != null) {
        _user = result.user;
        _isAuthenticated = true;
        _error = null;
      } else {
        _error = result.message;
      }

      return result;
    } catch (e) {
      _error = 'Social login failed: $e';
      debugPrint('Social login error: $e');
      return AuthResult(success: false, message: _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Logout user
  Future<AuthResult> logout() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await AuthService.logout();

      if (result.success) {
        _user = null;
        _isAuthenticated = false;
        _error = null;
      } else {
        _error = result.message;
      }

      return result;
    } catch (e) {
      _error = 'Logout failed: $e';
      debugPrint('Logout error: $e');
      return AuthResult(success: false, message: _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Update user profile
  Future<AuthResult> updateProfile({
    String? firstName,
    String? lastName,
    String? avatarUrl,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final result = await AuthService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        avatarUrl: avatarUrl,
      );

      if (result.success && result.user != null) {
        _user = result.user;
        _error = null;
      } else {
        _error = result.message;
      }

      return result;
    } catch (e) {
      _error = 'Profile update failed: $e';
      debugPrint('Profile update error: $e');
      return AuthResult(success: false, message: _error!);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Refresh authentication token
  Future<AuthResult> refreshToken() async {
    try {
      final result = await AuthService.refreshToken();

      if (result.success && result.user != null) {
        _user = result.user;
        _isAuthenticated = true;
        _error = null;
      } else {
        _error = result.message;
        // If refresh fails, logout user
        _user = null;
        _isAuthenticated = false;
      }

      return result;
    } catch (e) {
      _error = 'Token refresh failed: $e';
      debugPrint('Token refresh error: $e');
      // If refresh fails, logout user
      _user = null;
      _isAuthenticated = false;
      return AuthResult(success: false, message: _error!);
    } finally {
      notifyListeners();
    }
  }

  /// Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Check if user has specific permission
  bool hasPermission(String permission) {
    // For now, all authenticated users have all permissions
    // In a real app, you would check user roles/permissions
    return _isAuthenticated;
  }

  /// Get user display name
  String get userDisplayName {
    if (_user == null) return '';

    if (_user!.firstName != null && _user!.lastName != null) {
      return '${_user!.firstName} ${_user!.lastName}';
    } else if (_user!.firstName != null) {
      return _user!.firstName!;
    } else {
      return _user!.username;
    }
  }

  /// Get user initials
  String get userInitials {
    if (_user == null) return '';

    if (_user!.firstName != null && _user!.lastName != null) {
      return '${_user!.firstName![0]}${_user!.lastName![0]}'.toUpperCase();
    } else if (_user!.firstName != null) {
      return _user!.firstName![0].toUpperCase();
    } else {
      return _user!.username.substring(0, 1).toUpperCase();
    }
  }

  /// Check if user is verified
  bool get isEmailVerified {
    return _user?.isEmailVerified ?? false;
  }

  /// Get user's social provider
  String? get socialProvider {
    return _user?.socialProvider;
  }
}
