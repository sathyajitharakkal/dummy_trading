
import 'package:dummy_trading/UI/search/search_screen.dart';
import 'package:dummy_trading/utils/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockItemTile extends StatelessWidget {
  StockItem stockItem;
  StockItemTile({super.key, required this.stockItem});

  final List<FlSpot> lineChartSpots = [
      FlSpot(4, 5.7),
      FlSpot(4.4, 5.9),
      FlSpot(4.6, 5.8),
      FlSpot(4.6, 5.9),
      FlSpot(4.9, 5.7),
      FlSpot(5.2, 5.3),
      FlSpot(5.7, 5.5),
      FlSpot(6, 5.9),
      FlSpot(6.5, 6.1),
      FlSpot(6.9, 5.9),
      FlSpot(7.3, 5.5),
      FlSpot(7.7, 5.4),
      FlSpot(7.8, 5.2),
      FlSpot(8.1, 5.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/${stockItem.code.toLowerCase()}.jpg",
                height: 55,
                width: 55,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stockItem.stockName,
                    style: mediumBold,
                  ),
                  Text(
                    stockItem.code,
                    style: smallSemiBold.copyWith(
                        color: const Color.fromARGB(123, 158, 158, 158)),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 80,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: lineChartSpots,
                        isCurved: true,
                        color: Color.fromARGB(255, 30, 219, 190),
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    stockItem.lastTrdPrice,
                    style: mediumBold.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    stockItem.changePerc,
                    style: smallBold.copyWith(
                        color: Color.fromARGB(255, 30, 219, 190)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}