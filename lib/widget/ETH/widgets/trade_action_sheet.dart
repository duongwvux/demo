import 'package:flutter/material.dart';
import 'package:core/widget/trade_action_widget.dart';

class TradeActionSheet extends StatelessWidget {
  const TradeActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return TradeActionWidget(
      levels: const [
        OrderBookLevel(
          bidQty: '0.460',
          bidPrice: '\$56,678.32',
          askPrice: '\$56,678.32',
          askQty: '0.460',
        ),
        OrderBookLevel(
          bidQty: '1.250',
          bidPrice: '\$56,678.32',
          askPrice: '\$56,678.32',
          askQty: '1.250',
        ),
        OrderBookLevel(
          bidQty: '0.460',
          bidPrice: '\$56,678.32',
          askPrice: '\$56,678.32',
          askQty: '0.460',
        ),
      ],
      onBuy: () {},
      onSend: () {},
    );
  }
}
