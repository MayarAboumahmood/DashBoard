import 'dart:ui';
import 'package:dashboard/data/service/pref_service.dart';
import 'package:get/get.dart';

import '../main.dart';

class LanguageController extends GetxController {
  PrefService prefService = PrefService();

  Locale initialLanguage = sharedPreferences!.getString('lang') == null
      ? Get.deviceLocale!
      : Locale(sharedPreferences!.getString("lang") as String);
  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    saveTheLangaugeInTheLocaleMemorie(languageCode);
    Get.updateLocale(locale);
  }

  void saveTheLangaugeInTheLocaleMemorie(String languageCode) {
    sharedPreferences!.setString("lang", languageCode);
  }
}
