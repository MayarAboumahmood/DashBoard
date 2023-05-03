import 'package:dashboard/languages/language_controller.dart';
import 'package:dashboard/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/sizes.dart';
import '../widget/costum_text_field.dart';
import '../widget/my_text_field.dart';

class Test extends StatelessWidget {
  LanguageController languageController = Get.find();

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
              height: size.normalButtonHeight,
              width: size.normalButtonWidht,
              child: TextButton(
                onPressed: () {
                  languageController.changeLanguage('en');
                },
                child: const Text('to english'),
              ),
            ),
            CostumTextField(
              hint: 'test for the custom text field',
              inputtype: TextInputType.name,
              iconsuffex: const Icon(Icons.favorite),
              label: 'Welcom again',
              onTap: () {
                print('on tap(){}');
              },
              sucer: false,
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            MyTextField(
              textType: TextInputType.name,
              scurtext: false,
              disableColor: Colors.red,
              enableColor: Colors.green,
              hintText: 'hintText',
              labletext: 'what the fuck is that ',
            ),
            SizedBox(
              height: Get.size.height * .1,
            ),
            MyButton(
              title: 'title',
              ontap: () {},
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
