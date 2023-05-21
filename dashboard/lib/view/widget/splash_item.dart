import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashItem extends StatelessWidget {
  String title;
  String image;
  SplashItem({Key? key, required this.title, required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AutoSizeText(
            title,
            style: TextStyle(
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 15),
          ),
          SizedBox(
            height: Get.size.height * .02,
          ),
          Image.asset(
            image,
            height: 300,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SplashItemProfile extends StatelessWidget {
  String image;
  SplashItemProfile({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: Get.size.height * .5,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
