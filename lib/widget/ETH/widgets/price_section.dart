import 'package:flutter/material.dart';
import 'package:core/widget/price_fluctuations_widget.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PriceFluctuationsWidget(
      present: 53591.85,
      change: 540.56,
      percentage: -0.26,
    );
  }
}
