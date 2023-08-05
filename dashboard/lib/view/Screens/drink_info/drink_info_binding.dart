import 'package:get/get.dart';

import 'drinke_info_controller.dart';

class DrinkInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DrinkInfoController());
  }
}
