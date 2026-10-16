import 'package:core/color/font_color.dart';
import 'package:core/color/text_color.dart';
import 'package:flutter/material.dart';

class CategoryShortcutWidget extends StatefulWidget {
  const CategoryShortcutWidget({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
    this.width = 72
  });

  final String label;
  final Widget icon;
  final VoidCallback? onTap;
  final double width;

  @override
  State<CategoryShortcutWidget> createState() => _CategoryShortcutWidgetState();
}

class _CategoryShortcutWidgetState extends State<CategoryShortcutWidget> {
  bool _isLongPressed = false;

  void _setLongPressed(bool value) {
    setState(() => _isLongPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(12);

    return SizedBox(
      width: widget.width,
      child: Semantics(
        onTap: widget.onTap,
        button: true,
        label: widget.label,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExcludeSemantics(
              child: Material(
                color: _isLongPressed ? FontColor.primary() : FontColor.surface(),
                borderRadius: radius,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: widget.onTap,
                  onLongPress: () => _setLongPressed(true),
                  onLongPressUp: () => _setLongPressed(false),
                  child: IconTheme.merge(
                    data: IconThemeData(color: _isLongPressed ? TextColor.textPrimary() : TextColor.textSecondary()),
                    child: SizedBox.square(
                      dimension: 50,
                      child: widget.icon,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
