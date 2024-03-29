import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/view/Screens/add_artist/add_artist_controller.dart';
import 'package:dashboard/view/widget/divider_with_word.dart';
import 'package:dashboard/view/widget/general_inpu_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../main.dart';
import '../../widget/hover_button.dart';

// ignore: must_be_immutable
class AddArtist extends StatelessWidget {
  AddArtist({super.key});
  AddArtistController controller = Get.put(AddArtistController());
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Form(
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
                'Enter new artist information'.tr,
                icon: Icon(
                  Icons.person,
                  color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                ),
              ),
              const SizedBox(height: 40),
              generalInputTextFeild(
                  size,
                  Icons.person,
                  'Enter artist name'.tr,
                  'Name'.tr,
                  (value) {
                    controller.name = value!;
                  },
                  TextInputType.name,
                  (value) {
                    if (value!.length < 2) {
                      return "The name is shourt".tr;
                    }
                    return null;
                  }),
              generalInputTextFeild(
                  size,
                  Icons.info,
                  'Enter artist info'.tr,
                  'information'.tr,
                  (value) {
                    controller.information = value!;
                  },
                  TextInputType.text,
                  (value) {
                    if (value!.length < 10) {
                      return "Please inter more information".tr;
                    }
                    return null;
                  }),
              const SizedBox(
                height: 50,
              ),
              HoverButton(
                mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
                myRadius: size.buttonRadius,
                ontap: () async {
                  await controller.onPressDone();
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
                      color: Get.isDarkMode
                          ? skinColorWhite
                          : backGroundDarkColor),
                ),
              )
            ],
          ),
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
          child: AutoSizeText('Add new artist'.tr,
              presetFontSizes: const [28, 35, 25, 23],
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
