import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/command.dart';
import 'package:flutter_app/core/utils/result.dart';
import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';

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

  Future<Result<void>> _register() async {
    if (passwordController.text != confirmPasswordController.text) {
      throw Exception("Passwords do not match");
    }

    try {
      final result = await _authRepository.register(
        email: emailController.text,
        password: passwordController.text,
      );

      return result;
    } catch (e) {
      // Handle network or other errors
      print("Error: $e");
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
