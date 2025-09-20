import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService {
  static Dio? _dio;
  static const String _baseUrl = 'https://api.kifepool.com'; // Replace with actual API URL

  static Dio get instance {
    if (_dio != null) return _dio!;
    
    _dio = _createDio();
    return _dio!;
  }

  static Dio _createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    dio.interceptors.addAll([
      _LogInterceptor(),
      _AuthInterceptor(),
      _ErrorInterceptor(),
    ]);

    return dio;
  }

  static void updateAuthToken(String? token) {
    if (token != null) {
      instance.options.headers['Authorization'] = 'Bearer $token';
    } else {
      instance.options.headers.remove('Authorization');
    }
  }

  static void setBaseUrl(String url) {
    instance.options.baseUrl = url;
  }
}

class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
      print('Headers: ${options.headers}');
      if (options.data != null) {
        print('Data: ${options.data}');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('Data: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      print('Message: ${err.message}');
      if (err.response?.data != null) {
        print('Error Data: ${err.response?.data}');
      }
    }
    super.onError(err, handler);
  }
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add authentication logic here
    // For now, we'll handle this in the NetworkService.updateAuthToken method
    super.onRequest(options, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle common errors
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        // Handle timeout errors
        break;
      case DioExceptionType.badResponse:
        // Handle HTTP error responses
        break;
      case DioExceptionType.cancel:
        // Handle cancelled requests
        break;
      case DioExceptionType.connectionError:
        // Handle connection errors
        break;
      case DioExceptionType.badCertificate:
        // Handle certificate errors
        break;
      case DioExceptionType.unknown:
        // Handle unknown errors
        break;
    }
    
    super.onError(err, handler);
  }
}
