import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';
import 'package:flutter_app/core/utils/constants/widget_properties.dart';

class MyTextThemes {
  
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: AppColorsLight.fadedText, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: AppColorsLight.text, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: AppColorsLight.text, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    titleLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: AppColorsLight.text,shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: AppColorsLight.text, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    titleSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: AppColorsLight.text, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    bodyLarge: TextStyle(fontSize: 22.0, color: AppColorsLight.fadedText, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    bodyMedium: TextStyle(fontSize: 20.0, color: AppColorsLight.fadedText, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColorsLight.text, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
    labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsLight.fadedText, shadows: [
      WidgetsProperties.lightBottomRightShadow,
    ]),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: AppColorsDark.fadedText),
    headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    titleLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: AppColorsDark.text),
    titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: AppColorsDark.text),
    titleSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: AppColorsDark.text),
    bodyLarge: TextStyle(fontSize: 22.0, color: AppColorsDark.fadedText),
    bodyMedium: TextStyle(fontSize: 20.0, color: AppColorsDark.fadedText),
    labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsDark.fadedText),
  );
}
