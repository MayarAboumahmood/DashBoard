import 'package:get/get.dart';

import '../constant/theme.dart';
import '../data/service/pref_service.dart';

class ThemeController extends GetxController {
  late RxBool theThemeIsDark = false.obs;
  PrefService prefService = PrefService();
  @override
  void onInit() {
    theThemeIsDark.value = false;
    super.onInit();
  }

  changeTheme() async {
    if (theThemeIsDark.value) {
      await prefService.createString("theme", "light");
      theThemeIsDark.value = false;
      Get.changeTheme(Themes.customlighttheme);
    } else if (!theThemeIsDark.value) {
      await prefService.createString("theme", "dark");
      theThemeIsDark.value = true;
      Get.changeTheme(Themes.customdarktheme);
    }
  }
}
