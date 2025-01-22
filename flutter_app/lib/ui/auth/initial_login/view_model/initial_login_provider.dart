import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/navigation_handler.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/data/services/remote/network_handler.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InitialLoginProvider with ChangeNotifier {
  InitialLoginProvider({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository {
    login = Command0(_login);
  }

  final AuthRepository _authRepository;
  // Text controllers for the email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _errorMessage = '';
  late Command0 login;

  String get errorMessage => _errorMessage;

  // Disposing controllers when they are no longer needed
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<Result<void>> _login() async {
    final result = await _authRepository.login(email: emailController.text, password: passwordController.text);
    return result;
    // final email = emailController.text;
    // final password = passwordController.text;

    // if (email.isEmpty || password.isEmpty) {
    //   _errorMessage = 'Email i hasło są wymagane';
    //   notifyListeners();
    //   return;
    // }

    // _isLoading = true;
    // notifyListeners();
    // try {
    //   http.Response response = await NetworkHandler.postUserLogin(email, password);
    //   dynamic body = json.decode(response.body);
    //   if (response.statusCode == 200) {
    //     StorageHandler.storeTokens(body['access'], body['refresh']);
    //     print(123);
    //     NavigationHandler.pushReplacement('/landing');
    //     _errorMessage = '';
    //   } else {
    //     //TODO: HANDLE TOKEN EXPIRED
    //     //TODO: get how the error is displayed
    //     _errorMessage = 'Login failed: ${response.body}';
    //   }
    // } catch (error) {
    //   //TODO: Handle error (logout?, reload app?)
    //   _errorMessage = 'An error occurred: $error';
    // } finally {
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }
}
