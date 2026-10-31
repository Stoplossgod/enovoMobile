import 'package:dartnative/dartnative.dart';
import 'colors.dart';

/// Centralized typography and text styles for Enovo Mobile App.
abstract final class AppTextStyles {
  AppTextStyles._();

  // Display Styles
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
    letterSpacing: -0.3,
    height: 1.25,
  );

  // Headlines
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.semiBold,
    color: AppColors.textPrimaryLight,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.semiBold,
    color: AppColors.textPrimaryLight,
    height: 1.35,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.semiBold,
    color: AppColors.textPrimaryLight,
    height: 1.4,
  );

  // Titles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.semiBold,
    color: AppColors.textPrimaryLight,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.medium,
    color: AppColors.textPrimaryLight,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.medium,
    color: AppColors.textSecondaryLight,
  );

  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryLight,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondaryLight,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiaryLight,
    height: 1.4,
  );

  // Labels & Buttons
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.semiBold,
    color: AppColors.primary,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.medium,
    color: AppColors.textSecondaryLight,
    letterSpacing: 0.1,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.medium,
    color: AppColors.textTertiaryLight,
    letterSpacing: 0.2,
  );
}
