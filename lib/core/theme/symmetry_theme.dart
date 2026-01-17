import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'symmetry_colors.dart';

/// Patrol QA App Theme
///
/// Premium dark theme with Material 3 design
class SymmetryTheme {
  SymmetryTheme._();

  /// Configure system UI overlay style
  static void configureSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  /// Dark theme data for the app
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SymmetryColors.black,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme.dark(
      primary: SymmetryColors.white,
      secondary: SymmetryColors.silver,
      surface: SymmetryColors.charcoal,
      onSurface: SymmetryColors.white,
    ),
  );

  /// Light theme data for the app
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: SymmetryColors.white,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme.light(
      primary: SymmetryColors.black,
      secondary: SymmetryColors.charcoal,
      surface: SymmetryColors.offWhite,
      onSurface: SymmetryColors.black,
    ),
  );
}
