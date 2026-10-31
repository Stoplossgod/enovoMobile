import 'package:dartnative/dartnative.dart';

/// Responsive helper utilities for screen adaptation in DartNative.
abstract final class Responsive {
  Responsive._();

  /// Screen size shortcuts
  static Size size(BuildContext context) => MediaQuery.sizeOf(context);
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;

  /// Safe area padding
  static EdgeInsets padding(BuildContext context) => MediaQuery.paddingOf(context);

  /// Orientation
  static Orientation orientation(BuildContext context) => MediaQuery.orientationOf(context);
  static bool isPortrait(BuildContext context) => orientation(context) == Orientation.portrait;
  static bool isLandscape(BuildContext context) => orientation(context) == Orientation.landscape;

  /// Device breakpoint thresholds
  static const double mobileMaxWidth = 599.0;
  static const double tabletMaxWidth = 1023.0;

  static bool isMobile(BuildContext context) => width(context) <= mobileMaxWidth;
  static bool isTablet(BuildContext context) =>
      width(context) > mobileMaxWidth && width(context) <= tabletMaxWidth;
  static bool isDesktop(BuildContext context) => width(context) > tabletMaxWidth;

  /// Relative sizing helpers (percentage based)
  static double widthPercent(BuildContext context, double percent) => width(context) * (percent / 100);
  static double heightPercent(BuildContext context, double percent) => height(context) * (percent / 100);

  /// Responsive value selector based on device form factor
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }
}

/// Convenient extension on [BuildContext] for responsive styling and layout.
extension ResponsiveContext on BuildContext {
  Size get screenSize => Responsive.size(this);
  double get screenWidth => Responsive.width(this);
  double get screenHeight => Responsive.height(this);
  EdgeInsets get screenPadding => Responsive.padding(this);

  Orientation get orientation => Responsive.orientation(this);
  bool get isPortrait => Responsive.isPortrait(this);
  bool get isLandscape => Responsive.isLandscape(this);

  bool get isMobile => Responsive.isMobile(this);
  bool get isTablet => Responsive.isTablet(this);
  bool get isDesktop => Responsive.isDesktop(this);

  double widthPercent(double percent) => Responsive.widthPercent(this, percent);
  double heightPercent(double percent) => Responsive.heightPercent(this, percent);

  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) =>
      Responsive.value(this, mobile: mobile, tablet: tablet, desktop: desktop);
}
