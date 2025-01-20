import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/model_classes/app_init_user.dart';
import 'package:flutter_app/data/repositories/current_user.dart';
import 'package:flutter_app/data/services/remote/network_handler.dart';
import 'package:http/http.dart';
import '../../data/services/local/storage_handler.dart';

class NavigationHandler {
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
  static Future<dynamic> pushNamed(String routeName) async {
    return await navigatorKey.currentState?.pushNamed(routeName);
  }

  /// Push a new route and replace the current route
  static void pushReplacement(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  static logout() async {
    // catch for safety
    try {
      StorageHandler.discardTokens();
    } on Exception catch (e) {}
    NavigationHandler.goToAndRemoveUntil('/initial-login');
  }
}
