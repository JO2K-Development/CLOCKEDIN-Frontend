import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/app_colors.dart';
import 'my_elevated_button_themes.dart';
import 'my_input_decoration_themes.dart';
import 'my_text_themes.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: AppColors.customMaterialColor,
    primaryColor: AppColorsLight.primary,
    colorScheme: AppColorsLight.lightColorScheme,
    scaffoldBackgroundColor: AppColorsLight.background,
    shadowColor: AppColorsLight.shadow,
    brightness: Brightness.light,
    fontFamily: 'CascadiaCode',
    textTheme: MyTextThemes.lightTextTheme,
    elevatedButtonTheme: MyElevatedButtonThemes.lightButtonTheme,
    inputDecorationTheme: MyInputDecorationThemes.lightInputDecorationTheme,
    appBarTheme: AppBarTheme(backgroundColor: AppColorsLight.background, ),
    dividerColor: AppColorsLight.dividerColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsLight.background,
      selectedItemColor: AppColorsLight.primary,
      unselectedItemColor: AppColorsLight.accent,
    )
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: AppColors.customMaterialColor,
    primaryColor: AppColorsLight.primary,
    colorScheme: AppColorsDark.darkColorScheme,
    scaffoldBackgroundColor: AppColorsDark.background,
    shadowColor: AppColorsDark.shadow,
    brightness: Brightness.dark,
    fontFamily: 'CascadiaCode',
    textTheme: MyTextThemes.darkTextTheme,
    elevatedButtonTheme: MyElevatedButtonThemes.darkButtonTheme,
    inputDecorationTheme: MyInputDecorationThemes.darkInputDecorationTheme,
    appBarTheme: AppBarTheme(backgroundColor: AppColorsDark.background),
    dividerColor: AppColorsDark.dividerColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsDark.background,
      selectedItemColor: AppColorsDark.primary,
      unselectedItemColor: AppColorsDark.accent,
    )
  );
}