import 'package:dashboard/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/sizes.dart';
import 'constant/theme.dart';
import 'languages/language_controller.dart';
import 'languages/translations.dart';

Sizes size = Sizes();
SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
        locale: languageController.initialLanguage,
        fallbackLocale: const Locale(
            'en'), //when something wrong happend with the start languege
        translations: Translation(),
        debugShowCheckedModeBanner: false,
        title: 'Dash board',
        theme:
            Get.isDarkMode ? Themes.customdarktheme : Themes.customlighttheme,
        initialRoute: '/',
        getPages: appRoutes());
  }
}
