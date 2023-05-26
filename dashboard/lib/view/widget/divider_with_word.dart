import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dividerWithWord(String word, {Icon? icon}) {
    return Row(
      children: [
        SizedBox(width: Get.size.width * .01),

        const Expanded(flex: 1, child: Divider()),
        SizedBox(width: Get.size.width * .01),
        icon ?? const SizedBox(),
        Text(
          word,
          style: TextStyle(
              fontFamily: jostFontFamily,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
        ), //translate it.
        SizedBox(width: Get.size.width * .01),
        const Expanded(flex: 3, child: Divider()),
        SizedBox(width: Get.size.width * .01),
      ],
    );
  }
