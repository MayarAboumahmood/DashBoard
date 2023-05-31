import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/hover_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/sizes.dart';
import '../../widget/splash_item.dart';
import 'landing_controller.dart';

// ignore: must_be_immutable
class Landing extends StatelessWidget {
  OnBoardContoller controller = Get.put(OnBoardContoller());
  Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? backGroundDarkColor
          : skinColorWhite, //Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.size.height * .05,
              ),
              AutoSizeText(
                "dar abdallah management system".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: jostFontFamily,
                    fontSize: size.appBarTextSize,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode
                        ? Themes.customdarktheme.primaryColor
                        : Themes.customlighttheme.primaryColor),
              ),
              SizedBox(
                height: Get.size.height * .05,
              ),
              SizedBox(
                height: Get.size.height * .6,
                child: PageView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                    controller:
                        PageController(initialPage: controller.pageindex.value),
                    onPageChanged: (index) {
                      controller.pageindex(index);
                    },
                    itemCount: controller.pagedetals.length,
                    itemBuilder: (context, i) {
                      return SplashItem(
                          title: "${controller.pagedetals[i]['title']}",
                          image: "${controller.pagedetals[i]['image']}");
                    }),
              ),
              Column(children: [
                SizedBox(
                  height: Get.size.height * .02,
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        controller.pagedetals.length,
                        (index) => buildDot(
                            index: index,
                            currentindex: controller.pageindex.value)),
                  );
                }),
                SizedBox(
                  height: Get.size.height * .06,
                ),
                HoverButton(
                  myRadius: 5,
                  mywidth: size
                      .wideNormalButtonWidth, //  context.widthInches > 5 ? 300 : Get.size.width * .85,
                  myheight: size.normalButtonHeight,
                  mycolor: primaryColor,
                  ontap: () {
                   controller.onpress();
                   },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: size.wideNormalButtonTextSize, //20  ,
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor),
                  ),
                ),
              ]),
              SizedBox(
                height: Get.size.height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AnimatedContainer buildDot({required int index, required int currentindex}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.all(5),
    height: 6,
    width: index == currentindex ? 20 : 6,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: index == currentindex
            ? Get.isDarkMode
                ? darkPrimaryColor
                : primaryColor
            : const Color(0xFFD8D8D8)),
  );
}

class AppScrollBehavior extends MaterialScrollBehavior {
  //this class to apply the scroll in web.
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
