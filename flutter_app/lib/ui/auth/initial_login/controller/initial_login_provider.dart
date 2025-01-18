import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/navigation_service.dart';
import 'package:flutter_app/core/services/network_handler.dart';
import 'package:flutter_app/core/services/storage_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InitialLoginProvider with ChangeNotifier {
  // Text controllers for the email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Disposing controllers when they are no longer needed
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _errorMessage = 'Email i hasło są wymagane';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();
    try {
      http.Response response = await NetworkHandler.postUserLogin(email, password);
      dynamic body = json.decode(response.body);
      if (response.statusCode == 200) {
        StorageHandler.storeTokens(body['access'], body['refresh']);
        print(123);
        NavigationService.pushReplacement('/landing');
        _errorMessage = '';
      } else {
        //TODO: HANDLE TOKEN EXPIRED
        //TODO: get how the error is displayed
        _errorMessage = 'Login failed: ${response.body}';
      }
    } catch (error) {
      //TODO: Handle error (logout?, reload app?)
      _errorMessage = 'An error occurred: $error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
