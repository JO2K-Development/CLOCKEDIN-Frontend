import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/combined_storage_handler.dart';

import '../models/app_init_user_model.dart';

class AppInitUserDataProvider with ChangeNotifier {
  AppInitUserModel? _appInitUserData;

  AppInitUserModel? get appInitUserData => _appInitUserData;

  AppInitUserDataProvider() {
    loadAppInitUserData();
  }

  // Load the data from JSON (or from API, if needed)
  void loadAppInitUserData() async {
    String? jsonString = await CombinedStorageHandler.getMainUserJson();
    if (jsonString == null) {
      _appInitUserData = null;
      notifyListeners(); 
    } else {
      _appInitUserData = appInitUserModelFromJson(jsonString);
      notifyListeners(); 
    }
  }

  // Save data to JSON format
  String saveAppInitUserData() {
    if (_appInitUserData != null) {
      return appInitUserModelToJson(_appInitUserData!);
    }
    return '';
  }

  // Clear the user data
  void clearappInitUserData() {
    _appInitUserData = null;
    notifyListeners(); // Notify listeners about the change
  }
}
