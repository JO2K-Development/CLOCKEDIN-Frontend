import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';

class AuthRepositoryTesting extends AuthRepository {
  AuthRepositoryTesting({
    required LocalDataService localDataService,
  })  
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  bool? _isAuthenticated;
  String? _authToken;
  String? _refreshToken;

  /// Fetch token 
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
  }) async{
    notifyListeners();
    return await _localDataService.storeAuthTokens('dummy_access', 'dummy_refresh');
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
      // Clear authenticated status
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }

  @override
  String? _authHeaderProvider() => null;

  @override
  Future<Result<void>> register({
    required String email,
    required String password1,
    required String password2,
    String? username,
  }) async {
    // var res = await login(email: email, password: password);
    return Result.ok(null);
  }
}
