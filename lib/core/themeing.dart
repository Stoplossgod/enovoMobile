import 'package:dartnative/dartnative.dart';

import 'colors.dart';
import 'textstyles.dart';

/// Centralized theme configurations for Enovo Mobile App based on the official design spec.
abstract final class AppTheme {
  AppTheme._();

  /// Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.landingSecondary,
    onPrimaryContainer: AppColors.landingPrimary,
    secondary: AppColors.onboardingCoral,
    onSecondary: AppColors.white,
    error: AppColors.danger,
    onError: AppColors.white,
    surface: AppColors.surface,
    onSurface: AppColors.ink,
    surfaceContainerHighest: AppColors.surface,
    surfaceContainerHigh: AppColors.surface,
    surfaceContainer: AppColors.page,
    onSurfaceVariant: AppColors.onboardingMutedText,
    outline: AppColors.border,
  );

  /// Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.ink,
    primaryContainer: AppColors.landingPrimary,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.landingSecondary,
    onSecondary: AppColors.ink,
    error: AppColors.danger,
    onError: AppColors.white,
    surface: Color(0xFF221612),
    onSurface: AppColors.page,
    surfaceContainerHighest: Color(0xFF2C1D18),
    surfaceContainerHigh: Color(0xFF251914),
    surfaceContainer: Color(0xFF190E0A),
    onSurfaceVariant: Color(0xFFB8ADA5),
    outline: Color(0x33FFF8F0),
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
    displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.page),
    displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.page),
    headlineLarge: AppTextStyles.headlineLarge.copyWith(color: AppColors.page),
    headlineMedium: AppTextStyles.headlineMedium.copyWith(color: AppColors.page),
    headlineSmall: AppTextStyles.headlineSmall.copyWith(color: AppColors.page),
    titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.page),
    titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.page),
    titleSmall: AppTextStyles.titleSmall.copyWith(color: Color(0xFFB8ADA5)),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.page),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Color(0xFFB8ADA5)),
    bodySmall: AppTextStyles.bodySmall.copyWith(color: Color(0xFF8A7D75)),
    labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.primary),
    labelMedium: AppTextStyles.labelMedium.copyWith(color: Color(0xFFB8ADA5)),
    labelSmall: AppTextStyles.labelSmall.copyWith(color: Color(0xFF8A7D75)),
  );

  /// Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    textTheme: lightTextTheme,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.page,
    dividerColor: AppColors.border,
  );

  /// Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    textTheme: darkTextTheme,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: const Color(0xFF190E0A),
    dividerColor: const Color(0x33FFF8F0),
  );
}
