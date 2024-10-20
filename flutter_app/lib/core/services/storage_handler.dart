import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_state_handler.dart';

class StorageHandler {
  static final storage = new FlutterSecureStorage();
  
  static void storeValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> retrieveValue(String key) async {
    return await storage.read(key: key) ?? "The key: $key wasn't found in the storage";
  }

  static void discardStored(String key) async {
    await storage.delete(key: key);
  }

static void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static void discardToken() async {
    await storage.delete(key: "token");
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  static Future<String> getTokenOrLogOut() async {
    String? token = await storage.read(key: "token");
    if (token == null) {
      AppStateHandler.logout();
    }
    return token!;
  }

  static Future<bool> isLoggedIn() async {
    return (await getToken()) != null;
  }

  //      *NOT TO BE IMPLEMENTED IN CURRENT VERSION*
  //
  // static Future<String?> getMainUserJson() async {
  //   String? token = await getToken();
  //   if (token == null){
  //     return null;
  //   } else {
  //     String? data = await retrieveValue(token);
  //     return data;
  //   }
  // }
}