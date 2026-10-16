import 'package:core/color/text_color.dart';
import 'package:core/widget/screen_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:prj2/widget/statistic/statistic_body.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenHeaderWidget(
        title: Text("Statistic"),
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back),
          color: TextColor.textPrimary(),
        ),
      ),
      body: StatisticBody(),
    );
  }
}
