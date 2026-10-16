import 'package:core/color/font_color.dart';
import 'package:core/widget/app_info_card.dart';
import 'package:core/widget/section_header_widget.dart';
import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(title: "Total Coast"),
        SizedBox(height: 10,),
        SingleChildScrollView(
          child: Column(
            children: [
              AppInfoCard(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: FontColor.surfaceInset(),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                title: "WN company",
                subtitle: "12:00 am - Aug 12, 2022",
                present: null,
                change: -993.98,
              ),
              SizedBox(height: 6,),
              AppInfoCard(
                leading: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: FontColor.surfaceInset(),
                      borderRadius: BorderRadius.circular(8)
                  ),
                ),
                title: "GO company",
                subtitle: "02:00 pm - Aug 22, 2022",
                present: null,
                change: -1.904,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
