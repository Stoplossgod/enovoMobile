import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

class DashboardStreakCircle extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const DashboardStreakCircle({
    super.key,
    this.completedTasks = 0,
    this.totalTasks = 10,
  });

  double get _progress =>
      totalTasks > 0 ? (completedTasks / totalTasks).clamp(0.0, 1.0) : 0.0;
  int get _percentage => (_progress * 100).toInt();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        child: Row(
          children: [
            // Left Circular Ring with 0/1 counter
            SizedBox(
              width: 76,
              height: 76,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular ring track
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Color(0xFFFFCBB2), width: 7.5),
                      ),
                    ),
                  ),

                  // Progress dot indicator at the top
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // Center counter text
                  Center(
                    child: Text(
                      '$completedTasks/$totalTasks',
                      style: const TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 20,
                        fontWeight: AppTextStyles.weightCards,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // Right Task Details & Progress Bar
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    "Today's Task",
                    style: TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 17,
                      fontWeight: AppTextStyles.weightCards,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Subtitle
                  Text(
                    '$completedTasks of $totalTasks completed',
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 13,
                      fontWeight: AppTextStyles.weightBody,
                      color: AppColors.onboardingMutedText,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Horizontal Progress Bar with % Label
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD5C0),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              widthFactor: _progress,
                              heightFactor: 1.0,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$_percentage%',
                        style: const TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13,
                          fontWeight: AppTextStyles.weightCards,
                          color: AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
