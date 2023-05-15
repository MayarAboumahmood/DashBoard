import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/sizes.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
                myRadius: size.buttonRadius,
                mycolor: primaryColor,
                ontap: () {
                  Get.toNamed("/Setting");
                },
                mywidth: size.normalButtonWidht,
                myheight: size.normalButtonHeight,
                child: Text(
                  'go to setting',
                  style: TextStyle(
                      fontSize: size.normalButtonTextSize, fontFamily: 'Jost'),
                )),
            MyButton(
                myRadius: size.buttonRadius,
                mycolor: primaryColor,
                ontap: () {
                  Get.toNamed("/LoginPage");
                },
                mywidth: size.normalButtonWidht,
                myheight: size.normalButtonHeight,
                child: Text(
                  'go to login',
                  style: TextStyle(
                      fontSize: size.normalButtonTextSize, fontFamily: 'Jost'),
                ))
          ]),
    );
  }
}
