import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

/// Available visual variants for the shared button.
enum AppButtonVariant {
  /// Filled with the brand primary orange
  primary,

  /// Soft warm peach background with primary orange text
  secondary,

  /// Clean white/transparent with a subtle border
  outlined,

  /// Red filled button for destructive or alert actions
  danger,
}

/// A highly reusable, polished button widget for Enovo.
///
/// Features support for primary, secondary, outlined, and danger variants,
/// loading spinner indicators, leading and trailing icons, custom dimensions,
/// and responsive tap states.
class AppButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool isLoading;
  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.trailingIcon,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 52.0,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.child,
    this.padding,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  bool get _isEnabled => widget.onPressed != null && !widget.isLoading;

  Color _resolveBackgroundColor() {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    if (!_isEnabled) {
      return const Color(0xFFEFECE8);
    }

    switch (widget.variant) {
      case AppButtonVariant.primary:
        return AppColors.primary;
      case AppButtonVariant.secondary:
        return const Color(0xFFFDEEE6);
      case AppButtonVariant.outlined:
        return AppColors.white;
      case AppButtonVariant.danger:
        return AppColors.danger;
    }
  }

  Color _resolveTextColor() {
    if (widget.textColor != null) return widget.textColor!;

    if (!_isEnabled) {
      return const Color(0xFFA59D96);
    }

    switch (widget.variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.danger:
        return AppColors.white;
      case AppButtonVariant.secondary:
        return AppColors.primary;
      case AppButtonVariant.outlined:
        return AppColors.ink;
    }
  }

  Border? _resolveBorder() {
    if (widget.borderColor != null) {
      return Border.fromBorderSide(
        BorderSide(color: widget.borderColor!, width: 1),
      );
    }

    if (widget.variant == AppButtonVariant.outlined) {
      return const Border.fromBorderSide(
        BorderSide(color: Color(0x202D1810), width: 1),
      );
    }

    return null;
  }

  List<BoxShadow> _resolveShadow() {
    if (!_isEnabled) return const [];

    switch (widget.variant) {
      case AppButtonVariant.primary:
        return [
          BoxShadow(
            color: const Color(0x38E87B4E),
            blurRadius: _isPressed ? 4 : 10,
            offset: Offset(0, _isPressed ? 2 : 4),
          ),
        ];
      case AppButtonVariant.danger:
        return [
          BoxShadow(
            color: const Color(0x33C94F4F),
            blurRadius: _isPressed ? 4 : 10,
            offset: Offset(0, _isPressed ? 2 : 4),
          ),
        ];
      default:
        return [
          BoxShadow(
            color: const Color(0x06000000),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveRadius =
        widget.borderRadius ?? const BorderRadius.all(Radius.circular(16));
    final textColor = _resolveTextColor();

    Widget content;
    if (widget.isLoading) {
      content = SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(color: textColor),
      );
    } else if (widget.child != null) {
      content = widget.child!;
    } else {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon!, size: 18, color: textColor),
            const SizedBox(width: 8),
          ],
          if (widget.text != null)
            Text(
              widget.text!,
              style: TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 15,
                fontWeight: AppTextStyles.weightButtons,
                color: textColor,
                letterSpacing: 0.1,
              ),
            ),
          if (widget.trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(widget.trailingIcon!, size: 18, color: textColor),
          ],
        ],
      );
    }

    return GestureDetector(
      onTap: _isEnabled ? widget.onPressed : null,
      onTapDown: (_) {
        if (_isEnabled) setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        if (_isEnabled) setState(() => _isPressed = false);
      },
      onTapCancel: () {
        if (_isEnabled) setState(() => _isPressed = false);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: _resolveBackgroundColor(),
          borderRadius: effectiveRadius,
          border: _resolveBorder(),
          boxShadow: _resolveShadow(),
        ),
        child: Center(child: content),
      ),
    );
  }
}

/// Naming aliases for cross-app consistency
typedef SharedButton = AppButton;
typedef EnovoButton = AppButton;
