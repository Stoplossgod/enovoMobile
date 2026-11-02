import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

/// Native bottom navigation bar for Enovo, backed directly by DartNative's
/// native OS controls (iOS `UITabBar` / `UITabBarController` with Liquid Glass
/// support, and Android Material 3 `BottomNavigationView`).
class EnovoBottomNavBar extends BottomNavigationBar {
  EnovoBottomNavBar({
    super.key,
    required super.currentIndex,
    required super.onTap,
    List<BottomNavigationBarItem>? items,
    super.backgroundColor = AppColors.surface,
    super.selectedIconColor = AppColors.primary,
    super.iconColor = AppColors.ink,
    super.indicatorColor = const Color(0xFFFDEEE6),
    super.labelFontStyle = const TextStyle(
      fontFamily: AppTextStyles.fontFamily,
      fontSize: 11,
      fontWeight: AppTextStyles.weightLabels,
      color: AppColors.ink,
    ),
    super.selectedLabelFontStyle = const TextStyle(
      fontFamily: AppTextStyles.fontFamily,
      fontSize: 11,
      fontWeight: AppTextStyles.weightButtons,
      color: AppColors.primary,
    ),
    super.scrollBehavior = TabBarScrollBehavior.none,
  }) : super(
          items: items ?? defaultItems,
        );

  /// 5 core native navigation destinations matching the Enovo design specification:
  /// 1. **Home**: CupertinoIcons.house / house_fill
  /// 2. **Add**: CupertinoIcons.plus
  /// 3. **Schedule**: CupertinoIcons.calendar
  /// 4. **Progress**: CupertinoIcons.chart_bar / chart_bar_fill
  /// 5. **Journal**: CupertinoIcons.pencil
  static const List<BottomNavigationBarItem> defaultItems = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(CupertinoIcons.house),
      activeIcon: Icon(CupertinoIcons.house_fill),
    ),
    BottomNavigationBarItem(
      label: 'Add',
      icon: Icon(CupertinoIcons.plus),
      activeIcon: Icon(CupertinoIcons.plus),
    ),
    BottomNavigationBarItem(
      label: 'Schedule',
      icon: Icon(CupertinoIcons.calendar),
      activeIcon: Icon(CupertinoIcons.calendar),
    ),
    BottomNavigationBarItem(
      label: 'Progress',
      icon: Icon(CupertinoIcons.chart_bar),
      activeIcon: Icon(CupertinoIcons.chart_bar_fill),
    ),
    BottomNavigationBarItem(
      label: 'Journal',
      icon: Icon(CupertinoIcons.pencil),
      activeIcon: Icon(CupertinoIcons.pencil),
    ),
  ];

  /// Factory helper to build a standard native [BottomNavigationBar] directly.
  static BottomNavigationBar create({
    required int currentIndex,
    required ValueChanged<int> onTap,
    List<BottomNavigationBarItem>? items,
    Color backgroundColor = AppColors.surface,
    Color selectedIconColor = AppColors.primary,
    Color iconColor = AppColors.ink,
    Color indicatorColor = const Color(0xFFFDEEE6),
    TabBarScrollBehavior scrollBehavior = TabBarScrollBehavior.none,
  }) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items ?? defaultItems,
      backgroundColor: backgroundColor,
      selectedIconColor: selectedIconColor,
      iconColor: iconColor,
      indicatorColor: indicatorColor,
      scrollBehavior: scrollBehavior,
      labelFontStyle: const TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        fontSize: 11,
        fontWeight: AppTextStyles.weightLabels,
        color: AppColors.ink,
      ),
      selectedLabelFontStyle: const TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        fontSize: 11,
        fontWeight: AppTextStyles.weightButtons,
        color: AppColors.primary,
      ),
    );
  }
}
