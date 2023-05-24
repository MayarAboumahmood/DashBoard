import 'package:dashboard/constant/font.dart';
import 'package:dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/sizes.dart';
import '../../constant/theme.dart';
import '../Screens/setting/setting_page.dart';

// ignore: must_be_immutable
class SlideDrawer extends StatelessWidget {
  SlideDrawer({super.key});
  SlideDrawerController controller = Get.put(SlideDrawerController());
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: controller.setWidth(65, 250),
        height: Get.size.height,
        child: Stack(
          children: [
            MouseRegion(
              onExit: (s) {
                controller.changeDrawerStateWhenHover();
              },
              onEnter: (s) {
                controller.changeDrawerStateWhenHover();
              },
              child: AnimatedContainer(
                color: Get.isDarkMode
                    ? backGroundDarkColor.withOpacity(0.2)
                    : skinColorWhite,
                duration: const Duration(milliseconds: 150),
                width: controller.setWidth(50, 240),
                height: Get.size.height,
                child: drawerChildren(context, size),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              top: 60,
              left: sharedPreferences!.getString('lang') == 'en'
                  ? controller.setWidth(33, 225)
                  : sharedPreferences!.getString('lang') == 'ar'
                      ? null
                      : controller.setWidth(33, 225),
              right: sharedPreferences!.getString('lang') == 'ar'
                  ? controller.setWidth(33, 225)
                  : null,
              child: InkWell(
                onTap: () {
                  controller.changeDrawerState();
                },
                child: Container(
                  height: Get.size.height * .04,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0.4, 0.9),
                            color: Get.isDarkMode
                                ? const Color.fromARGB(255, 24, 24, 24)
                                : Colors.black12,
                            spreadRadius: 1)
                      ],
                      color: Get.isDarkMode
                          ? backGroundDarkColor.withOpacity(0.1)
                          : skinColorWhite,
                      shape: BoxShape.circle),
                  child: Icon(
                    controller.isCliked.value
                        ? Icons.chevron_left
                        : Icons.chevron_right,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerChildren(BuildContext context, Sizes size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(children: [
        SizedBox(height: Get.size.height * .02),
        mainDrawerChid(context, size),
        Divider(),
        SizedBox(height: Get.size.height * .02),
        firstDrawerChid(context, size),
        SizedBox(height: Get.size.height * .02),
        secondDrawerChid(context),
      ]),
    );
  }

  Widget mainDrawerChid(BuildContext context, Sizes size) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
            width: 32,
            child: ClipOval(
                child: Image.asset('assets/images/The project icon.jpg'))),
      ),
      Visibility(
        replacement: const Text(''),
        visible: controller.isCliked.value || controller.isHover.value,
        child: Expanded(
          child: Text(
            'Dar abdallah',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontFamily: jostFontFamily),
          ),
        ),
      ),
    ]);
  }

  Widget firstDrawerChid(BuildContext context, Sizes size) {
    return MaterialButton(
      onPressed: () {},
      child: Row(children: [
        Icon(
          Icons.home,
          color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        ),
        Visibility(
          replacement: const Text(''),
          visible: controller.isCliked.value || controller.isHover.value,
          child: Expanded(
            child: Text(
              'Home',
              style: TextStyle(
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                  fontFamily: jostFontFamily),
            ),
          ),
        ),
      ]),
    );
  }

  Widget secondDrawerChid(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showSettingsDialog(context);
      },
      child: Row(children: [
        Icon(Icons.settings,
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor),
        Visibility(
          replacement: const Text(''),
          visible: controller.isCliked.value || controller.isHover.value,
          child: Expanded(
            child: Text(
              'Settings',
              style: TextStyle(
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                  fontFamily: jostFontFamily),
            ),
          ),
        ),
      ]),
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
}

class SlideDrawerController extends GetxController {
  RxBool isCliked = true.obs;
  RxBool isHover = false.obs;
  Function(bool)? changeDrawerState() {
    isCliked.value = !isCliked.value;
    return isCliked;
  }

  Function(bool)? changeDrawerStateWhenHover() {
    isHover.value = !isHover.value;
    return isHover;
  }

  double setWidth(double smallWidth, double bigWidth) {
    return isCliked.value && isHover.value
        ? bigWidth
        : !isCliked.value && isHover.value
            ? bigWidth
            : isCliked.value && !isHover.value
                ? bigWidth
                : smallWidth;
  }
}
