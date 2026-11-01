import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/routes.dart';
import 'package:enovo_mobile_app/core/themeing.dart';
import 'package:enovo_mobile_app/shared_widget/onboarding_caoursel_slider.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return App(
      title: 'Enovo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.onboarding,
      routes: AppRouter.routes,
      home: const OnboardingCaourselSlider(),
    );
  }
}
