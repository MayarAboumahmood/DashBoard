import 'package:get/get.dart';

import '../add_new_drink/add_new_drink_controller.dart';
import 'stock_controller.dart';

class StockBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StockController());
    Get.lazyPut(() => AddNewDrinkController());
  }
}
