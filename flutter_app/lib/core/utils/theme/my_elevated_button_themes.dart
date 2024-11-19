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
      side: WidgetsProperties.makeElevatedButtonBorderSide(color: AppColorsLight.accent),
      textStyle: WidgetStateProperty.all<TextStyle>(
        // MyTextThemes.lightTextTheme.labelLarge!,
        TextStyle(
          fontFamily: 'CascadiaCode',  // Ensure font is applied directly here as a fallback
          fontSize: 18.0,
          // fontWeight: FontWeight.bold,
        ),
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
      side: WidgetsProperties.makeElevatedButtonBorderSide(color: AppColorsDark.accent),
      textStyle: WidgetStateProperty.all<TextStyle>(
        // MyTextThemes.darkTextTheme.labelLarge!,
        TextStyle(
          fontFamily: 'CascadiaCode',  // Ensure font is applied directly here as a fallback
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}