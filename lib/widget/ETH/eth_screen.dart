import 'package:core/widget/screen_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:prj2/widget/ETH/widgets/trade_action_sheet.dart';

import 'eth_body.dart';

class EthScreen extends StatefulWidget {
  const EthScreen({super.key});

  @override
  State<EthScreen> createState() => _EthScreenState();
}

class _EthScreenState extends State<EthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenHeaderWidget(
        title: Text("ETH"),
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: EthBody(),
      bottomNavigationBar: TradeActionSheet(),
    );
  }
}
