import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/font.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/hoverButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/sizes.dart';
import '../../widget/splash_item.dart';
import '../setting/setting_page.dart';
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
                  myRadius: size.buttonRadius,
                  mycolor: primaryColor,
                  ontap: () {
                    showSettingsDialog(context);
                  },
                  mywidth: size.normalButtonWidht,
                  myheight: size.normalButtonHeight,
                  child: Text(
                    'go to setting',
                    style: TextStyle(
                        color: Get.isDarkMode
                            ? skinColorWhite
                            : backGroundDarkColor,
                        fontSize: size.normalButtonTextSize,
                        fontFamily: 'Jost'),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * .06,
                ),
                HoverButton(
                  myRadius: 5,
                  mywidth: size.normalButtonWidht,
                  myheight: size.normalButtonHeight,
                  mycolor: primaryColor,
                  ontap: () {
                    Get.toNamed('/LoginPage');
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: size.cardNormalTextSize,
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





















// import 'package:dashboard/constant/theme.dart';
// import 'package:dashboard/view/widget/dialog.dart';
// import 'package:dashboard/view/widget/hoverButton.dart';
// import 'package:dashboard/view/widget/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:sized_context/sized_context.dart';

// import '../../../constant/sizes.dart';
// import '../setting/setting_page.dart';

// class Landing extends StatelessWidget {
//   const Landing({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Sizes size = Sizes(context);
//     return Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               MyButton(
//                   myRadius: size.buttonRadius,
//                   mycolor: primaryColor,
//                   ontap: () {
//                     showSettingsDialog(context);
//                   },
//                   mywidth: size.normalButtonWidht,
//                   myheight: size.normalButtonHeight,
//                   child: Text(
//                     'go to setting',
//                     style: TextStyle(
//                         fontSize: size.normalButtonTextSize,
//                         fontFamily: 'Jost'),
//                   )),
//               SizedBox(
//                 height: Get.size.height * .1,
//               ),
//               MyButton(
//                   myRadius: size.buttonRadius,
//                   mycolor: primaryColor,
//                   ontap: () {
//                     Get.toNamed("/LoginPage");
//                   },
//                   mywidth: size.normalButtonWidht,
//                   myheight: size.normalButtonHeight,
//                   child: Text(
//                     'go to login',
//                     style: TextStyle(
//                         fontSize: size.normalButtonTextSize,
//                         fontFamily: 'Jost'),
//                   )),
//               SizedBox(
//                 height: Get.size.height * .1,
//               ),
//               HoverButton(
//                   mycolor: primaryColor,
//                   ontap: () {
//                     showErrorDialog(context);
//                   },
//                   mywidth: size.normalButtonWidht,
//                   myheight: size.normalButtonHeight,
//                   child: const Text('show dialog'))
//             ]),
//       ),
//     );
//   }

//   void showSettingsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           clipBehavior: Clip.antiAlias,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           child: Setting(),
//         );
//       },
//     );
//   }

//   void showErrorDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return MyDialogWidget(
//           errorMessage: 'errorMessage',
//           title: 'title',
//           firstButtonText: 'hello',
//           secondButtonText: 'bayyy',
//         );
//       },
//     );
//   }
// }
