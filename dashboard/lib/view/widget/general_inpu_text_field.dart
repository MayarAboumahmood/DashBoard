import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'costum_text_field.dart';

Widget generalInputTextFeild(Sizes size, IconData icon, String hintText,
    Function(String?)? onsaved, TextInputType? inputtype,String?Function(String?)? validat,{String?inialValue} ) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: CostumTextField(
      inialValue: inialValue,
      validat: validat,
      inputtype: inputtype,
      label: hintText,
      labelStyle: TextStyle(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      widthOnTheScreen: size.textFieldWidth,
      onsaved: onsaved,
      hint: hintText.tr,
      hintStyle: TextStyle(
          fontFamily: jostFontFamily,
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      prefixIcon: Icon(
        icon,
        color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      ),
      sucer: false,
    ),
  );
}
