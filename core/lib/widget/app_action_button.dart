import 'package:core/color/text_color.dart';
import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    this.icon,
    this.borderColor,
    this.height = 52,
    this.borderRadius = 14,
    this.labelStyle,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color backgroundColor;
  final Color? borderColor;
  final double height;
  final double borderRadius;
  final TextStyle? labelStyle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final defaultStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: TextColor.textPrimary(),
    );

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor!),
        ),
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: radius,
          child: Center(
            child: isLoading
                ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 19),
                  const SizedBox(width: 8),
                ],
                Text(label, style: labelStyle ?? defaultStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}