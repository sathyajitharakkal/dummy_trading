import 'package:dummy_trading/UI/search/search_screen.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SearchController extends GetxController {
  RxList<StockItem> searchResult = <StockItem>[..._dummyStocks].obs;

  void initValue(List<StockItem> stock) {
    searchResult.addAll(stock);
  }

  void addToSearchResult(String keyword) {
    searchResult.clear();
    if (keyword == "") return searchResult.addAll(_dummyStocks);
    searchResult.clear();
    for (var element in _dummyStocks) {
      if (element.stockName.toLowerCase().contains(keyword.toLowerCase())) {
        searchResult.add(element);
      }
    }
  }
}

final searchController = SearchController();

// Dummy stock data for demonstration
List<StockItem> _dummyStocks = [
  StockItem(
      stockName: "Airtel Bharti",
      code: "Airtel",
      lastTrdPrice: "\$127,00",
      changePerc: "10.03%"),
  StockItem(
      stockName: "Ambuja Cement",
      code: "Ambuja",
      lastTrdPrice: "\$297,64",
      changePerc: "2.87%"),
  StockItem(
      stockName: "Kotak Bank",
      code: "Kotak",
      lastTrdPrice: "\$297,64",
      changePerc: "2.87%"),
  StockItem(
      stockName: "ICICI Bank",
      code: "ICICI",
      lastTrdPrice: "\$326,23",
      changePerc: "2.87%"),
  StockItem(
      stockName: "HDFC Bank",
      code: "HDFC",
      lastTrdPrice: "\$252,12",
      changePerc: "10.03%"),
];
