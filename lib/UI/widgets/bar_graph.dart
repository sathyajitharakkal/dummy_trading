import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget getGraph(List<BarChartGroupData> data) => SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 16),
        child: BarChart(
          BarChartData(
            barGroups: data,
            titlesData: const FlTitlesData(
                show: true,
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false))),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: Color.fromARGB(49, 158, 158, 158))),
            barTouchData: BarTouchData(enabled: false),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              // verticalInterval:
              //     10, // Set the interval for showing extra vertical grids
              drawHorizontalLine: true,
              verticalInterval: 0.16,
              horizontalInterval: 10,
              checkToShowVerticalLine: (double value) =>
                  true, // Adjust the condition
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Color.fromARGB(75, 158, 158, 158),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return const FlLine(
                  color: Color.fromARGB(94, 158, 158, 158),
                  strokeWidth: 1,
                );
              },
            ),
            minY: 0, // Set the minimum value of the y-axis
            maxY: 70, // Set the maximum value of the y-axis
          ),
        ),
      ),
    );

List<BarChartGroupData> generateBarData(List<double> list) {
  List<String> chartNames = ["IND", "AUS", "USA", "DEU", "ITA", "UK"];
  return List.generate(
      list.length,
      (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                  toY: list[index],
                  color: Colors.blue,
                  width: 40,
                  borderRadius: BorderRadius.circular(0))
            ],
          ));
}
