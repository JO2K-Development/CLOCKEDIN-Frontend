import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';

import '../constants/widget_properties.dart';


class MyInputDecorationThemes {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsLight.accent, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsLight.primary, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsLight.accent, width: 1.0),
    ),
    labelStyle: TextStyle(color: AppColorsLight.text),
    hintStyle: TextStyle(color: AppColorsLight.fadedText),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsDark.accent, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsDark.primary, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: WidgetsProperties.borderRadius,
      borderSide: BorderSide(color: AppColorsDark.accent, width: 1.0),
    ),
    labelStyle: TextStyle(color: AppColorsDark.text),
    hintStyle: TextStyle(color: AppColorsDark.fadedText),
  );

  static InputDecorationTheme plainInputDecorationTheme = InputDecorationTheme(
  border: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  
  hintStyle: TextStyle(fontSize: 40, color: Colors.grey), // Customize the hint text style if needed
  contentPadding: EdgeInsets.all(10), // Optional: Add some padding
);
}