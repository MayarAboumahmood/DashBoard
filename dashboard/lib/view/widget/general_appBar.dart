import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/setting/setting_page.dart';
import 'package:dashboard/view/widget/costum_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


   AppBar createAppBar(
      Sizes size, BuildContext context, GetDeviceType getDeviceType,String appBarTitle) {
    return AppBar(
      actions: [
        searchField(size, getDeviceType, context),
        SizedBox(
          width: Get.size.width * .01,
        ),
        IconButton(
          onPressed: () {
            showSettingsDialog(
              context,
            );
          },
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ],
      title: Text(
        appBarTitle.tr,

        /// nees to add for translate
        style: TextStyle(
            // color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            fontSize: size.appBarTextSize / 2,
            fontFamily: jostFontFamily,
            fontWeight: FontWeight.w100),
      ),
    );
  }

  Widget searchField(
      Sizes size, GetDeviceType getDeviceType, BuildContext context) {
    return Visibility(
      visible:
          getDeviceType.getDevicetype(context) == 'computer' ? true : false,
      replacement: IconButton(
        icon: Icon(
          Icons.search,
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        ),
        onPressed: () {}, //take us to the search page.
      ),
      child: SizedBox(
        height: Get.size.height * .01,
        width: Get.size.width * .2,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CostumTextField(
              labelStyle: TextStyle(
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              widthOnTheScreen: size.textFieldWidth,
              onsaved: (value) {},
              hint: 'Search'.tr,
              hintStyle: TextStyle(
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              prefixIcon: const Icon(
                Icons.search,
                // color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              ),
              sucer: false,
            )),
      ),
    );
  }

  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Setting(),
        );
      },
    );
  }

