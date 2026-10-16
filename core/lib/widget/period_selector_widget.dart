import 'package:core/color/text_color.dart';
import 'package:flutter/material.dart';

import '../color/font_color.dart';

class PeriodOption<T> {
  const PeriodOption({
    required this.value,
    required this.lable,
  });

  final T value;
  final String lable;
}
class PeriodSelectorWidget<T> extends StatelessWidget {
  const PeriodSelectorWidget({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
    this.height = 36,
    this.padding = const EdgeInsets.all(4),
  });

  final List<PeriodOption<T>> items;
  final T value;
  final ValueChanged<T>? onChanged;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: FontColor.surface(),
        borderRadius: BorderRadius.circular(height/2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          final isSelected = item.value == value;
          return Expanded(
            child: Semantics(
              selected: isSelected,
              button: true,
              label: item.lable,
              child: InkWell(
                borderRadius: BorderRadius.circular((height-8)/2),
                // onTap: () => onChanged(item.value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? FontColor.surfaceInset() : Colors.transparent,
                    borderRadius: BorderRadius.circular((height - 8)/2),
                  ),
                  child: Text(
                    item.lable,
                    style: isSelected
                      ? Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:  TextColor.textPrimary(),
                        )
                      : Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: TextColor.textSecondary(),
                        )
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
