import 'package:get/get.dart';

import 'theme_controller.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}
