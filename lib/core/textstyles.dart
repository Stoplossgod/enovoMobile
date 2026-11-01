import 'package:dartnative/dartnative.dart';
import 'colors.dart';

/// Centralized typography for Enovo Mobile App based on the Inter font specification.
///
/// Hierarchy weights:
/// - 300 Helper · 400 Body · 500 Labels · 600 Buttons · 700 Cards · 800 Display
abstract final class AppTextStyles {
  AppTextStyles._();

  /// Primary and only typeface used throughout the product
  static const String fontFamily = 'Inter';

  // ---------------------------------------------------------------------------
  // Six Design Weights (No italics)
  // ---------------------------------------------------------------------------
  static const FontWeight weightHelper = FontWeight.w300;   // 300 Helper
  static const FontWeight weightBody = FontWeight.w400;     // 400 Body
  static const FontWeight weightLabels = FontWeight.w500;   // 500 Labels
  static const FontWeight weightButtons = FontWeight.w600;  // 600 Buttons
  static const FontWeight weightCards = FontWeight.w700;    // 700 Cards
  static const FontWeight weightDisplay = FontWeight.w800;  // 800 Display

  // ---------------------------------------------------------------------------
  // Display Styles (Weight: 800 ExtraBold)
  // ---------------------------------------------------------------------------
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: weightDisplay,
    color: AppColors.ink,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: weightDisplay,
    color: AppColors.ink,
    letterSpacing: -0.3,
    height: 1.25,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: weightDisplay,
    color: AppColors.ink,
    letterSpacing: -0.2,
    height: 1.3,
  );

  // ---------------------------------------------------------------------------
  // Cards & Headlines (Weight: 700 Bold)
  // ---------------------------------------------------------------------------
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: weightCards,
    color: AppColors.ink,
    height: 1.3,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: weightCards,
    color: AppColors.ink,
    height: 1.35,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: weightCards,
    color: AppColors.ink,
    height: 1.4,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weightCards,
    color: AppColors.ink,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weightCards,
    color: AppColors.ink,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weightCards,
    color: AppColors.ink,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: weightCards,
    color: AppColors.ink,
  );

  // ---------------------------------------------------------------------------
  // Buttons & Actions (Weight: 600 Semibold)
  // ---------------------------------------------------------------------------
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weightButtons,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weightButtons,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weightButtons,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  // ---------------------------------------------------------------------------
  // Labels (Weight: 500 Medium)
  // ---------------------------------------------------------------------------
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weightLabels,
    color: AppColors.primary,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weightLabels,
    color: AppColors.ink,
    letterSpacing: 0.1,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: weightLabels,
    color: AppColors.onboardingMutedText,
    letterSpacing: 0.2,
  );

  // ---------------------------------------------------------------------------
  // Body Styles (Weight: 400 Regular)
  // ---------------------------------------------------------------------------
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: weightBody,
    color: AppColors.ink,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: weightBody,
    color: AppColors.ink,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weightBody,
    color: AppColors.onboardingMutedText,
    height: 1.4,
  );

  // ---------------------------------------------------------------------------
  // Helper & Captions (Weight: 300 Light)
  // ---------------------------------------------------------------------------
  static const TextStyle helper = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: weightHelper,
    color: AppColors.onboardingMutedText,
    height: 1.4,
  );

  static const TextStyle helperSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: weightHelper,
    color: AppColors.onboardingMutedText,
    height: 1.4,
  );
}
