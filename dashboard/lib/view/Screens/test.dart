import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/general_controller/theme_controller.dart';
import 'package:dashboard/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/sizes.dart';
import '../../general_controller/language_controller.dart';
import '../widget/my_text_field.dart';

class Test extends StatelessWidget {
  LanguageController languageController = Get.find();
  ThemeController themeController = Get.put(ThemeController());
  Test({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text('test'),
      //   onPressed: () {},
      // ),
      appBar: AppBar(
        title: Text('what the fuck is that'.tr,
            style: TextStyle(fontSize: size.appBarTextSize)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(size.buttonRadius),
                ),
                height: size.drinkCardHeight,
                width: size.drinkCardWidth,
                child: TextButton(
                  onPressed: () {
                    languageController.changeLanguage('ar');
                  },
                  child: const Text('to arabic'),
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
              title: 'title',
              ontap: () {
                Get.toNamed('/LoginPage');
              },
              myheight: size.normalButtonHeight,
              mywidth: size.normalButtonWidht,
              myRadius: size.buttonRadius,
              mycolor: Colors.red,
              myfontSize: size.bigButtonTextSize,
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            MyButton(
              title: 'change the theme',
              ontap: () {
                themeController.changeTheme();
              },
              myheight: size.normalButtonHeight,
              mywidth: size.normalButtonWidht,
              myRadius: size.buttonRadius,
              mycolor: Colors.red,
              myfontSize: size.bigButtonTextSize,
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
