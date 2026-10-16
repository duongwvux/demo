import 'package:core/widget/app_surface_card.dart';
import 'package:core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:core/widget/coin_card_widget.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(width: 8,),
              CoinCardWidget(
                icon: Icons.currency_bitcoin,
                name: "BTC",
                present: 1.43,
                change: 27.46,
              ),
              SizedBox(width: 8,),
              CoinCardWidget(
                icon: Icons.currency_bitcoin,
                name: "XMR",
                present: 0.93,
                change: 13.32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
