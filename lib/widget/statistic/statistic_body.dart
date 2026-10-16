import 'package:flutter/material.dart';
import 'package:prj2/widget/statistic/widgets/company_card.dart';
import 'package:prj2/widget/statistic/widgets/line_chart.dart';
import 'package:prj2/widget/statistic/widgets/time_selector.dart';

class StatisticBody extends StatelessWidget {
  const StatisticBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          TimeSelector(),
          SizedBox(height: 14,),
          LineChart(),
          SizedBox(height: 14,),
          CompanyCard()
        ],
      ),
    );
  }
}
