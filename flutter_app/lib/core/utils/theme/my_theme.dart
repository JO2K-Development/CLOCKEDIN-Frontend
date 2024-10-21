import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: AppColors.customMaterialColor,
    primaryColor: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsLight.background,
    brightness: Brightness.light,
    fontFamily: 'CascadiaCode',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
      bodyLarge: TextStyle(fontSize: 20.0, color: AppColorsLight.fadedText),
      bodyMedium: TextStyle(fontSize: 18.0, color: AppColorsLight.fadedText),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
      labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColorsLight.text),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColorsLight.primary),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevation: WidgetStateProperty.all<double>(0.0),
        foregroundColor: WidgetStateProperty.all<Color>(AppColorsLight.background),
        side: WidgetStateProperty.all<BorderSide>(BorderSide(color: AppColorsLight.accent, width: 1.0, style: BorderStyle.solid, strokeAlign: 0.9)),
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsLight.background)),
      ),

    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsLight.accent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsLight.primary, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsLight.accent, width: 1.0),
      ),
      labelStyle: TextStyle(color: AppColorsLight.text),
      hintStyle: TextStyle(color: AppColorsLight.fadedText),
    )
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: AppColors.customMaterialColor,
    primaryColor: AppColorsLight.primary,
    scaffoldBackgroundColor: AppColorsDark.background,
    brightness: Brightness.dark,
    fontFamily: 'CascadiaCode',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
      headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
      bodyLarge: TextStyle(fontSize: 20.0, color: AppColorsDark.fadedText),
      bodyMedium: TextStyle(fontSize: 18.0, color: AppColorsDark.fadedText),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
      labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: AppColorsDark.text),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColorsDark.primary),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevation: WidgetStateProperty.all<double>(0.0),
        foregroundColor: WidgetStateProperty.all<Color>(AppColorsDark.background),
        side: WidgetStateProperty.all<BorderSide>(BorderSide(color: AppColorsDark.accent, width: 1.0, style: BorderStyle.solid, strokeAlign: 0.9)),
        textStyle: WidgetStateProperty.all<TextStyle>(TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColorsDark.background)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsDark.accent, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsDark.primary, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColorsDark.accent, width: 1.0),
      ),
      labelStyle: TextStyle(color: AppColorsDark.text),
      hintStyle: TextStyle(color: AppColorsDark.fadedText),
    )
  );
}