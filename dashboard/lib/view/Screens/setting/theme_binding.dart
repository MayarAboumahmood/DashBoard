import 'package:dashboard/view/Screens/setting/language_controller.dart';
import 'package:dashboard/view/Screens/setting/setting_controller.dart';
import 'package:get/get.dart';

import 'theme_controller.dart';

class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(LanguageController());
    Get.put(SettingController());
  }
}
