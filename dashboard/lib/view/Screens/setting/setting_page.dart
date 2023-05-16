import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/setting/setting_controller.dart';
import 'package:dashboard/view/Screens/setting/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/sizes.dart';
import 'language_controller.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  LanguageController languageController = Get.find();
  ThemeController themeController = Get.find();
  SettingController settingController = Get.find();
  Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
        backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              createAppBar(size),
              SizedBox(
                height: Get.size.height * .05,
              ),
              dividerWithWord('Choose language'.tr,
                  icon: Icon(
                    Icons.language,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                  )),
              changeLangugeContianer(size),
              dividerWithWord('Choose theme'.tr),
              changingThemeRow(size),
              dividerWithWord('more setting'.tr),
            ]),
          ),
        ));
  }

  Widget circleButtonWithDotInside(Sizes size, String languge) {
    return Row(
      children: [
        Text(
          languge.tr,
          style: TextStyle(
              fontSize: size.normalButtonTextSize,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
        ),
        Obx(
          () => Radio<String>(
            focusColor:
                Get.isDarkMode ? darkHoverButtonColor : lightHoverButtonColor,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Get.isDarkMode ? darkPrimaryColor : primaryColor;
              }
              return Get.isDarkMode ? darkPrimaryColor : primaryColor;
            }),
            value: languge,
            groupValue: settingController.languag.value,
            onChanged: (value) {
              settingController.changeLanguageUI(value);
              languge == "English"
                  ? languageController.changeLanguage("en")
                  : languageController.changeLanguage("ar");
            },
          ),
        )
      ],
    );
  }

  Widget dividerWithWord(String word, {Icon? icon}) {
    return Row(
      children: [
        const Expanded(flex: 1, child: Divider()),
        icon ?? const SizedBox(),
        Text(
          word,
          style: TextStyle(
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
        ), //translate it.
        const Expanded(flex: 3, child: Divider()),
      ],
    );
  }

  Row createAppBar(Sizes size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
          child: Text('Setting'.tr,
              style: TextStyle(
                fontSize: size.appBarTextSize,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.size.width * .01),
          child: Icon(
            Icons.close,
            size: size.appBarIconSize,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
          ),
        )
      ],
    );
  }

  Container changeLangugeContianer(Sizes size) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * .02, vertical: Get.size.height * .02),
      margin: EdgeInsets.symmetric(
          horizontal: Get.size.width * .02, vertical: Get.size.height * .02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.buttonRadius),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 54, 54, 54)
              : Colors.grey[400]),
      child: Column(
        children: [
          circleButtonWithDotInside(size, "English"),
          SizedBox(height: Get.size.height * .005),
          circleButtonWithDotInside(size, "العربية"),
        ],
      ),
    );
  }

  Widget changingThemeRow(Sizes size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.size.height * .02),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Get.size.width * .02, vertical: Get.size.height * .02),
        margin: EdgeInsets.symmetric(
            horizontal: Get.size.width * .02, vertical: Get.size.height * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.buttonRadius),
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 54, 54, 54)
              : Colors.grey[400],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.size.width * .02,
              ),
              child: Text(
                'change the theme'.tr,
                style: TextStyle(
                    fontSize: size.normalButtonTextSize,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.size.width * .02,
              ),
              child: GetX<ThemeController>(builder: (themeController) {
                return GestureDetector(
                  onTap: () {
                    themeController.changeTheme();
                  },
                  child: Icon(
                      themeController.theThemeIsDark.value
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: themeController.theThemeIsDark.value
                          ? skinColorWhite
                          : const Color.fromARGB(255, 209, 164, 29)),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
