import 'package:dartnative/dartnative.dart';

/// Centralized color palette for Enovo Mobile App.
abstract final class AppColors {
  AppColors._();

  // Brand / Primary Palette
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryLight = Color(0xFF6AB7FF);
  static const Color primaryDark = Color(0xFF005CB2);

  // Secondary / Accent Palette
  static const Color secondary = Color(0xFF26A69A);
  static const Color secondaryLight = Color(0xFF64D8CB);
  static const Color secondaryDark = Color(0xFF00766C);

  // Neutral Palette - Light
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF1F3F4);
  static const Color outlineLight = Color(0xFFE0E0E0);

  // Neutral Palette - Dark
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color surfaceVariantDark = Color(0xFF2A2A2A);
  static const Color outlineDark = Color(0xFF383838);

  // Text Colors - Light Theme
  static const Color textPrimaryLight = Color(0xFF202124);
  static const Color textSecondaryLight = Color(0xFF5F6368);
  static const Color textTertiaryLight = Color(0xFF80868B);

  // Text Colors - Dark Theme
  static const Color textPrimaryDark = Color(0xFFE8EAED);
  static const Color textSecondaryDark = Color(0xFF9AA0A6);
  static const Color textTertiaryDark = Color(0xFF70757A);

  // Status & Feedback Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF57C00);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF0288D1);

  // Common Constants
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}
