import 'package:get/get.dart';

import 'stock_controller.dart';

class StockBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StockController());
  }
}
