import 'package:get/get.dart';
import 'home_icons_controller.dart';

class HomeIconsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeIconsController());
    // currently useless
  }
}
