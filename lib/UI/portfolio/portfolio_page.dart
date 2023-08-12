import 'package:dummy_trading/UI/portfolio/portfolio_controller.dart';
import 'package:dummy_trading/UI/widgets/bar_graph.dart';
import 'package:dummy_trading/UI/widgets/custom_appbar.dart';
import 'package:dummy_trading/UI/widgets/spot_widget.dart';
import 'package:dummy_trading/UI/widgets/stockItem_tile.dart';
import 'package:dummy_trading/utils/style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatelessWidget {
  PortfolioScreen({Key? key}) : super(key: key) {
    barChartGroups = generateBarData(chartData);
  }

  List<double> chartData = [24, 20, 27, 57, 30, 42];
  List<BarChartGroupData> barChartGroups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Portfolio",
            onBackPressed: () => Get.back(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SpotWidget(gainLoss: "2,209", isGain: true),
                      SpotWidget(gainLoss: "5,440", isGain: false)
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Portfolio Balance",
                          style: mediumSemiBold.copyWith(color: Colors.grey),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(49, 158, 158, 158),
                                    width: 2),
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.notifications_none)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "\$97,326.46",
                      style: xlargeBold.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: Color.fromARGB(255, 30, 219, 190),
                        ),
                        Text(
                          "65.63 (76.23%) ",
                          style: smallBold.copyWith(
                              color: Color.fromARGB(255, 30, 219, 190)),
                        ),
                        Text(
                          "Today",
                          style: smallBold.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  getGraph(barChartGroups),
                  SizedBox(height: 24,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "List Stocks",
                      style: largeBold.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: portfolioController.portfolio.length,
                      itemBuilder: (context, index) {
                        return StockItemTile(stockItem: portfolioController.portfolio[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}