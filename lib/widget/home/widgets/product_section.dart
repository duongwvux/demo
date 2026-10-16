import 'package:core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:core/widget/coin_card_widget.dart';
import 'package:prj2/widget/home/widgets/mini_chart_card.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    const _chartA = <double>[
      10, 14, 17, 19, 15, 18, 22, 17, 21, 24, 20, 25, 22, 27, 24, 29, 26, 31, 33, 28, 32, 36, 38,
    ];

    const _chartB = <double>[
      10, 14, 20, 21, 20, 22, 27, 25, 17, 24, 28, 22, 26, 27, 24, 28, 33, 36, 32, 30, 33, 38, 36, 34, 35,
    ];

    const _chartC = <double>[
      10, 20, 20, 18, 23, 25, 17, 21, 19, 22, 28, 22, 24, 26, 33, 35, 32, 29, 33, 31, 38, 34, 33, 35,
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(title: "Recently Risen"),
        const SizedBox(height: 12,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoinCardWidget(
                icon: Icons.currency_bitcoin,
                name: "LTC",
                present: 0.94,
                change: 12.49,
                chart: MiniChartCard(values: _chartA),
              ),
              SizedBox(width: 8,),
              CoinCardWidget(
                icon: Icons.currency_bitcoin,
                name: "BTC",
                present: 1.43,
                change: 27.46,
                chart: MiniChartCard(values: _chartB),
              ),
              SizedBox(width: 8,),
              CoinCardWidget(
                icon: Icons.currency_bitcoin,
                name: "XMR",
                present: 0.93,
                change: 13.32,
                chart: MiniChartCard(values: _chartC),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
