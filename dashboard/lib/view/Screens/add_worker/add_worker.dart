import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/costum_text_field.dart';
import '../../widget/hoverButton.dart';

class AddWorker extends StatelessWidget {
  const AddWorker({super.key});

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
              'Enter new worker information'.tr,
              // icon: Icon(
              //   Icons.language,
              //   color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              // ),
            ),
            SizedBox(
              height: Get.size.height * .01,
              width: Get.size.width * .2,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CostumTextField(
                    labelStyle: TextStyle(
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    widthOnTheScreen: size.textFieldWidth,
                    onsaved: (value) {},
                    hint: 'name'.tr,
                    hintStyle: TextStyle(
                        fontFamily: jostFontFamily,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                    ),
                    sucer: false,
                  )),
            ),
            SizedBox(
              height: Get.size.height * .01,
              width: Get.size.width * .2,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CostumTextField(
                    labelStyle: TextStyle(
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    widthOnTheScreen: size.textFieldWidth,
                    onsaved: (value) {},
                    hint: 'age'.tr,
                    hintStyle: TextStyle(
                        fontFamily: jostFontFamily,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                    ),
                    sucer: false,
                  )),
            ),
            SizedBox(
              height: Get.size.height * .01,
              width: Get.size.width * .2,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CostumTextField(
                    labelStyle: TextStyle(
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    widthOnTheScreen: size.textFieldWidth,
                    onsaved: (value) {},
                    hint: 'detials'.tr,
                    hintStyle: TextStyle(
                        fontFamily: jostFontFamily,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                    prefixIcon: const Icon(
                      Icons.search,
                      // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                    ),
                    sucer: false,
                  )),
            ),
            HoverButton(
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              ontap: () {
                // Get.toNamed("/Home");
                // controller.onpresslogin();
              },
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
          child: Text('Add new worker'.tr,
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
