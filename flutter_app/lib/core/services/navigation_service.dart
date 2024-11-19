import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/app_init_user_model.dart';
import 'package:flutter_app/core/services/app_state_handler.dart';
import 'package:flutter_app/core/services/network_handler.dart';
import 'package:http/http.dart';
import 'storage_handler.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Navigate to a new route
  static Future<dynamic> navigateTo(String routeName) async {
    if (navigatorKey.currentState != null) {
      return await navigatorKey.currentState!.pushNamed(routeName);
    } else {
      // Navigate to the login page if the NavigatorState is null
      return await navigatorKey.currentState!.pushNamed('/login');
    }
  }

  /// Replace the current route with a new route
  static void goTo(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  /// Remove all previous routes and navigate to a new route
  static void goToAndRemoveUntil(String routeName) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  /// Go back to the previous route
  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  /// Push a new route and remove the previous route
  static void pushAndRemoveUntil(String routeName) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  /// Push a new route and expect a result back from it
  static Future<dynamic> push(String routeName) async {
    return await navigatorKey.currentState?.pushNamed(routeName);
  }

  /// Push a new route and replace the current route
  static void pushReplacement(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  static Future<String> prepareInitialAppState() async{
    //PROBLEM: could Potentially be null and is unsafe
    if (!(await StorageHandler.isLoggedIn())) {
      return "/initial-login";
    }
    Response response = await NetworkHandler.getMainUser();
    if (response.statusCode == 404) {
      return "/initial-login";
    } else if (response.statusCode == 500) {
      return "/server-connection-error";
    } else if (response.statusCode == 200) {
      dynamic mainUserJson = jsonDecode(response.body);
      AppStateHandler.appPreparationUserData = appInitUserModelFromJson(mainUserJson);
      if (!AppStateHandler.appPreparationUserData!.hasNecessaryDataForLanding()) {
        return "/data-fill";
      } else {
        return "/landing";
      }
    }

    // safety net
    else {
      AppStateHandler.logout();
      return "/initial-login";
    }
  }
}
