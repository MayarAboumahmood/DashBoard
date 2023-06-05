import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/status_request.dart';
import 'package:dashboard/view/Screens/add_admin/add_admin_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/costum_text_field.dart';
import '../../widget/hover_button.dart';
import '../../widget/no_internet_page.dart';

// ignore: must_be_immutable
class AddAdmin extends StatelessWidget {
  AddAdmin({super.key});
  AddAdminController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return GetBuilder<AddAdminController>(
      builder: (ctx) => controller.statuseRequest ==
              StatuseRequest.offlinefailure
          ? noInternetPage(size, controller)
          : Form(
              key: controller.formstate,
              child: Container(
                height: Get.size.height * .9,
                width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
                color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      createAppBar(size),
                      SizedBox(
                        height: sharedPreferences!.getString('lang') == 'en'
                            ? Get.size.height * .02
                            : Get.size.height * .01,
                      ),
                      dividerWithWord(
                        'Enter new admin information'.tr, // add to translate
                        icon: Icon(
                          Icons.person,
                          color:
                              Get.isDarkMode ? darkPrimaryColor : primaryColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      generalInputTextFeild(
                        size,
                        Icons.person,
                        'name',
                        (value) {
                          controller.name = value!;
                        },
                        TextInputType.name,
                        (value) {
                          if (value!.length < 2) {
                            return "your name is shourtest than should be".tr;
                          }
                          return null;
                        },
                      ),
                      emailTextFeild(size),
                      const SizedBox(
                        height: 30,
                      ),
                      HoverButton(
                        mycolor:
                            Get.isDarkMode ? darkPrimaryColor : primaryColor,
                        myRadius: size.buttonRadius,
                        ontap: () {
                          controller.onPressDone();
                        },
                        mywidth: size.normalButtonWidht,
                        myheight: size.normalButtonHeight,
                        myShadow: 0,
                        child:
                            controller.statuseRequest == StatuseRequest.loading
                                ? Container(
                                    padding: const EdgeInsets.all(2),
                                    child: CircularProgressIndicator(
                                      color: Get.isDarkMode
                                          ? skinColorWhite
                                          : backGroundDarkColor,
                                    ),
                                  )
                                : AutoSizeText(
                                    'Done'.tr,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: size.normalButtonTextSize,
                                        fontFamily: jostFontFamily,
                                        color: Get.isDarkMode
                                            ? skinColorWhite
                                            : backGroundDarkColor),
                                  ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (!emailValid) {
          return (("The inpout isn't an eamil").tr);

          ///add for translate
        }
        return null;
      },
    );
  }

  Row createAppBar(Sizes size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.size.width * .01,
              vertical: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.width * .01
                  : 0),
          child: Text('Add new admin'.tr, // add to translate
              style: TextStyle(
                fontFamily: jostFontFamily,
                fontSize: 35,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                size: 35,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
        ),
      ],
    );
  }
}
