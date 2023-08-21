import 'package:dashboard/constant/sizes.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/setting/setting_page.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

AppBar createAppBar(Sizes size, BuildContext context,
    GetDeviceType getDeviceType, String appBarTitle) {
  return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: sharedPreferences!.getString('lang') == 'en'
                  ? Alignment.topLeft
                  : sharedPreferences!.getString('lang') == 'ar'
                      ? Alignment.bottomRight
                      : Alignment.topLeft,
              end: sharedPreferences!.getString('lang') == 'en'
                  ? Alignment.bottomRight
                  : sharedPreferences!.getString('lang') == 'ar'
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
              colors: [
                Get.isDarkMode ? darkPrimaryColor : primaryColor,
                Get.isDarkMode ? darkPrimaryColor : primaryColor,
                Get.isDarkMode
                    ? backGroundDarkColor.withOpacity(0.2)
                    : skinColorWhite!,
                Get.isDarkMode
                    ? backGroundDarkColor.withOpacity(0.2)
                    : skinColorWhite!,
                Get.isDarkMode
                    ? backGroundDarkColor.withOpacity(0.2)
                    : skinColorWhite!,
                Get.isDarkMode
                    ? backGroundDarkColor.withOpacity(0.2)
                    : skinColorWhite!,
              ]),
        ),
      ),
      actions: [
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
      title: AnimationAppBar(
        title: appBarTitle,
      ));
}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Setting(),
      );
    },
  );
}

// ignore: must_be_immutable
class AnimationAppBar extends StatelessWidget {
  late AnimationController aController;
  late Animation<double> animationForA;
  String title;
  AnimationAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  double theNumber = 1;
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return TweenAnimationBuilder(
      builder: (BuildContext context, double theValForTheTween, child) {
        return Opacity(
          opacity: theValForTheTween,
          child: Padding(
            padding: EdgeInsets.only(top: theValForTheTween * 20, bottom: 20),
            child: child,
          ),
        );
      },
      tween: Tween<double>(begin: 0, end: theNumber),
      duration: const Duration(seconds: 1),
      child: Text(
        title,
        style: generalTextStyle(size.appBarTextSize / 2),
      ),
      onEnd: () {
        theNumber == 1 ? 0 : 1;
      },
    );
  }
}
