import 'package:get/get.dart';

import '../../constant/theme.dart';

SnackbarController snackBarForErrors(String title,String message) {
    return Get.snackbar(
      title.tr, ///// adding for translate  done
      message.tr, //// adding for translate  done
      snackPosition: SnackPosition.TOP,
      colorText: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
      backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
      duration: const Duration(seconds: 5),
    );
  }