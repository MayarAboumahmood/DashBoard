import 'package:get/get.dart';

class SettingController extends GetxController {
  RxString languag = 'ar'.obs;
  void changeLanguageUI(Object? value) {
    languag.value = value as String;
  }
}
