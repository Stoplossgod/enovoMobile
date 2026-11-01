import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';

class OnboardingCaourselSlider extends StatefulWidget {
  const OnboardingCaourselSlider({super.key});

  @override
  State<OnboardingCaourselSlider> createState() =>
      _OnboardingCaourselSliderState();
}

class _OnboardingCaourselSliderState extends State<OnboardingCaourselSlider> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.onboardingPage,
      body: Center(
        child: Text('Onboarding'),
      ),
    );
  }
}
