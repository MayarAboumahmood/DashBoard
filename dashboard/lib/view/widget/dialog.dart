// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/widget/hover_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/font.dart';
import '../../constant/sizes.dart';
import '../../constant/theme.dart';

// ignore: must_be_immutable
class MyDialogWidget extends StatelessWidget {
  late String errorMessage;
  late String title;
  late String? firstButtonText;
  late String? secondButtonText;
  late Function()? firstOnPress;
  late Function()? secondOnPress;

  MyDialogWidget({
    Key? key,
    required this.errorMessage,
    required this.title,
    this.firstButtonText = '',
    this.secondButtonText = '',
    this.firstOnPress,
    this.secondOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return AlertDialog(
      backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: jostFontFamily,
            fontSize: size.normalButtonTextSize,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      ),
      content: AutoSizeText(
        errorMessage,
        style: TextStyle(
            fontFamily: jostFontFamily,
            fontSize: size.normalButtonTextSize,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .1),
          child: firstButton(size),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .1),
          child: secondButton(size),
        ),
      ],
    );
  }

  Visibility firstButton(Sizes size) {
    return Visibility(
      visible: firstButtonText == null ? false : true,
      child: HoverButton(
          mycolor: Get.isDarkMode ? Colors.teal[800]! : Colors.teal[400],
          myheight: size.cardButtonHeight,
          mywidth: size.cardButtonWidth,
          ontap: secondOnPress,
          child: AutoSizeText(
            firstButtonText!,
            style: TextStyle(
                fontFamily: jostFontFamily,
                fontSize: size.normalButtonTextSize,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          )),
    );
  }

  Visibility secondButton(Sizes size) {
    return Visibility(
      visible: secondButtonText == null ? false : true,
      child: HoverButton(
          mycolor: Get.isDarkMode ? Colors.teal[800]! : Colors.teal[400],
          myheight: size.cardButtonHeight,
          mywidth: size.cardButtonWidth,
          ontap: secondOnPress,
          child: Text(
            secondButtonText!,
            style: TextStyle(
                fontFamily: jostFontFamily,
                fontSize: size.normalButtonTextSize,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          )),
    );
  }
}
