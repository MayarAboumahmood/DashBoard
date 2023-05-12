import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/Screens/setting/theme_controller.dart';
import 'package:dashboard/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/sizes.dart';
import 'language_controller.dart';
import '../../widget/my_text_field.dart';

// ignore: must_be_immutable
class Setting extends StatelessWidget {
  LanguageController languageController = Get.find();
  ThemeController themeController = Get.find();
  Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);

    return Scaffold(
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('test'),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text('what the fuck is that'.tr,
            style: TextStyle(fontSize: size.appBarTextSize)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Get.size.width * .03),
            child: Icon(Icons.favorite, size: size.appBarIconSize),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                // decoration: BoxDecoration(
                // color: primaryColor,
                // borderRadius: BorderRadius.circular(size.buttonRadius),
                // ),
                height: size.drinkCardHeight + 15,
                width: size.drinkCardWidth,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(size.buttonRadius),
                      ),
                      height: size.eventCardHeight,
                      width: size.eventCardWidth,
                    ),
                    Positioned(
                      top: Get.size.height * .05,
                      left: Get.size.width * .01,
                      child: TextButton(
                        onPressed: () {
                          languageController.changeLanguage('ar');
                        },
                        child: Text(
                          'to arabic',
                          style: TextStyle(fontSize: size.cardTitleTextSize),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.size.height * .1,
                      left: Get.size.width * .1,
                      child: Text('to arabic',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.cardNormalTextSize,
                              fontWeight: FontWeight.w100)),
                    ),
                    Positioned(
                      top: Get.size.height * .3,
                      left: Get.size.width * .1,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.circular(size.buttonRadius)),
                          height: size.cardButtonHeight,
                          width: size.cardButtonWidth,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'press me',
                                style: TextStyle(
                                    fontSize: size.cardButtonTextSize),
                              ))),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
            Container(
              color: primaryColor,
              height: size.normalButtonHeight,
              width: size.normalButtonWidht,
              child: TextButton(
                onPressed: () {
                  languageController.changeLanguage('en');
                },
                child: const Text('to english'),
              ),
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            MyTextField(
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Colors.red,
              // enableColor: Colors.green,
              hintText: 'hintText',
              labletext: 'what the fuck is that ',
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            MyButton(
              ontap: () {
                Get.toNamed('/LoginPage');
              },
              myheight: size.bigButtonHeight,
              mywidth: size.bigButtonWidht,
              myRadius: size.buttonRadius,
              mycolor: Colors.red,
              child: Text(
                'big button',
                style: TextStyle(fontSize: size.bigButtonTextSize),
              ),
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            GetX<ThemeController>(
              builder: (themeController) {
                return MyButton(
                  ontap: () {
                    themeController.changeTheme();
                  },
                  myheight: size.normalButtonHeight,
                  mywidth: size.normalButtonWidht,
                  myRadius: size.buttonRadius,
                  mycolor: Colors.red,
                  child: Text(
                    themeController.theThemeIsDark.value
                        ? 'Dark Theme'
                        : 'Light Theme',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.normalButtonTextSize),
                  ),
                );
              },
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
          ],
        ),
      ),
    );
  }
}
