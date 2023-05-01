import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sizes {
  GetDeviceType getDeviceType = GetDeviceType();

  late double appBarIconSize;
  late double appBarTextSize;
  late double width;
  late double height;
  late BuildContext context;
  Sizes(this.context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    if (getDeviceType.getDevicetype() == 'computer') {
      setSizesForComputer();
    } else if (getDeviceType.getDevicetype() == 'tablet') {
      setSizesForTablet();
    } else if (getDeviceType.getDevicetype() == 'smart phone') {
      setSizesForMobile();
    }
  }
  void setSizesForMobile() {
    appBarIconSize = Get.size.height * .1;
    appBarTextSize = width * .1;
  }

  void setSizesForComputer() {
    appBarIconSize = Get.height * .05;
    appBarTextSize = width * .02;
  }

  void setSizesForTablet() {
    appBarIconSize = Get.size.height * .1;
    appBarTextSize = Get.size.width * .1;
  }
}

class GetDeviceType {
  String getDevicetype() {
    double diagonal = sqrt(pow(Get.size.width, 2) + pow(Get.size.height, 2));
    if (diagonal >= 10.1) {
      return 'computer';
    } else if (diagonal >= 7.0) {
      return 'tablet';
    } else {
      return 'smart phone';
    }
  }
}
