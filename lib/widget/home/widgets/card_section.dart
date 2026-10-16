import 'package:core/color/font_color.dart';
import 'package:core/widget/app_info_card.dart';
import 'package:core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(title: "All fluctuations"),
        const SizedBox(height: 12,),
        SingleChildScrollView(
          child: Column(
            children: [
              AppInfoCard(
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.currency_bitcoin, size: 18, color: FontColor.primary()),
                ),
                title: "ETH",
                subtitle: "Etherium",
                present: 1245.34,
                change: -0.9,
              ),
              SizedBox(height: 10,),
              AppInfoCard(
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.currency_bitcoin, size: 18, color: FontColor.primary()),
                ),
                title: "BTC",
                subtitle: "Bitcoin",
                present: 1245.34,
                change: -0.9,
              ),
              SizedBox(height: 10,),
              AppInfoCard(
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.currency_bitcoin, size: 18, color: FontColor.primary()),
                ),
                title: "LTC",
                subtitle: "Litecoin",
                present: 1245.34,
                change: -0.9,
              ),
              SizedBox(height: 10,),
              AppInfoCard(
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.currency_bitcoin, size: 18, color: FontColor.primary(),),
                ),
                title: "XMR",
                subtitle: "Moreno",
                present: 1245.34,
                change: -0.9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
