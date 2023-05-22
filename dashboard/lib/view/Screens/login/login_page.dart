import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/login/login_controller.dart';
import 'package:dashboard/view/widget/no_internet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../widget/costum_text_field.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../widget/hoverButton.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  GetDeviceType getDeviceType = GetDeviceType();
  LoginController controller = Get.find();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        body: bodyAllStatuse(context));
  }

  /// need to correct indicator in done button in line 236
  /// correct design when no internet statuse in line 35
  ///
  Widget bodyAllStatuse(BuildContext context) {
    Sizes size = Sizes(context);

    return GetBuilder<LoginController>(
      builder: (controller) {
        if (controller.statuseRequest == StatuseRequest.offlinefailure) {
          return noInternetPage(size, controller);
        } else {
          return bodyWithLoginElements(size, context);
        }
      },
    );
  }

  Widget bodyWithLoginElements(Sizes size, BuildContext context) {
    return Form(
      key: controller.formstate,
      child: Stack(
        children: [
          putBackgroundImage(context),
          Positioned(
            top: Get.size.height * .1,
            left: checkIfTheSizeAllowTheFloatingContainerToExist(context)
                ? Get.size.width * .5
                : Get.size.width * .3,
            child: Center(
              child: Visibility(
                visible:
                    checkIfTheSizeAllowTheFloatingContainerToExist(context),
                replacement: theLoginColumnBody(size),
                child: Container(
                  width: Get.size.width * .4,
                  height: Get.size.height * .8,
                  decoration: floatingContainerBoxDecoration(),
                  child: theLoginColumnBody(size),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkIfTheSizeAllowTheFloatingContainerToExist(BuildContext context) {
    if (context.widthInches > 7.5) {
      return true;
    }
    return false;
  }

  Widget putBackgroundImage(BuildContext context) {
    return Positioned(
      top: -Get.size.height * .03,
      left: -Get.size.width * .025,
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          fit: BoxFit.fill,
          'assets/images/medium page background image.jpg',
          width: Get.size.width,
          height: Get.height + Get.height * .1,
        ),
      ),
    );
  }

  Widget passwordTextFeild(Sizes size) {
    return Obx(
      () {
        return CostumTextField(
          labelStyle: TextStyle(
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          widthOnTheScreen: size.textFieldWidth,
          onsaved: (value) {
            controller.password = value!;
          },
          hint: 'enter your password'.tr,
          hintStyle: TextStyle(
              fontFamily: jostFontFamily,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          label: "password".tr,
          suffixIcon: IconButton(
            onPressed: () {
              controller.changePasswordSecure();
            },
            icon: controller.passwordSecure.value
                ? const Icon(
                    Icons.visibility_off,
                    // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                  )
                : Icon(Icons.visibility,
                    color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
          ),
          prefixIcon: Icon(Icons.password,
              color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
          sucer: controller.passwordSecure.value,
          validat: (value) {
            if (value!.length < 4) {
              return "the password can't be smaller than 4 character ".tr;
            }
            return null;
          },
        );
      },
    );
  }

  Widget emailTextFeild(Sizes size) {
    return CostumTextField(
      labelStyle: TextStyle(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      widthOnTheScreen: size.textFieldWidth,
      onsaved: (value) {
        controller.email = value!;
      },
      hint: 'enter your email'.tr,
      hintStyle: TextStyle(
          fontFamily: jostFontFamily,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      label: "email".tr,
      prefixIcon: const Icon(
        Icons.email,
        // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      ),
      sucer: false,
      validat: (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      },
    );
  }

  BoxDecoration floatingContainerBoxDecoration() {
    return BoxDecoration(
        color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: Get.isDarkMode
            ? null
            : const [
                BoxShadow(
                    offset: Offset(-2, -1),
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 15),
                BoxShadow(
                    offset: Offset(6, 5),
                    color: Colors.black26,
                    spreadRadius: 01,
                    blurRadius: 15),
                BoxShadow(
                    offset: Offset(-2, 5),
                    color: Colors.black26,
                    spreadRadius: 01,
                    blurRadius: 15),
                BoxShadow(
                    offset: Offset(6, -1),
                    color: Colors.black26,
                    spreadRadius: 01,
                    blurRadius: 15),
              ]);
  }

  HoverButton theDoneButton(Sizes size) {
    return HoverButton(
      mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      myRadius: size.buttonRadius,
      ontap: () {
        Get.toNamed("/Home");
        controller.onpresslogin();
      },
      mywidth: size.normalButtonWidht,
      myheight: size.normalButtonHeight,
      myShadow: 0,
      child: controller.statuseRequest == StatuseRequest.loading
          ? Container(
              padding: const EdgeInsets.all(2),
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              ),
            )
          : AutoSizeText(
              'Done'.tr,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: size.normalButtonTextSize,
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
            ),
    );
  }

  SingleChildScrollView theLoginColumnBody(Sizes size) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: Get.size.height * .1,
        ),
        AutoSizeText('Login'.tr,
            style: TextStyle(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: size.appBarTextSize,
                fontFamily: jostFontFamily,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: Get.size.height * .04,
        ),
        emailTextFeild(size),
        SizedBox(height: Get.size.height * .1),
        passwordTextFeild(size),
        SizedBox(height: Get.size.height * .1),
        theDoneButton(size),
        SizedBox(
          height: Get.size.height * .1,
        )
      ]),
    );
  }
}
