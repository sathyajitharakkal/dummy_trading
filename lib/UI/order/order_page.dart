import 'package:dummy_trading/UI/portfolio/portfolio_controller.dart';
import 'package:dummy_trading/UI/widgets/calendar_view.dart';
import 'package:dummy_trading/UI/widgets/custom_appbar.dart';
import 'package:dummy_trading/UI/widgets/stockItem_tile.dart';
import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Order",
            onBackPressed: () => Get.back(),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Order",
                      style: mediumBold.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "History",
                      style: mediumBold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 380,
                  child: CalendarView(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Order",
                        style: largeBold,
                      ),
                      Text(
                        "Monday, 14 june 2021",
                        style: mediumSemiBold.copyWith(
                            color: Color.fromARGB(149, 158, 158, 158)),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: portfolioController.portfolio.length,
                    itemBuilder: (context, index) {
                      return StockItemTile(
                          stockItem: portfolioController.portfolio[index]);
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
