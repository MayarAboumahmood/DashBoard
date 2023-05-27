import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle generalTextStyle(double? size) {
  return TextStyle(
      fontFamily: jostFontFamily,
      color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
      fontSize: size);
}
