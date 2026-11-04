import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

/// Native-first shared top application bar for Enovo.
///
/// Backed directly by DartNative's native OS controls:
/// - **iOS**: Lowers to native `UINavigationBar` / `UINavigationItem`, supporting
///   Apple's Liquid Glass back button capsule, native cross-screen bar item morphing,
///   and interactive edge swipe transitions.
/// - **Android**: Lowers to Material 3 `Toolbar` / Collapsing App Bar.
///
/// Just like [EnovoBottomNavBar], this widget guarantees a 100% native platform experience:
/// the back button is an authentic DartNative [BackButton] routed directly to the native bar
/// item slot (no non-native container hacks or misplaced gestured boxes).
class SharedAppBar extends AppBar {
  final String? titleText;
  final TextStyle? titleTextStyle;
  final String? subtitleText;
  final TextStyle? subtitleTextStyle;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final String? backTitle;
  final Color? backIconColor;
  final String backIcon;
  final double? backIconSize;
  final FontWeight? backIconWeight;
  final Color? backTint;
  final ButtonVariant? backGlassVariant;
  final EdgeInsetsDirectional? backPadding;

  SharedAppBar({
    super.key,
    this.titleText,
    this.titleTextStyle,
    Widget? title,
    this.subtitleText,
    this.subtitleTextStyle,
    Widget? subtitle,
    Widget? leading,
    this.showBackButton = true,
    bool? automaticallyImplyLeading,
    this.onBackTap,
    this.backTitle,
    this.backIconColor = AppColors.ink,
    this.backIcon = 'chevron.left',
    this.backIconSize = 17.0,
    this.backIconWeight = FontWeight.semiBold,
    this.backTint,
    this.backGlassVariant,
    this.backPadding,
    List<Widget>? actions,
    Color? backgroundColor = Colors.transparent,
    bool? centerTitle = true,
    double? toolbarHeight,
    EdgeInsetsDirectional? actionsPadding,
    bool titleGlassBackground = false,
    bool actionsGlassBackground = true,
    Widget? largeTitle,
    MaterialAppBarSize largeTitleSize = MaterialAppBarSize.medium,
    SearchBar? searchBar,
    PreferredSizeWidget? bottom,
    Brightness? brightness,
    AppBarIOSConfig? ios,
  }) : super(
         leading:
             leading ??
             (showBackButton
                 ? BackButton(
                     icon: backIcon,
                     iconSize: backIconSize,
                     iconWeight: backIconWeight,
                     iconColor: backIconColor,
                     title: backTitle,
                     onTap: onBackTap,
                     padding: backPadding,
                     tint: backTint,
                     glassVariant: backGlassVariant,
                   )
                 : null),
         automaticallyImplyLeading: automaticallyImplyLeading ?? false,
         title:
             title ??
             (titleText != null
                 ? Text(
                     titleText,
                     style:
                         titleTextStyle ??
                         const TextStyle(
                           fontFamily: AppTextStyles.fontFamily,
                           fontSize: 18,
                           fontWeight: AppTextStyles.weightCards,
                           color: AppColors.ink,
                         ),
                   )
                 : null),
         subtitle:
             subtitle ??
             (subtitleText != null
                 ? Text(
                     subtitleText,
                     style:
                         subtitleTextStyle ??
                         const TextStyle(
                           fontFamily: AppTextStyles.fontFamily,
                           fontSize: 12,
                           fontWeight: AppTextStyles.weightBody,
                           color: AppColors.onboardingMutedText,
                         ),
                   )
                 : null),
         actions: actions,
         backgroundColor: backgroundColor,
         centerTitle: centerTitle,
         toolbarHeight: toolbarHeight,
         actionsPadding: actionsPadding,
         titleGlassBackground: titleGlassBackground,
         actionsGlassBackground: actionsGlassBackground,
         largeTitle: largeTitle,
         largeTitleSize: largeTitleSize,
         searchBar: searchBar,
         bottom: bottom,
         brightness: brightness,
         ios: ios,
       );

  /// Factory constructor for modal / dialog presentation screens that use
  /// a native close button ('xmark') instead of a navigation back chevron.
  factory SharedAppBar.modal({
    Key? key,
    String? titleText,
    TextStyle? titleTextStyle,
    Widget? title,
    Widget? leading,
    VoidCallback? onClose,
    Color? closeIconColor = AppColors.ink,
    List<Widget>? actions,
    Color? backgroundColor = Colors.transparent,
    bool? centerTitle = true,
  }) {
    return SharedAppBar(
      key: key,
      titleText: titleText,
      titleTextStyle: titleTextStyle,
      title: title,
      leading: leading,
      showBackButton: true,
      backIcon: 'xmark',
      backIconColor: closeIconColor,
      onBackTap: onClose,
      actions: actions,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}

/// Convenience aliases matching Enovo naming conventions
typedef EnovoAppBar = SharedAppBar;
typedef AppTopBar = SharedAppBar;
