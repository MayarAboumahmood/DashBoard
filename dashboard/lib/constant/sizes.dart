import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sizes {
  late double appBarIconSize;
  late double appBarTextSize;
  late double width;
  late double height;
  late BuildContext context;
  Sizes(this.context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    GetDeviceType getDeviceType = GetDeviceType();
    if (getDeviceType.getDevicetype() == 'computer') {
      setSizesForComputer();
    } else if (getDeviceType.getDevicetype() == 'tablet') {
      setSizesForTablet();
    } else if (getDeviceType.getDevicetype() == 'smart phone') {
      setSizesForMobile();
    }
  }
  void setSizesForMobile() {
    print('set size for mobile');
    appBarIconSize = Get.size.height * .1;
    appBarTextSize = width * .1;
  }

  void setSizesForComputer() {
    print('set size for computer');
    appBarIconSize = Get.height * .05;
    appBarTextSize = width * .02;
  }

  void setSizesForTablet() {
    print('set size for tablet');
    appBarIconSize = Get.size.height * .1;
    appBarTextSize = Get.size.width * .1;
  }
}

class GetDeviceType {

  String getDevicetype() {
    double diagonal = sqrt(pow(Get.size.width, 2) + pow(Get.size. height, 2))/96;//the 96 because we use the pixel when we should use inche and 1 inche=96pixel
    print(diagonal);
    print(Get.size.height);
    if (diagonal >= 9.1||Get.size.height/96>=7) {
      return 'computer';
    } else if (diagonal >= 8.5 && Get.size.height/96 >= 5) {
      return 'tablet';
    } else {
      return 'smart phone';
    }
  }
}
