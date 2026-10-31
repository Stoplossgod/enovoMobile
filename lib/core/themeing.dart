import 'package:dartnative/dartnative.dart';

import 'colors.dart';
import 'textstyles.dart';

/// Centralized theme configurations for Enovo Mobile App.
abstract final class AppTheme {
  AppTheme._();

  /// Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primaryLight,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimaryLight,
    surfaceContainerHighest: AppColors.surfaceVariantLight,
    surfaceContainerHigh: AppColors.surfaceVariantLight,
    surfaceContainer: AppColors.backgroundLight,
    onSurfaceVariant: AppColors.textSecondaryLight,
    outline: AppColors.outlineLight,
  );

  /// Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.backgroundDark,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.backgroundDark,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.textPrimaryDark,
    surfaceContainerHighest: AppColors.surfaceVariantDark,
    surfaceContainerHigh: AppColors.surfaceVariantDark,
    surfaceContainer: AppColors.backgroundDark,
    onSurfaceVariant: AppColors.textSecondaryDark,
    outline: AppColors.outlineDark,
  );

  /// Light Text Theme
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge,
    displayMedium: AppTextStyles.displayMedium,
    headlineLarge: AppTextStyles.headlineLarge,
    headlineMedium: AppTextStyles.headlineMedium,
    headlineSmall: AppTextStyles.headlineSmall,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    titleSmall: AppTextStyles.titleSmall,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );

  /// Dark Text Theme
  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.textPrimaryDark),
    displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.textPrimaryDark),
    headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.textPrimaryDark),
    headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.textPrimaryDark),
    headlineSmall: AppTextStyles.headlineSmall.copyWith(color: AppColors.textPrimaryDark),
    titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimaryDark),
    titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.textPrimaryDark),
    titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.textSecondaryDark),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimaryDark),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondaryDark),
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiaryDark),
    labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.primaryLight),
    labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.textSecondaryDark),
    labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.textTertiaryDark),
  );

  /// Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    dividerColor: AppColors.outlineLight,
  );

  /// Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dividerColor: AppColors.outlineDark,
  );
}
