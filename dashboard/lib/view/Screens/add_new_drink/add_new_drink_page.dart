import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/Screens/add_new_drink/add_new_drink_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';

// ignore: must_be_immutable
class AddNewDrink extends StatelessWidget {
  AddNewDrink({super.key});
  AddNewDrinkController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
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
              'Enter the new drink information'.tr,
              icon: Icon(
                Icons.no_drinks,
                color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              ),
            ),
            const SizedBox(height: 40),
            generalInputTextFeild(size, Icons.no_drinks, 'Drink name'.tr,
                (value) {}, TextInputType.name, (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      }),
            generalInputTextFeild(size, Icons.money, 'unit price'.tr,
                (value) {}, TextInputType.number, (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      }),
            generalInputTextFeild(size, Icons.money, 'total cost'.tr,
                (value) {}, TextInputType.number, (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      }),
            generalInputTextFeild(size, Icons.bubble_chart_rounded,
                'Avilable amount'.tr, (value) {}, TextInputType.number, (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      }),
            generalInputTextFeild(size, Icons.info, 'description'.tr,
                (value) {}, TextInputType.text, (value) {
        if (value!.length < 12) {
          return "The email is not valid".tr;
        }
        return null;
      }),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                controller.pickImage();
              },
              child: Text(
                'Select the drink image'.tr,
                style: generalTextStyle(null),
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => controller.webImageExcist.value
                  ? SizedBox(
                      width: 200,
                      height: 200,
                      child: GetPlatform.isWeb
                          ? Image.memory(
                              controller.webImage,
                              fit: BoxFit.contain,
                            )
                          : Image.file(
                              File(controller.selectedImage.value),
                              fit: BoxFit.contain,
                            ))
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 15,
            ),
            HoverButton(
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              ontap: () {},
              mywidth: size.normalButtonWidht,
              myheight: size.normalButtonHeight,
              myShadow: 0,
              child: AutoSizeText(
                'Done'.tr,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: size.normalButtonTextSize,
                    fontFamily: jostFontFamily,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            )
          ],
        ),
      ),
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
          child: Text('Add new drink'.tr,
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
