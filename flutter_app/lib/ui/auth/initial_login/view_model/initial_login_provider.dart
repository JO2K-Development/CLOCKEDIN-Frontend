import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:logger/logger.dart';

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

  late Command0 login;
  final _log = Logger();

  // Disposing controllers when they are no longer needed
  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<Result<void>> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      notifyListeners();
      return Result.error(Exception("Email and password cannot be empty"));
    }
    try {
      final result = await _authRepository.login(
          email: emailController.text, password: passwordController.text);
      switch (result) {
        case Ok<void>():
          // Handle success
          return Result.ok(null);
        case Error<void>():
          // Handle error
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }
}
