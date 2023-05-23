import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../widget/slide_drawer.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      body: Row(
        children: [
          SlideDrawer(),
          SizedBox(width: Get.size.width * .01),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: getDeviceType.getDevicetype(context) == 'computer'
                ? 4
                : getDeviceType.getDevicetype(context) == 'tablet'
                    ? 3
                    : 2,
            children: <Widget>[
              Container(
                height: size.bigButtonHeight,
                width: size.bigButtonWidht,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(size.buttonRadius)),
              ),
              Container(
                height: size.bigButtonHeight,
                width: size.bigButtonWidht,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(size.buttonRadius)),
              ),
              Container(
                height: size.bigButtonHeight,
                width: size.bigButtonWidht,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(size.buttonRadius)),
              ),
              Container(
                height: size.bigButtonHeight,
                width: size.bigButtonWidht,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(size.buttonRadius)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
