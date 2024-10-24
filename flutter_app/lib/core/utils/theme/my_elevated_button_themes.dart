import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';

import '../constants/widget_properties.dart';



class MyElevatedButtonThemes {
  static ElevatedButtonThemeData lightButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(AppColorsLight.primary),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: WidgetsProperties.borderRadius,
        ),
      ),
      elevation: WidgetStateProperty.all<double>(0.0),
      foregroundColor: WidgetStateProperty.all<Color>(AppColorsLight.background),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: AppColorsLight.accent, width: 1.0, style: BorderStyle.solid, strokeAlign: 0.9),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsLight.background),
      ),
    ),
  );

  static ElevatedButtonThemeData darkButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(AppColorsDark.primary),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: WidgetsProperties.borderRadius,
        ),
      ),
      elevation: WidgetStateProperty.all<double>(0.0),
      foregroundColor: WidgetStateProperty.all<Color>(AppColorsDark.background),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: AppColorsDark.accent, width: 1.0, style: BorderStyle.solid, strokeAlign: 0.9),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsDark.background),
      ),
    ),
  );
}