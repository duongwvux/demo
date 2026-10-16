import 'package:core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:prj2/widget/statistic/widgets/fixed_line_chart.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(title: "Overview"),
        SizedBox(height: 10,),
        FixedLineChart(),
      ],
    );
  }
}
