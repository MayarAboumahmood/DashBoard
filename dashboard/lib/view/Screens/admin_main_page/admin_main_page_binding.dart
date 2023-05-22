import 'package:get/get.dart';
import 'admin_main_page_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    // currently useless
  }
}
