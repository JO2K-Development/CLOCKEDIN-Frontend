import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';

class AuthRepositoryProduction extends AuthRepository{
  AuthRepositoryProduction({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required LocalDataService localDataService,
  })  
      : _apiClient = apiClient,
        _authApiClient = authApiClient,
        _localDataService = localDataService {_apiClient.authHeaderProvider = _authHeaderProvider;}

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final LocalDataService _localDataService;

  bool? _isAuthenticated;
  String? _authToken;
  String? _refreshToken;

  /// Fetch token 
  @override
  Future<void> _fetch() async {
    final Result<String?> result = await _localDataService.getAccessToken();

    switch (result) {
      case Ok<String?>():
        _authToken = result.value;
        _isAuthenticated = result.value != null;
      case Error<String?>():
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    // Status is cached
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    // No status cached, fetch from storage
    await _fetch();

    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Result<AuthResponse> result = await _authApiClient.login(
        AuthRequest(
          email: email,
          password: password,
        ),
      );
      switch (result) {
        case Ok<AuthResponse>():
          // Set auth status
          _isAuthenticated = true;
          _authToken = result.value.access;
          _refreshToken = result.value.refresh;
          // Store in Safe Storage
          return await _localDataService.storeAuthTokens(result.value.access, result.value.refresh);
        case Error<AuthResponse>():
          // _log.warning('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    // _log.info('User logged out');
    try {
      // Clear stored auth token
      final result = await _localDataService.discardAll();
      if (result is Error<void>) {
        // _log.severe('Failed to clear stored auth token');
      }

      // Clear token in ApiClient
      _authToken = null;

      // Clear authenticated status
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }

  String? _authHeaderProvider() =>
      _authToken != null ? 'Bearer $_authToken' : null;

  Future<Result<void>> register({
    required String email,
    required String password,
  }) async {
    try {
      final Result<AuthResponse> result = await _authApiClient.register(
        AuthRequest(
          email: email,
          password: password,
        ),
      );
      switch (result) {
        case Ok<AuthResponse>():
          // Set auth status
          _isAuthenticated = true;
          _authToken = result.value.access;
          _refreshToken = result.value.refresh;
          // Store in Safe Storage
          return await _localDataService.storeAuthTokens(result.value.access, result.value.refresh);
        case Error<AuthResponse>():
          // _log.warning('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
