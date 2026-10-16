import 'package:core/color/font_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniChartCard extends StatelessWidget {
  const MiniChartCard({super.key, required this.values, this.height = 90});

  final List<double> values;
  final double height;

  @override
  Widget build(BuildContext context) {
    final primary = FontColor.primary();
    final surface = FontColor.surface();

    final spots = [
      for (int i = 0; i < values.length; i++) FlSpot(i.toDouble(), values[i]),
    ];

    final minV = values.reduce((a, b) => a < b ? a : b);
    final maxV = values.reduce((a, b) => a > b ? a : b);

    return Container(
      height: height,
      padding: const EdgeInsets.fromLTRB(10, 14, 10, 0),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: (values.length - 1).toDouble(),
          minY: minV - 1,
          maxY: maxV + 1,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: false,
              color: primary,
              barWidth: 1.5,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [primary, surface],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}