import 'package:core/widget/app_surface_card.dart';
import 'package:flutter/material.dart';

import '../color/text_color.dart';

class StatisticInfoCard extends StatelessWidget {
  const StatisticInfoCard({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.change,
    this.leadingSize = 50,
    this.onTap
  });

  final Widget leading;
  final String title;
  final String subtitle;
  final double? change;
  final double leadingSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUp = change! >= 0;

    return AppSurfaceCard(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox.square(
            dimension: leadingSize,
            child: leading,
          ),
          const SizedBox(width: 14,),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 6,),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: DefaultTextStyle.merge(
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.end,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text( change == null ? '' :
                    '${change! >= 0 ? '' : '-'}\$${isUp ? change.toString() : (change!*-1).toString()}',
                      style: TextStyle(
                        color: isUp ? TextColor.priceUp() : TextColor.priceDown(),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
