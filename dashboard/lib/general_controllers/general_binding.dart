import 'package:dashboard/view/Screens/setting/setting_controller.dart';
import 'package:get/get.dart';

import '../view/Screens/setting/theme_controller.dart';
import '../view/widget/slide_drawer.dart';

class GeneralBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(SlideDrawerController());
    Get.lazyPut(() => SettingController());
  }

}