import 'package:dummy_trading/UI/search/search_screen.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  RxList<StockItem> portfolio = <StockItem>[].obs;

  void addToPortfolio(StockItem stock) {
    portfolio.add(stock);
  }

}

final portfolioController = PortfolioController();
