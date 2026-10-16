import 'package:flutter/material.dart';

class ScreenHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const ScreenHeaderWidget({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.backgroundColor,
    this.foregroundColor,
    this.height = kToolbarHeight
  });

  final Widget title;
  final Widget? leading;
  final List<Widget> actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = foregroundColor ?? theme.colorScheme.onSurface;

    return AppBar(
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor:
        backgroundColor ?? theme.scaffoldBackgroundColor,
      foregroundColor: foreground,
      titleSpacing: 16,
      titleTextStyle: theme.textTheme.titleSmall?.copyWith(
        color: foreground,
      ),
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}
