import 'package:get/get.dart';

class LoginController extends GetxController {
  late String password;
  late RxBool passwordSecure = true.obs;
  @override
  void onInit() {
    password = '123';
    super.onInit();
  }

  void changePasswordSecure() {
    passwordSecure.value = !passwordSecure.value;
  }
}
