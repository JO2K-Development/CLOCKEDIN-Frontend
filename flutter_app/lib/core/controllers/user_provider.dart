import 'package:flutter/foundation.dart';
import '../models/user_model.dart'; // Adjust the import based on your project structure

class UserProvider with ChangeNotifier {
  UserModel? _user; // The current user model

  UserModel? get user => _user; // Getter to access the current user
  bool get isLoggedIn => _user != null; // Check if user is logged in

  // Load user data
  Future<void> loadData() async {
    // Simulate loading data (replace this with actual API call or local storage retrieval)
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Example of user data to be loaded
    final jsonString = '''
    {
      "id": 1,
      "company_id": 101,
      "position": "Software Engineer",
      "first_name": "John",
      "last_name": "Doe",
      "email": "john.doe@example.com",
      "manager_id": null,
      "created_at": "2024-10-16T12:00:00Z",
      "updated_at": null,
      "profile_picture_url": "https://example.com/profile_pictures/john_doe.jpg",
      "access_identifiers": ["worker"]
    }''';

    // Parse the JSON string to UserModel
    _user = userModelFromJson(jsonString);
    notifyListeners(); // Notify listeners that the user has changed
  }

  // Update user data (example method)
  void updateUser(UserModel updatedUser) {
    _user = updatedUser; // Update user with new data
    notifyListeners(); // Notify listeners about the change
  }

  // Logout the user
  void logout() {
    _user = null; // Clear user data
    notifyListeners(); // Notify listeners about the change
  }
}
