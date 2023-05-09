import 'package:get/get.dart';

import '../constant/theme.dart';
import '../data/service/pref_service.dart';

class ThemeController extends GetxController {
  late bool theThemeIsDark;
  PrefService prefService = PrefService();
  @override
  void onInit() async {
    theThemeIsDark =
        await prefService.readString('theme') == 'dark' ? true : false;
    super.onInit();
  }

  changeTheme() async {
    if (theThemeIsDark) {
      print('turn to light theme');
      await prefService.createString("theme", "light");
      theThemeIsDark = false;
      Get.changeTheme(Themes.customlighttheme);
    } else if (!theThemeIsDark) {
      print('turn to dark theme');
      await prefService.createString("theme", "dark");
      theThemeIsDark = true;
      Get.changeTheme(Themes.customdarktheme);
    }
  }
}
