import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/sizes.dart';
import '../../widget/costum_text_field.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatelessWidget {
  GetDeviceType getDeviceType = GetDeviceType();
  LoginController controller = Get.find();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: getDeviceType.getDevicetype(context) == 'computer'
                  ? Get.size.height * .1
                  : Get.size.height * .2,
            ),
            AutoSizeText('Login'.tr,
                maxFontSize: size.appBarTextSize,
                style: TextStyle(color: primaryColor)),
            SizedBox(
              height: getDeviceType.getDevicetype(context) == 'computer'
                  ? Get.size.height * .1
                  : Get.size.height * .2,
            ),
            Obx(
              () {
                return CostumTextField(
                  widthOnTheScreen: size.textFieldWidth,
                  onsaved: (value) {
                    controller.password = value!;
                  },
                  hint: 'enter your password'.tr,
                  label: "password".tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.changePasswordSecure();
                    },
                    icon: controller.passwordSecure.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  prefixIcon: const Icon(Icons.password),
                  sucer: controller.passwordSecure.value,
                  validat: (value) {
                    if (value!.length < 4) {
                      return "the password can't be smaller than 4 character "
                          .tr;
                    }
                    return null;
                  },
                );
              },
            ),
            SizedBox(
                height: getDeviceType.getDevicetype(context) == 'computer'
                    ? Get.size.height * .2
                    : Get.size.height * .25),
            Container(
              height: size.normalButtonHeight,
              width: size.normalButtonWidht,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.buttonRadius),
                  color: Get.isDarkMode ? darckPrimaryColor : primaryColor),
              child: TextButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Login'.tr,
                  maxFontSize: size.normalButtonTextSize,
                  stepGranularity: 1,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
