import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/setting/setting_controller.dart';
import 'package:dashboard/view/Screens/setting/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';
import '../../../constant/sizes.dart';
import '../../../main.dart';
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
    return Container(
        height: Get.size.height * .9,
        width: context.widthInches > 5.5 ? 400 : Get.size.width * .85,
        color: Get.isDarkMode ? Colors.black54 : skinColorWhite,
        child: SingleChildScrollView(
          child: Column(children: [
            createAppBar(size),
            SizedBox(
              height: sharedPreferences!.getString('lang') == 'en'
                  ? Get.size.height * .03
                  : Get.size.height * .01,
            ),
            dividerWithWord('Choose language'.tr,
                icon: Icon(
                  Icons.language,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                )),
            changeLangugeContianer(size),
            dividerWithWord('Choose theme'.tr),
            changingThemeRow(size),
            dividerWithWord('more setting'.tr),
            contactUs(size),
          ]),
        ));
  }

  Widget iconBox(Widget child, Sizes size) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * .01, vertical: Get.size.width * .01),
      decoration: BoxDecoration(
        border: Border.all(
            color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor,
            width: 0.5),
        borderRadius: BorderRadius.circular(size.buttonRadius),
        color: Get.isDarkMode ? Colors.black87 : Colors.grey[200],
      ),
      child: child,
    );
  }

  Widget contactUs(Sizes size) {
    return Container(
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
        children: [
          iconBox(
              Icon(Icons.message_rounded,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              size),
          SizedBox(
            width: Get.size.width * .04,
          ),
          Text('contact us',
              style: TextStyle(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: size.normalButtonTextSize,
              )),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded,
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
          SizedBox(
            width: Get.size.width * .02,
          ),
        ],
      ),
    );
  }

  Widget circleButtonWithDotInside(Sizes size, String language) {
    return Row(
      children: [
        Text(
          language.tr,
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
            value:
                language, //when the value and the groupValue is the same than this radio is chosen
            groupValue: settingController.languag.value ==
                    sharedPreferences!.getString("lang ui")
                ? settingController.languag.value
                : 'العربية',
            onChanged: (value) {
              settingController.changeLanguageUI(value);
              language == "English"
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
        SizedBox(width: Get.size.width * .01),

        const Expanded(flex: 1, child: Divider()),
        SizedBox(width: Get.size.width * .01),
        icon ?? const SizedBox(),
        Text(
          word,
          style: TextStyle(
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
                  ? Get.size.width * .02
                  : 0),
          child: Text('Setting'.tr,
              style: TextStyle(
                fontSize: size
                    .appBarTextSize, //try to see what is going on with this number
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
                size: size.appBarIconSize,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              )),
        ),
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
            // SizedBox(width: Get.size.width*.1,),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.size.width * .02,
              ),
              child: GetX<ThemeController>(builder: (themeController) {
                return GestureDetector(
                    onTap: () {
                      themeController.changeTheme();
                    },
                    child: iconBox(
                        Icon(
                            themeController.theThemeIsDark.value
                                ? Icons.nightlight_round
                                : Icons.wb_sunny,
                            color: themeController.theThemeIsDark.value
                                ? skinColorWhite
                                : const Color.fromARGB(255, 209, 164, 29)),
                        size));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
