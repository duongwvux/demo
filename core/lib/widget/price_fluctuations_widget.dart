import 'package:core/color/font_color.dart';
import 'package:core/color/text_color.dart';
import 'package:flutter/material.dart';

class PriceFluctuationsWidget extends StatelessWidget {
  const PriceFluctuationsWidget({
    super.key,
    required this.present,
    required this.change,
    required this.percentage,
  });

  final double present;
  final double change;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: FontColor.surface(),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "\$${present.toString()}",
              style: theme.textTheme.headlineMedium?.copyWith(
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${change.toString()}",
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(width: 14,),
                percentage >= 0 ?
                    Icon(
                      Icons.arrow_drop_up,
                      color: TextColor.priceUp(),
                    ) :
                    Icon(
                      Icons.arrow_drop_down,
                      color: TextColor.priceDown(),
                    ),
                SizedBox(width: 6,),
                Text(
                  "${percentage.toString()}%",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: percentage >= 0 ? TextColor.priceUp() : TextColor.priceDown(),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
