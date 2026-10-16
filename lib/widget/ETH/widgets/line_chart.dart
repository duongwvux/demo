import 'package:core/widget/period_selector_widget.dart';
import 'package:flutter/material.dart';

import 'fixed_area_chart.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FixedAreaChart(),
        SizedBox(height: 10,),
        PeriodSelectorWidget(
          items: [
            PeriodOption(value: "one hour", lable: "1H"),
            PeriodOption(value: "one day", lable: "1D"),
            PeriodOption(value: "one week", lable: "1W"),
            PeriodOption(value: "one month", lable: "1M")
          ],
          value: "one week",
        ),
      ],
    );
  }
}
