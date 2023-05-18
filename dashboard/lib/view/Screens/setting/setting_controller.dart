import 'package:get/get.dart';

import '../../../main.dart';

class SettingController extends GetxController {
  RxString languag = 'English'.obs;
  @override
  void onInit() {
    languag.value = sharedPreferences!.getString('lang ui') == null
        ? 'English'
        : sharedPreferences!.getString('lang ui') as String;
    super.onInit();
  }

  void changeLanguageUI(Object? value) {
    languag.value = value as String;
    saveTheLangaugeInTheLocaleMemorie(value);
  }

  void saveTheLangaugeInTheLocaleMemorie(String languageCode) {
    sharedPreferences!.setString("lang ui", languageCode);
  }

  String initialLanguageUI = sharedPreferences!.getString("lang ui") == null
      ? "English"
      : sharedPreferences!.getString("lang ui") as String;
}
