import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/dark_shades/dark_shades_app_color.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';

class AppTheme {
  static ThemeData buildLightThemeData() {
    return ThemeData(
      colorSchemeSeed: LightShadesAppColors.appLightThemeColor,
      textTheme: _buildTextTheme(),
    );
  }

  static ThemeData buildDarkThemeData() {
    return ThemeData(
      colorSchemeSeed: DarkShadesAppColors.appLightThemeColor,
      textTheme: _buildTextTheme(),
    );
  }

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
