import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';
import 'package:flutter_app/data/services/models/register_request/register_request.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';
import 'package:flutter_app/domain/model_classes/current_user_model/current_user_model.dart';
import 'package:logger/logger.dart';

class AuthRepositoryProduction extends AuthRepository{
  AuthRepositoryProduction({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required LocalDataService localDataService,
  })  
      : _apiClient = apiClient,
        _authApiClient = authApiClient,
        _localDataService = localDataService;

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final LocalDataService _localDataService;

  bool? _isAuthenticated;
  final _log = Logger();

  /// Fetch token 
  @override
  Future<void> _fetch() async {
    final Result<String?> result = await _localDataService.getAccessToken();

    switch (result) {
      case Ok<String?>():
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
          _log.i('User logged in');
          // Set auth status
          _isAuthenticated = true;
          await _localDataService.storeAuthTokens(result.value.access, result.value.refresh);

          _log.i("Fetching the newly created, or old user data after login");
          final currentUser = await _apiClient.getCurrentUser();

          switch (currentUser) {
            case Ok<CurrentUserModel>():
              _log.i('User data fetched $currentUser');
              // Store user data
              await _localDataService.storeCurrentUser(currentUser.value);
              return Result.ok(null);
            case Error<CurrentUserModel>():
              _log.e('Failed to fetch user data');
              return Result.error(currentUser.error);
          }
        case Error<AuthResponse>():
          //TODO: this can be reached when the tokens are stored, maybe its best 
          // to discard them at this point
          _log.w('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.i('User logged out');
    try {
      // Clear stored auth token
      final result = await _localDataService.discardAll();
      if (result is Error<void>) {
        _log.f('Failed to clear stored auth token');
      }

      // Clear authenticated status
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> register({
    required String email,
    required String password1,
    required String password2,
    String? username,
  }) async {
    try {
      final Result<int> result = await _authApiClient.register(
        RegisterRequest(
          email: email,
          password1: password1,
          password2: password2,
          username: username,
        ),
      );
      switch (result) {
        case Ok<int>():
          // case where we don't login user on register
          return Result.ok(null);
        case Error<int>():
          // _log.warning('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }


}
