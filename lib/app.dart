import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/themeing.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return App(
      title: 'Enovo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: 
    );
  }
}
