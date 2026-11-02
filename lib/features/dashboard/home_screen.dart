import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/assets.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';
import 'package:enovo_mobile_app/shared_widget/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: AppBar(
        title: Text(
          _getTitleForIndex(_currentIndex),
          style: const TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontWeight: AppTextStyles.weightCards,
            color: AppColors.ink,
          ),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
          _buildAddTab(),
          _buildScheduleTab(),
          _buildProgressTab(),
          _buildJournalTab(),
        ],
      ),
      bottomNavigationBar: EnovoBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Add';
      case 2:
        return 'Schedule';
      case 3:
        return 'Progress';
      case 4:
        return 'Journal';
      default:
        return 'Enovo';
    }
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header Welcome Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x06000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFDEEE6),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Enovo',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 18,
                          fontWeight: AppTextStyles.weightCards,
                          color: AppColors.ink,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Track your habits and daily routines.',
                        style: TextStyle(
                          fontFamily: AppTextStyles.fontFamily,
                          fontSize: 13,
                          fontWeight: AppTextStyles.weightHelper,
                          color: AppColors.onboardingMutedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick Action Cards
          _buildQuickActionCard(
            icon: CupertinoIcons.calendar,
            title: "Today's Schedule",
            subtitle: '3 activities planned',
            onTap: () => setState(() => _currentIndex = 2),
          ),
          const SizedBox(height: 12),
          _buildQuickActionCard(
            icon: CupertinoIcons.chart_bar,
            title: 'Weekly Progress',
            subtitle: '85% completion rate',
            onTap: () => setState(() => _currentIndex = 3),
          ),
          const SizedBox(height: 12),
          _buildQuickActionCard(
            icon: CupertinoIcons.pencil,
            title: 'Daily Journal',
            subtitle: 'Reflect on your achievements',
            onTap: () => setState(() => _currentIndex = 4),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTab() {
    return _buildPlaceholderTab(
      icon: CupertinoIcons.plus,
      title: 'New Activity',
      subtitle: 'Add a new habit, routine, or task to your day.',
    );
  }

  Widget _buildScheduleTab() {
    return _buildPlaceholderTab(
      icon: CupertinoIcons.calendar,
      title: 'Schedule',
      subtitle: 'Review your calendar and upcoming time blocks.',
    );
  }

  Widget _buildProgressTab() {
    return _buildPlaceholderTab(
      icon: CupertinoIcons.chart_bar,
      title: 'Weekly Progress',
      subtitle: 'Track your streaks, metrics, and completion rate.',
    );
  }

  Widget _buildJournalTab() {
    return _buildPlaceholderTab(
      icon: CupertinoIcons.pencil,
      title: 'Daily Journal',
      subtitle: 'Reflect on your achievements and daily notes.',
    );
  }

  Widget _buildPlaceholderTab({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFFDEEE6),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Icon(
                icon,
                size: 40,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 22,
                fontWeight: AppTextStyles.weightCards,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 14,
                fontWeight: AppTextStyles.weightHelper,
                color: AppColors.onboardingMutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color(0x06000000),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFFDEEE6),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(
                icon,
                size: 22,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15,
                      fontWeight: AppTextStyles.weightCards,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 13,
                      fontWeight: AppTextStyles.weightHelper,
                      color: AppColors.onboardingMutedText,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              size: 20,
              color: AppColors.onboardingMutedText,
            ),
          ],
        ),
      ),
    );
  }
}
