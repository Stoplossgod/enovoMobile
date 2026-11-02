import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/features/dashboard/home_screen.dart';
import 'package:enovo_mobile_app/shared_widget/onboarding_caoursel_slider.dart';

class AppRouter {
  AppRouter._();

  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String initial = onboarding;

  static final Map<String, WidgetBuilder> routes = {
    onboarding: (_) => const OnboardingCaourselSlider(),
    home: (_) => const HomeScreen(),
  };

  static Future<T?> push<T>(BuildContext context, Widget screen) {
    return Navigator.push<T>(context, PageRoute(builder: (_) => screen));
  }

  static Future<T?> pushReplacement<T>(BuildContext context, Widget screen) {
    return Navigator.pushReplacement<T, dynamic>(
      context,
      PageRoute(builder: (_) => screen),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
