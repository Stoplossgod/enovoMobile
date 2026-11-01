import 'package:dartnative/dartnative.dart';

/// Centralized color palette for Enovo Mobile App based on the official design spec.
abstract final class AppColors {
  AppColors._();

  // ==========================================
  // Default / Global Brand Colors
  // ==========================================
  static const Color primary = Color(0xFFE87B4E);
  static const Color ink = Color(0xFF2D1810);
  static const Color page = Color(0xFFF5EFE7);
  static const Color surface = Color(0xFFFFF8F0);

  // ==========================================
  // Landing Page Colors
  // ==========================================
  static const Color landingPage = Color(0xFFFDFAF5);
  static const Color landingPrimary = Color(0xFFC96025);
  static const Color landingSecondary = Color(0xFFE4B197);
  static const Color landingInk = Color(0xFF2C1F19);

  // ==========================================
  // Onboarding Colors
  // ==========================================
  static const Color onboardingPage = Color(0xFFFDF7F0);
  static const Color onboardingCoral = Color(0xFFD8896A);
  static const Color onboardingCta = Color(0xFFC76239);
  static const Color onboardingMutedText = Color(0xFF6B615A);

  // ==========================================
  // Paywall Colors
  // ==========================================
  static const Color paywallPage = Color(0xFFFBF7F0);
  static const Color paywallPrimary = Color(0xFFC65F2A);
  static const Color paywallInk = Color(0xFF2D231D);

  // ==========================================
  // Utilities
  // ==========================================
  static const Color white = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFC94F4F);
  static const Color border = Color(0x1A2D1810); // 10% ink
  static const Color overlay = Color(0x66000000); // 40% black

  // Common shorthands
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // ==========================================
  // Scoped Namespaces for Screen Modules
  // ==========================================
  static const landing = _LandingColors();
  static const onboarding = _OnboardingColors();
  static const paywall = _PaywallColors();
  static const utilities = _UtilityColors();
}

/// Scoped colors for Landing Page
final class _LandingColors {
  const _LandingColors();
  final Color page = const Color(0xFFFDFAF5);
  final Color primary = const Color(0xFFC96025);
  final Color secondary = const Color(0xFFE4B197);
  final Color ink = const Color(0xFF2C1F19);
}

/// Scoped colors for Onboarding
final class _OnboardingColors {
  const _OnboardingColors();
  final Color page = const Color(0xFFFDF7F0);
  final Color coral = const Color(0xFFD8896A);
  final Color cta = const Color(0xFFC76239);
  final Color mutedText = const Color(0xFF6B615A);
}

/// Scoped colors for Paywall
final class _PaywallColors {
  const _PaywallColors();
  final Color page = const Color(0xFFFBF7F0);
  final Color primary = const Color(0xFFC65F2A);
  final Color ink = const Color(0xFF2D231D);
}

/// Scoped colors for Utilities
final class _UtilityColors {
  const _UtilityColors();
  final Color white = const Color(0xFFFFFFFF);
  final Color danger = const Color(0xFFC94F4F);
  final Color border = const Color(0x1A2D1810);
  final Color overlay = const Color(0x66000000);
}
