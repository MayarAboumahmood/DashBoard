// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/sizes.dart';
import '../../data/Models/all_actions_model.dart';
import 'general_text_style.dart';

Widget adminActionCard(Sizes size, BuildContext context,AllActionsModel model) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
      height: 70,
      decoration: BoxDecoration(
        border:
            Border.all(color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
        borderRadius: BorderRadius.circular(size.buttonRadius),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 54, 54, 54)
            : Colors.grey[400],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.action.tr,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
            ),
            dividerWithWord('information'.tr),
            Text('-${model.time}', style: generalTextStyle(18)),
            Text('-${model.details}', style: generalTextStyle(18)),
          ],
        ),
      ),
    ),
  );
}
