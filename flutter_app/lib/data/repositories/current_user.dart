import 'package:flutter_app/domain/model_classes/app_init_user.dart';
import 'package:flutter_app/data/services/local/storage_handler.dart';
import '../../core/navigation/navigation_handler.dart';

class CurrentUserRepository {
  static AppInitUserModel? appPreparationUserData;

  static Future<void> determineUserEntry() async {
    Map<String, String>? token = await StorageHandler.getTokens();
    if (token != null) {
      appPreparationUserData = AppInitUserModel(token: token);
      NavigationHandler.goToAndRemoveUntil('/home');
    } else {
      NavigationHandler.goToAndRemoveUntil('/login');
    }
  }
}