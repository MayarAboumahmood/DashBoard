import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget artisCardView(String artisName) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 54, 54, 54)
            : Colors.grey[400],
        border: Border.all(
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor)),
    child: Text(
      artisName,
      maxLines: 1,
      style: generalTextStyle(20),
    ),
  );
}
