import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:logger/logger.dart';

class RegisterProvider with ChangeNotifier {
  // TextEditingControllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterProvider({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository {
    register = Command0(_register);
  }

  final AuthRepository _authRepository;
  late Command0 register;
  final _log = Logger();

  Future<Result<void>> _register() async {
    try {
      if (passwordController.text != confirmPasswordController.text) {
        throw Exception("Passwords do not match");
      }

      final result = await _authRepository.register(
        email: emailController.text,
        password1: passwordController.text,
        password2: confirmPasswordController.text,
      );
      switch (result) {
        case Ok<void>():
          // Handle success
          _log.i("Registration successful");
          break;
        case Error<void>():
          // Handle error
          _log.e("Registration failed");
          break;
      }
      return result;
    } catch (e) {
      // Handle network or other errors
      _log.e(e);
      return Result.error(e as Exception);
    } finally {
      notifyListeners();
    }
  }


  // Dispose controllers when not needed
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
