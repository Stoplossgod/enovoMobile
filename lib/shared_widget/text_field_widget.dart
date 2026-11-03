import 'package:dartnative/dartnative.dart';
import 'package:enovo_mobile_app/core/colors.dart';
import 'package:enovo_mobile_app/core/textstyles.dart';

/// Highly reusable, polished text field widget designed to match Enovo's
/// design language with label, prefix/suffix icons, focus states, password
/// masking toggles, error feedback, and multiline support.
class AppTextField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final String? errorText;
  final String? helperText;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.isPassword = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.onSuffixTap,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.errorText,
    this.helperText,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword || widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPassword != oldWidget.isPassword ||
        widget.obscureText != oldWidget.obscureText) {
      _obscureText = widget.isPassword || widget.obscureText;
    }
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    // Determine border styling according to error / focus / default state
    Border border;
    if (hasError) {
      border = const Border.fromBorderSide(
        BorderSide(color: AppColors.danger, width: 1.5),
      );
    } else if (_isFocused) {
      border = const Border.fromBorderSide(
        BorderSide(color: AppColors.primary, width: 1.5),
      );
    } else {
      border = const Border.fromBorderSide(
        BorderSide(color: Color(0x182D1810), width: 1),
      );
    }

    final effectiveRadius =
        widget.borderRadius ?? const BorderRadius.all(Radius.circular(14));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Optional Label
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Text(
            widget.label!,
            style: const TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 13,
              fontWeight: AppTextStyles.weightLabels,
              color: AppColors.ink,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Input Field Outer Container
        Container(
          padding:
              widget.padding ??
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: widget.enabled
                ? (widget.backgroundColor ?? AppColors.white)
                : const Color(0xFFF7F5F2),
            borderRadius: effectiveRadius,
            border: border,
          ),
          child: Row(
            crossAxisAlignment: widget.maxLines != null && widget.maxLines! > 1
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              // Leading Icon / Prefix
              if (widget.prefixWidget != null) ...[
                widget.prefixWidget!,
                const SizedBox(width: 10),
              ] else if (widget.prefixIcon != null) ...[
                Icon(
                  widget.prefixIcon!,
                  size: 20,
                  color: _isFocused
                      ? AppColors.primary
                      : const Color(0xFF8C827A),
                ),
                const SizedBox(width: 10),
              ],

              // Actual TextField
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  textCapitalization: widget.textCapitalization,
                  obscureText: _obscureText,
                  maxLines: widget.isPassword ? 1 : widget.maxLines,
                  minLines: widget.minLines,
                  maxLength: widget.maxLength,
                  readOnly: widget.readOnly,
                  enabled: widget.enabled,
                  autofocus: widget.autofocus,
                  cursorColor: AppColors.primary,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  onTap: widget.onTap,
                  style: TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 15,
                    fontWeight: AppTextStyles.weightBody,
                    color: widget.enabled
                        ? AppColors.ink
                        : AppColors.onboardingMutedText,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                      fontFamily: AppTextStyles.fontFamily,
                      fontSize: 15,
                      fontWeight: AppTextStyles.weightBody,
                      color: Color(0xFF9E958F),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              // Password Visibility Toggle or Custom Suffix
              if (widget.isPassword) ...[
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                  child: Icon(
                    _obscureText
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    size: 20,
                    color: const Color(0xFF8C827A),
                  ),
                ),
              ] else if (widget.suffixWidget != null) ...[
                const SizedBox(width: 10),
                widget.suffixWidget!,
              ] else if (widget.suffixIcon != null) ...[
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: widget.onSuffixTap,
                  child: Icon(
                    widget.suffixIcon!,
                    size: 20,
                    color: const Color(0xFF8C827A),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Error Message
        if (hasError) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_circle,
                size: 13,
                color: AppColors.danger,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: const TextStyle(
                    fontFamily: AppTextStyles.fontFamily,
                    fontSize: 12,
                    fontWeight: AppTextStyles.weightHelper,
                    color: AppColors.danger,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ] else if (widget.helperText != null &&
            widget.helperText!.isNotEmpty) ...[
          // Helper Message
          const SizedBox(height: 6),
          Text(
            widget.helperText!,
            style: const TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 12,
              fontWeight: AppTextStyles.weightHelper,
              color: AppColors.onboardingMutedText,
              height: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}

/// Naming aliases for flexible usage across the app
typedef CustomTextField = AppTextField;
typedef EnovoTextField = AppTextField;
