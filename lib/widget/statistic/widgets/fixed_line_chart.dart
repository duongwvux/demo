import 'package:core/color/font_color.dart';
import 'package:core/color/text_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FixedLineChart extends StatelessWidget {
  const FixedLineChart({super.key});

  static const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
  static final blue = FontColor.primary();

  // Dữ liệu hardcode (x = index tháng, y = giá trị)
  static const _spots = [
    FlSpot(0, 0.3),
    FlSpot(1, 1.5),
    FlSpot(2, 1.0),
    FlSpot(3, 3.2),
    FlSpot(4, 3.8),
    FlSpot(5, 6.0), // Jun - điểm được chọn
    FlSpot(6, 2.8),
    FlSpot(7, 5.2),
  ];

  @override
  Widget build(BuildContext context) {
    final bar = LineChartBarData(
      spots: _spots,
      isCurved: true,
      curveSmoothness: 0.35,
      color: blue,
      barWidth: 2.5,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(show: false),
      // Chỉ hiện chấm tại Jun
      dotData: FlDotData(
        show: true,
        checkToShowDot: (spot, barData) => spot.x == 5,
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: 6,
          color: TextColor.textPrimary(),
          strokeWidth: 3,
          strokeColor: blue,
        ),
      ),
    );

    return Container(
      height: 220,
      padding: const EdgeInsets.fromLTRB(12, 40, 12, 12),
      decoration: BoxDecoration(
        color: FontColor.chartGrid(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          minX: -0.5,
          maxX: 7.5,
          minY: 0,
          maxY: 7,
          borderData: FlBorderData(show: false),

          // Lưới dọc nét đứt, không có lưới ngang
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: false,
            drawVerticalLine: true,
            verticalInterval: 1,
            checkToShowVerticalLine: (value) => value == value.roundToDouble(),
            getDrawingVerticalLine: (_) => FlLine(
              color: Colors.white24,
              strokeWidth: 1,
              dashArray: [3, 4],
            ),
          ),

          // Chỉ hiện nhãn tháng ở dưới
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  if (value != value.roundToDouble()) return const SizedBox();
                  final i = value.toInt();
                  if (i < 0 || i >= _months.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      _months[i],
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          lineBarsData: [bar],

          // Tooltip cố định tại Jun, không phản hồi chạm
          showingTooltipIndicators: [
            ShowingTooltipIndicators([LineBarSpot(bar, 0, _spots[5])]),
          ],
          lineTouchData: LineTouchData(
            handleBuiltInTouches: false,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => FontColor.sheetHandle(),
              tooltipPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              tooltipMargin: 14,
              getTooltipItems: (spots) => spots
                  .map((_) => LineTooltipItem(
                '\$123.89',
                TextStyle(color: blue, fontSize: 14),
              ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}