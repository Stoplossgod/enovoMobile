import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';
import 'package:enovo_mobile_app/features/widget/dashboard_streak_circle.dart';
import 'package:enovo_mobile_app/features/widget/dashboard_task_list.dart';
import 'package:enovo_mobile_app/shared_widget/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<AppBottomNavTab>? onNavigateTab;

  const HomeScreen({super.key, this.onNavigateTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasUnreadNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.page,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.onNavigateTab?.call(AppBottomNavTab.journal);
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0x142D1810), width: 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.person,
                            color: AppColors.ink,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 15,
                              fontWeight: AppTextStyles.weightBody,
                              color: AppColors.onboardingMutedText,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'abdulazeezridwan004',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 18,
                              fontWeight: AppTextStyles.weightCards,
                              color: AppColors.ink,
                              height: 1.25,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _hasUnreadNotifications = !_hasUnreadNotifications;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0x142D1810), width: 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0A000000),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const SizedBox(
                              width: 44,
                              height: 44,
                              child: Center(
                                child: Icon(
                                  CupertinoIcons.bell,
                                  color: AppColors.ink,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Date & Streak Pill Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tuesday, November 3',
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 13,
                        fontWeight: AppTextStyles.weightLabels,
                        color: AppColors.onboardingMutedText,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFDEEE6),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.flame_fill,
                            color: AppColors.primary,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '12 Day Streak',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 12,
                              fontWeight: AppTextStyles.weightButtons,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const DashboardStreakCircle(),
              const SizedBox(height: 30),

              // Today's Tasks Section Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Tasks (1)",
                      style: TextStyle(
                        fontFamily: AppTextStyles.fontFamily,
                        fontSize: 18,
                        fontWeight: AppTextStyles.weightCards,
                        color: AppColors.ink,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onNavigateTab?.call(AppBottomNavTab.schedule);
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 14,
                              fontWeight: AppTextStyles.weightButtons,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: AppColors.primary,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const DashboardTaskList(),
            ],
          ),
        ),
      ),
    );
  }
}
