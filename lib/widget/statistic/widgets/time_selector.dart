import 'package:core/color/text_color.dart';
import 'package:core/widget/period_selector_widget.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PeriodSelectorWidget(
          items: [
            PeriodOption(value: "Week", lable: "Week"),
            PeriodOption(value: "Month", lable: "Month"),
            PeriodOption(value: "Year", lable: "Year")
          ],
          value: "Month",
        ),
        SizedBox(height: 8,),
        Text(
          "Total spendings",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: TextColor.textSecondary(),
          ),
        ),
        SizedBox(height: 6,),
        Text(
          "\$4,893.90",
          style: theme.textTheme.headlineLarge,
        )
      ],
    );
  }
}
