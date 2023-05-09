import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:sized_context/sized_context.dart';

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
  late double normalButtonInsidePaddin; //done

  late double bigButtonHeight; //done
  late double bigButtonWidht; //done

  late double bigButtonTextSize;
  late double normalButtonTextSize;
  // late double autoSizeTextMaxSizeNormalButton;

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

    normalButtonInsidePaddin = width * .08;
    bigButtonTextSize = height * .06;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .7;
    appBarIconSize = height * .07;
    appBarTextSize = width * .1;
    drinkCardWidth = width * .4;
    drinkCardHeight = height * .4;
    cardNormalTextSize = height * .03;
    cardTitleTextSize = height * .05;
    cardButtonHeight = height * .06;
    cardButtonWidth = width * .1;
    eventCardWidth = width * .9;
    eventCardHeight = height * .45;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = height * .08;
    normalButtonWidht = width * .5;
    bigButtonHeight = height * .2;
    bigButtonWidht = width * .3;
  }

  void setSizesForComputer() {
    normalButtonInsidePaddin = width * .03;
    print('set size for computer');
    textFieldWidth = width * .4;
    bigButtonTextSize = height * .06;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    appBarIconSize = height * .05;
    appBarTextSize = width < height ? height * .06 : width * .04;
    drinkCardWidth = width * .22;
    drinkCardHeight = height * .5;
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
    normalButtonInsidePaddin = width * .02;
    normalButtonTextSize = height * .04;
    textFieldTextSize = width * .1;
    textFieldWidth = width * .7;
    appBarIconSize = height * .07;
    appBarTextSize = width * .06;
    drinkCardWidth = width * .3;
    drinkCardHeight = height * .35;
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
  late Size sizeInInches;
  late double widthInInches;
  late double heightInInches;
  late double diagonalInInches;
  String getDevicetype(BuildContext context) {
    sizeInInches = context.sizeInches;
    widthInInches = context.widthInches;
    heightInInches = context.heightInches;
    diagonalInInches = context.diagonalInches;
    if (widthInInches < 3) {
      return 'SmartPhone';
    } else if (widthInInches < 10) {
      return 'tablet';
    } else if (widthInInches > 10) {
      return 'computer';
    }
    // if (GetPlatform.isMobile ||
    //     MediaQuery.of(context).size.width < 400 /*not sure from number yet*/) {
    //   return 'SmartPhone';
    // } else if ((GetPlatform.isMobile || GetPlatform.isWeb) &&
    //     MediaQuery.of(context).size.width > 400 /*not sure from number yet*/ &&
    //     MediaQuery.of(context).size.width < 800 /*not sure from number yet*/) {
    //   return 'tablet';
    // } else if (GetPlatform.isDesktop ||
    //     MediaQuery.of(context).size.width > 800) {
    //   return 'computer';
    // }
    return '';
  }
}
