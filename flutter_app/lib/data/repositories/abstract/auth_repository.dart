import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/models/auth_request/auth_request.dart';
import 'package:flutter_app/data/services/models/auth_response/auth_response.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';

abstract class AuthRepository with ChangeNotifier{
  AuthRepository(); 
      
  bool? _isAuthenticated;
  String? _authToken;
  String? _refreshToken;

  /// Fetch token 
  Future<void> _fetch();

  Future<bool> get isAuthenticated;


  Future<Result<void>> login({
    required String email,
    required String password,
  }) ;

  Future<Result<void>> logout();

  String? _authHeaderProvider();
      

  Future<Result<void>> register({
    required String email,
    required String password,
  });
}
