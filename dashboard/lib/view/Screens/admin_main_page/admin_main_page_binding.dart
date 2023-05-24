import 'package:get/get.dart';
import '../../widget/slide_drawer.dart';
import 'admin_main_page_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(SlideDrawerController());
    // currently useless
  }
}
