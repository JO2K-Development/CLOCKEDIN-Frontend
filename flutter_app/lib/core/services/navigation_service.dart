import 'package:flutter/material.dart';
import 'package:flutter_app/core/controllers/app_init_user_data_provider.dart';
import 'package:flutter_app/core/services/network_handler.dart';
import 'package:provider/provider.dart';
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

  static Future<String> goToInitialRoute() async{
    //PROBLEM: could Potentially be null and is unsafe
    if (!(await StorageHandler.isLoggedIn())) {
      return "/initial-login-page";
    }
    return "/landing";
  }
}
