import 'package:core/color/font_color.dart';
import 'package:flutter/material.dart';

class AppBottomNavItem {
  const AppBottomNavItem({
    required this.icon,
    required this.label,
    this.activeIcon,
  });

  final IconData icon;
  final String label;
  final IconData? activeIcon;
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.items,
    this.selectedIndex,
    this.onChanged,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
  }) : assert(items.length >= 2);

  final List<AppBottomNavItem> items;
  final int? selectedIndex;
  final ValueChanged<int>? onChanged;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? FontColor.surfaceInset(),
        border: const Border(
          top: BorderSide(
            color: Color(0xFF2A2B33)
          )
        )
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final selected = index == selectedIndex;

              return Expanded(
                child: Semantics(
                  button: true,
                  selected: selected,
                  label: item.label,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () => onChanged?.call(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected
                            ? activeColor?.withValues(alpha: .14)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            selected ? (item.activeIcon ?? item.icon) : item.icon,
                            size: 22,
                            color: selected ? activeColor : inactiveColor,
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                              color: selected ? activeColor : inactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
