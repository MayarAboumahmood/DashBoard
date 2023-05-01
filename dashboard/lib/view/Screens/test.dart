import 'package:dashboard/languages/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../../main.dart';

class Test extends StatelessWidget {
  LanguageController languageController = Get.find();

  Test({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('what the fuck is that'.tr,
            style: TextStyle(fontSize: size.appBarTextSize)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Container(
              color: Colors.red,
              height: Get.height * .1,
              width: Get.width * .2,
              child: TextButton(
                onPressed: () {
                  languageController.changeLanguage('ar');
                },
                child: const Text('to arabic'),
              ),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
            Container(
              color: Colors.red,
              height: Get.height * .1,
              width: Get.width * .2,
              child: TextButton(
                onPressed: () {
                  languageController.changeLanguage('en');
                },
                child: const Text('to english'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
