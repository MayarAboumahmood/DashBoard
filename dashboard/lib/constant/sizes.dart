import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sizes {
  //the const var we will use in the app
  late double appBarIconSize;
  late double appBarTextSize;

  late double drinkCardWidth; //done
  late double drinkCardHeight; //done

  late double cardNormalTextSize;

  late double cardTitleTextSize;

  late double cardButtonHeight; //done
  late double cardButtonWidth; //done

  late double eventCardWidth; //done
  late double eventCardHeight; //done

  late double
      floatButtonWidth; //we  will not use it mostly because the floatActionButton have a const size by defult.
  late double
      floatButtonHeight; //we  will not use it mostly because the floatActionButton have a const size by defult.

  late double normalButtonHeight; //done
  late double normalButtonWidht; //done

  late double bigButtonHeight; //done
  late double bigButtonWidht; //done

  late double bigButtonTextSize;
  late double normalButtonTextSize;

  late double textFieldIconSize;
  late double textFieldWidth;
  late double textFieldHeight;
  late double textFieldTextSize;

  final double buttonRadius = 5; //done
/*---------------------------------*/

  late double width;
  late double height;
  late BuildContext context;
  Sizes(this.context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    GetDeviceType getDeviceType = GetDeviceType();
    if (getDeviceType.getDevicetype(context) == 'computer') {
      setSizesForComputer();
    } else if (getDeviceType.getDevicetype(context) == 'tablet') {
      setSizesForTablet();
    } else if (getDeviceType.getDevicetype(context) == 'SmartPhone') {
      setSizesForMobile();
    }
  }
  void setSizesForMobile() {
    print('set size for mobile');
    bigButtonTextSize = height * .06;
    appBarIconSize = height * .05;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .6;
    appBarTextSize = height * .03;
    drinkCardWidth = width * .46;
    drinkCardHeight = height * .4;
    cardNormalTextSize = height * .03;
    cardTitleTextSize = height * .05;
    cardButtonHeight = height * .06;
    cardButtonWidth = width * .1;
    eventCardWidth = width * .9;
    eventCardHeight = height * .45;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = height * .1;
    normalButtonWidht = width * .3;
    bigButtonHeight = height * .2;
    bigButtonWidht = width * .3;
  }

  void setSizesForComputer() {
    print('set size for computer');
    textFieldWidth = width * .4;
    bigButtonTextSize = height * .06;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    appBarIconSize = height * .05;
    appBarTextSize = height * .05;
    drinkCardWidth = width * .31;
    drinkCardHeight = height * .6;
    cardNormalTextSize = height * .03;
    cardTitleTextSize = height * .05;
    cardButtonHeight = height * .07;
    cardButtonWidth = width * .05;
    eventCardWidth = width * .95;
    eventCardHeight = height * .55;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = height * .12;
    normalButtonWidht = width * .17;
    bigButtonHeight = height * .24;
    bigButtonWidht = width * .27;
  }

  void setSizesForTablet() {
    print('set size for tablet');
    bigButtonTextSize = height * .06;

    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .5;
    appBarIconSize = height * .05;
    appBarTextSize = height * .04;
    drinkCardWidth = width * .46;
    drinkCardHeight = height * .4;
    cardNormalTextSize = height * .03;
    cardTitleTextSize = height * .05;
    cardButtonHeight = height * .06;
    cardButtonWidth = width * .1;
    eventCardWidth = width * .9;
    eventCardHeight = height * .45;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = height * .1;
    normalButtonWidht = width * .3;
    bigButtonHeight = height * .2;
    bigButtonWidht = width * .3;
  }
}

class GetDeviceType {
  String getDevicetype(BuildContext context) {
    if (GetPlatform.isMobile ||
        MediaQuery.of(context).size.width < 400 /*not sure from number yet*/) {
      return 'SmartPhone';
    } else if ((GetPlatform.isMobile || GetPlatform.isWeb) &&
        MediaQuery.of(context).size.width > 400 /*not sure from number yet*/ &&
        MediaQuery.of(context).size.width < 600 /*not sure from number yet*/) {
      return 'tablet';
    } else if (GetPlatform.isDesktop ||
        MediaQuery.of(context).size.width > 600) {
      return 'computer';
    }
    return '';
  }
}
