import 'package:flutter_app/core/services/storage_handler.dart';
import 'navigation_service.dart';

class AppStateHandler {
  static logout() async {
    String token = await StorageHandler.getToken() ?? '';
    if (token != '') {
      StorageHandler.discardStored(token);
    }
    StorageHandler.discardToken();
    NavigationService.goToAndRemoveUntil('/login');
  }
}