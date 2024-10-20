import 'package:flutter_app/core/services/network_handler.dart';
import 'package:flutter_app/core/services/storage_handler.dart';

class CombinedStorageHandler {
  static Future<String?> getMainUserJson() async {
    String? storageDate = await StorageHandler.getMainUserJson();
    if (storageDate == null) {
      String? networkDate = await NetworkHandler.getMainUserJson();
      if (networkDate == null) {
        return null;
      } else {
        return networkDate;
      }
    } else {
      return storageDate;
    }
  }
}