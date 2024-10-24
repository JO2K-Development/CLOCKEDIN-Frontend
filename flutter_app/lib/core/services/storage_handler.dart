import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_state_handler.dart';
//TODO: HANDLE TOKEN EXPIRED
//TODO: HANDLE TOKEN EXPIRED
//TODO: HANDLE TOKEN EXPIRED

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

  static void storeTokens(String access, String refresh) async {
    await storage.write(key: "access", value: access);
    await storage.write(key: "refresh", value: refresh);
  }

  static void discardTokens() async {
    await storage.delete(key: "access");
    await storage.delete(key: "refresh");
  }

  static Future<Map<String, String?>> getTokens() async {
    String? access = await storage.read(key: "access");
    String? refresh = await storage.read(key: "refresh");
    return {"access": access, "refresh": refresh};
  }

  static Future<String> getAccessTokenOrLogOut() async {
    String? token = await storage.read(key: "access");
    if (token == null) {
      AppStateHandler.logout();
    }
    return token!;
  }

  static Future<Map<String, String?>> getTokensOrLogOut() async {
    String? access = await storage.read(key: "access");
    String? refresh = await storage.read(key: "refresh");
    if (access == null || refresh == null) {
      AppStateHandler.logout();
    }
    return {"access": access, "refresh": refresh};
  }

  static Future<bool> isLoggedIn() async {
    bool isLogged = true;
    (await getTokens()).forEach((key, value) {
      if (value == null) {
        isLogged = false;
      }
    });
    return isLogged;
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