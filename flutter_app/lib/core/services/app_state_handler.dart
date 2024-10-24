import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/models/app_init_user_model.dart';
import 'package:flutter_app/core/services/storage_handler.dart';
import 'navigation_service.dart';

class AppStateHandler {
  static AppInitUserModel? appPreparationUserData;

  static logout() async {
    // catch for safety
    try {
      StorageHandler.discardTokens();
    } on Exception catch (e) {}
    NavigationService.goToAndRemoveUntil('/login');
  }
}