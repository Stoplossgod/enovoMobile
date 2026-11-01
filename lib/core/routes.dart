import 'package:dartnative/dartnative.dart';

class AppRouter {
  AppRouter._();

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

  // static Future<void> navigateToSplash(BuildContext context) async {
  //   await push(context, const HomeScreen());
  // }
}
