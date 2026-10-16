import 'package:core/color/font_color.dart';
import 'package:core/color/text_color.dart';
import 'package:flutter/material.dart';

import 'app_surface_card.dart';

class CoinCardWidget extends StatelessWidget {
  const CoinCardWidget({
    super.key,
    required this.icon,
    required this.name,
    required this.present,
    required this.change,
    required this.chart,
    this.onTap,
  });

  final IconData icon;
  final String name;
  final double present;
  final double change;
  final Widget chart;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isUp = (change >= 0);

    return SizedBox(
      width: 160,
      child: AppSurfaceCard(
        onTap: onTap,
        padding: const EdgeInsets.all(12),
        borderRadius: 12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 18, color: FontColor.primary()),
                ),
                const SizedBox(width: 8),
                Text(name,
                    style: TextStyle(color: TextColor.textPrimary())),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${present.toStringAsFixed(2)}',
                    style: TextStyle(color: TextColor.textPrimary(), fontSize: 18)),
                Text(
                  '${isUp ? '+' : ''}${change.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: isUp ? TextColor.priceUp() : TextColor.priceDown(),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            SizedBox(
              height: 60,
              child: chart,
            )
          ],
        ),
      ),
    );
  }
}