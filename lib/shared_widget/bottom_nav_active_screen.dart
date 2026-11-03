import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/features/add/add_screen.dart';
import 'package:enovo_mobile_app/features/dashboard/home_screen.dart';
import 'package:enovo_mobile_app/features/journal/journal_screen.dart';
import 'package:enovo_mobile_app/features/progress/progress_screen.dart';
import 'package:enovo_mobile_app/features/schedule/schedule_screen.dart';
import 'package:enovo_mobile_app/shared_widget/bottom_nav_bar.dart';

class MainAppScreen extends StatefulWidget {
  static const routeName = '/main-app';

  final AppBottomNavTab initialTab;

  const MainAppScreen({super.key, this.initialTab = AppBottomNavTab.home});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  late AppBottomNavTab _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.initialTab;
  }

  void _handleTabSelection(AppBottomNavTab tab) {
    if (tab != _currentTab) {
      setState(() => _currentTab = tab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.page,
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          HomeScreen(onNavigateTab: _handleTabSelection),
          const AddDestinationScreen(),
          const ScheduleDestinationScreen(),
          const ProgressDestinationScreen(),
          const JournalDestinationScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        currentTab: _currentTab,
        onTabSelected: _handleTabSelection,
      ),
    );
  }
}

typedef BottomNavActiveScreen = MainAppScreen;
