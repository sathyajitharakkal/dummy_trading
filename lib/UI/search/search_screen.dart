import 'package:dummy_trading/UI/portfolio/portfolio_controller.dart';
import 'package:dummy_trading/UI/search/search_controll.dart';
import 'package:dummy_trading/UI/widgets/custom_appbar.dart';
import 'package:dummy_trading/UI/widgets/stockItem_tile.dart';
import 'package:dummy_trading/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockItem {
  String stockName;
  String code;
  String lastTrdPrice;
  String changePerc;
  StockItem(
      {required this.stockName,
      required this.code,
      required this.lastTrdPrice,
      required this.changePerc});
}

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Select Stock",
            onBackPressed: () => Get.back(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
            child: SearchTextField(onChanged: (p0) {
              if(p0 == null) return;
              searchController.addToSearchResult(p0);
            },),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchController.searchResult.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            portfolioController.addToPortfolio(searchController.searchResult[index]);
                            Get.closeCurrentSnackbar();
                            Get.snackbar('Added to Portfolio',
                                'Added ${searchController.searchResult[index].stockName} to your portfolio', forwardAnimationCurve: Curves.bounceIn, reverseAnimationCurve: Curves.easeOut, duration: Duration(seconds: 3));
                          },
                          child: StockItemTile(
                              stockItem: searchController.searchResult[index]),
                        );
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

class SearchTextField extends StatelessWidget {
  Function(String)? onChanged;
  SearchTextField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        hintText: 'Search company, stocks...',
        hintStyle: mediumBold.copyWith(color: Color.fromARGB(135, 95, 95, 95)),
        prefixIcon: Icon(Icons.search_rounded, color: Colors.black,),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}