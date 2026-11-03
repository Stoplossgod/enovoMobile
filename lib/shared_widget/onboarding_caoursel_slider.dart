import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/routes.dart';
import 'package:enovo_mobile_app/shared_widget/bottom_nav_active_screen.dart';

class OnboardingCaourselSlider extends StatefulWidget {
  const OnboardingCaourselSlider({super.key});

  @override
  State<OnboardingCaourselSlider> createState() =>
      _OnboardingCaourselSliderState();
}

class _OnboardingCaourselSliderState extends State<OnboardingCaourselSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingPage,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Onboarding',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 20),
            Button(
              title: 'Continue to Home',
              variant: ButtonVariant.filled,
              color: AppColors.primary,
              onPressed: () {
                AppRouter.pushReplacement(context, const MainAppScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
