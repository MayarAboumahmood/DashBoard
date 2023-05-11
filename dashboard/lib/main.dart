import 'package:dashboard/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/general_controller/language_controller.dart';
import 'constant/theme.dart';
import 'data/service/pref_service.dart';
import 'languages/translations.dart';

SharedPreferences? sharedPreferences;
PrefService prefService = PrefService();
late String themeValue;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  themeValue = await prefService.readString("theme");
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
        theme: themeValue == "dark"
            ? Themes.customdarktheme
            : Themes.customlighttheme,
        themeMode: ThemeMode.system == ThemeMode.dark //ThemeMode.light
            ? ThemeMode
                .light //to make the theme change when the dark theme is on in the device.
            : ThemeMode.light,
        initialRoute: '/',
        getPages: appRoutes());
  }
}
