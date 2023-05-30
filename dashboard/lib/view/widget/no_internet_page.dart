// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/data/checkInternet/check_internet.dart';
import 'package:dashboard/general_controllers/statuse_request_controller.dart';
import 'package:dashboard/view/Screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/font.dart';
import '../../constant/sizes.dart';
import '../../constant/theme.dart';
import 'hover_button.dart';

Widget noInternetPage(Sizes size, StatuseRequestController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Center(
        child: AutoSizeText(
          'No Internet'.tr, //// adding to translate files
          style: TextStyle(
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              fontSize: size.appBarTextSize,
              fontFamily: jostFontFamily,
              fontWeight: FontWeight.w100),
        ),
      ),
      HoverButton(
          myRadius: size.buttonRadius,
          mycolor: primaryColor,
          ontap: () async {
            controller.statuseRequest =
                await checkIfTheInternetIsConectedBeforGoingToThePage();
            controller.update();
          },
          mywidth: size.normalButtonWidht,
          myheight: size.normalButtonHeight,
          child: const Text('try again'))
    ],
  );
}

Future<StatuseRequest> checkIfTheInternetIsConectedBeforGoingToThePage() async {
  try {
    bool connectToInternet = await checkInternet();
    print(connectToInternet);
    if (connectToInternet) {
      return StatuseRequest.init;
    } else {
      return StatuseRequest.offlinefailure;
    }
  } catch (e) {
    return StatuseRequest.offlinefailure;
  }
}

bool checkIfTheControllerHaveStatuseRequest<Controller extends GetxController>(
    Controller controller) {
  if (controller is LoginController) {
    return true;
  }
  return false;
}//to fix