import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/app.dart';
import 'package:enovo_mobile_app/core/routes.dart';
import 'dartnative_plugin_registrant.dart';

void main() {
  DartNativePluginRegistrant.registerAll();
  DartNativeFontRegistrant.registerAll();

  // Register routes for hot-restart route replay
  registerRoutes(AppRouter.routes);

  SystemChrome.defaultStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  runApp(const AppInitializer());
}
