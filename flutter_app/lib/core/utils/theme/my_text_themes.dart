import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';

class MyTextThemes {
  static const TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
    headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
    bodyLarge: TextStyle(fontSize: 22.0, color: AppColorsLight.fadedText),
    bodyMedium: TextStyle(fontSize: 20.0, color: AppColorsLight.fadedText),
    labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
    labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
  );

  static const TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    bodyLarge: TextStyle(fontSize: 22.0, color: AppColorsDark.fadedText),
    bodyMedium: TextStyle(fontSize: 20.0, color: AppColorsDark.fadedText),
    labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    labelMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
  );
}
