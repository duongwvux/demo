import 'package:core/color/font_color.dart';
import 'package:flutter/material.dart';

class AppSurfaceCard extends StatelessWidget {
  const AppSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.borderRadius = 16,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final content = Padding(
      padding: padding,
      child: child,
    );

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: FontColor.surface(),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
      ),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
        ? content
        : InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: content,
          ),
    );
  }
}
