import 'package:flutter/material.dart';
import 'package:prj2/widget/home/widgets/card_section.dart';
import 'package:prj2/widget/home/widgets/category_section.dart';
import 'package:prj2/widget/home/widgets/home_promo.dart';
import 'package:prj2/widget/home/widgets/product_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          HomePromo(),
          SizedBox(height: 14,),
          CategorySection(),
          SizedBox(height: 14,),
          ProductSection(),
          SizedBox(height: 10,),
          CardSection(),
        ],
      ),
    );
  }
}
