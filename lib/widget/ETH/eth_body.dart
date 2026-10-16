import 'package:flutter/material.dart';
import 'package:prj2/widget/ETH/widgets/line_chart.dart';
import 'package:prj2/widget/ETH/widgets/price_section.dart';
import 'package:prj2/widget/ETH/widgets/trade_action_sheet.dart';

class EthBody extends StatelessWidget {
  const EthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          PriceSection(),
          SizedBox(height: 10,),
          LineChart(),
          SizedBox(height: 10,),
          TradeActionSheet()
        ],
      ),
    );
  }
}
