import 'package:core/color/font_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FixedAreaChart extends StatelessWidget {
  const FixedAreaChart({super.key});

  // Dữ liệu hardcode (giá trị y, x là index)
  static const _values = <double>[
    44, 44, 43, 40, 38, 37, 39, 42, 41, 43, 42, 40, 44, 46, 48, 50, 53, 54,
    57, 60, 62, 61, 59, 60, 62, 60, 59, 61, 58, 57, 56, 59, 57, 58, 61, 60,
    62, 64, 63, 65, 64, 63, 65, 66, 64, 63, 66, 68, 67, 70, 72, 70, 69, 72,
    75, 73, 72, 76, 80, 82, 81, 79, 76, 77, 79, 78, 80, 79, 78, 79, 80, 78,
    77, 79, 80, 81, 79, 82, 84,
  ];

  @override
  Widget build(BuildContext context) {
    final primary = FontColor.primary();
    final background = FontColor.background();

    final spots = [
      for (int i = 0; i < _values.length; i++) FlSpot(i.toDouble(), _values[i]),
    ];
    final lastIndex = spots.length - 1;

    return Container(
      height: 230,
      color: background,
      child: Stack(
        children: [
          // Đồ thị
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 36, 12, 0),
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: lastIndex.toDouble(),
                minY: 20,
                maxY: 90,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    curveSmoothness: 0.15, // thấp để giữ độ răng cưa
                    preventCurveOverShooting: true,
                    color: primary,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    // Chỉ hiện chấm ở điểm cuối
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, _) => spot.x == lastIndex,
                      getDotPainter: (spot, percent, bar, index) =>
                          FlDotCirclePainter(
                            radius: 4,
                            color: Colors.white,
                            strokeWidth: 3,
                            strokeColor: primary,
                          ),
                    ),
                    // Vùng tô gradient: primary -> background
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [primary, background],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Nhãn giá cố định góc trên phải
          const Positioned(
            top: 8,
            right: 12,
            child: Text(
              '\$53,591.85',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}