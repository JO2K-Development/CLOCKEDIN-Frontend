import 'package:flutter/material.dart';

class AppColors {
  static Map<int, Color> colorSwatch = {
    50: Color(0xFFE6E6FA), // Lightest shade
    100: Color(0xFFD1C6F0), // Light shade
    200: Color(0xFFB6A3E5), // Lighter shade
    300: Color(0xFF9B81DB), // Slightly lighter
    400: Color(0xFF8468D3), // Medium-light shade
    500: Color(0xFF5856D6), // Base color
    600: Color(0xFF4E50B0), // Darker shade
    700: Color(0xFF434C99), // Medium-dark shade
    800: Color(0xFF383F7D), // Dark shade
    900: Color(0xFF2E2D60), // Darkest shade
  };

  static MaterialColor customMaterialColor = MaterialColor(0xFF5856D6, colorSwatch);
}

class AppColorsLight {
  
  // Primary Color
  static const Color primary = Color(0xFF5856D6); // #5856D6

  // Lighter Shade (Accent Color / Hover States)
  static const Color accent = Color(0xFF7E7BEB); // #7E7BEB

  // Darker Shade (For depth or backgrounds)
  static const Color darkShade = Color(0xFF3C3AC2); // #3C3AC2

  // Complementary Color (For contrast and call-to-action elements)
  static const Color complementary = Color(0xFFD65658); // #D65658

  // Analogous Colors
  static const Color analogous1 = Color(0xFF5658D6); // #5658D6
  static const Color analogous2 = Color(0xFF56D6C1); // #56D6C1

  // Neutral Colors
  static const Color background = Color(0xFFF0F0F3); // #F0F0F3
  static const Color text = Color(0xFF333333); // #333333
  static const Color fadedText = Color.fromARGB(255, 91, 91, 91); // #D1D1D6
}


class AppColorsDark {
  // Primary Color
  static const Color primary = Color(0xFF8481E5); // Adjusted from #5856D6 to a softer, muted tone for dark mode

  // Lighter Shade (Accent Color / Hover States)
  static const Color accent = Color(0xFFA5A3F2); // A lighter tone, suitable for hover and highlights in dark mode

  // Darker Shade (For depth or backgrounds)
  static const Color darkShade = Color(0xFF3A39A8); // Darkened further to work as a subtle background or depth

  // Complementary Color (For contrast and call-to-action elements)
  static const Color complementary = Color(0xFFB35758); // Softer red for contrast but less intense than the original

  // Analogous Colors
  static const Color analogous1 = Color(0xFF7879DB); // Slightly muted analogous color
  static const Color analogous2 = Color(0xFF4FC0B2); // A more subdued cyan tone for dark mode

  // Neutral Colors
  static const Color background = Color(0xFF1C1C1E); // Dark background, almost black with a subtle tint
  static const Color text = Color(0xFFF0F0F3); // Light text color for good contrast on dark backgrounds
  static const Color fadedText = Color.fromARGB(255, 164, 164, 164); // #D1D1D6

}
