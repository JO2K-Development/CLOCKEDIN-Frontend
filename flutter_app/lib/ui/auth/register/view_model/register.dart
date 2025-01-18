import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider with ChangeNotifier {
  // TextEditingControllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Loading state
  bool _isLoading = false;

  // Getter for loading state
  bool get isLoading => _isLoading;

  // Registration logic
  Future<void> register() async {
    // Validate fields
    if (passwordController.text != confirmPasswordController.text) {
      throw Exception("Passwords do not match");
    }

    _setLoading(true);

    try {
      // Example HTTP POST request
      final response = await http.post(
        Uri.parse('https://yourapi.com/register'),
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        // Handle success (e.g., navigate to another page)
      } else {
        // Handle error
        throw Exception("Registration failed");
      }
    } catch (e) {
      // Handle network or other errors
      print("Error: $e");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
