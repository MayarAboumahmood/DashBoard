import 'package:flutter/material.dart';

import 'package:sized_context/sized_context.dart';

class Sizes {
  //the const var we will use in the app
  late double appBarIconSize; //done on web not on moblile.
  late double appBarTextSize; //done on web not on moblile.

  late double drinkCardWidth; //done
  late double drinkCardHeight; //done

  late double cardNormalTextSize; //done on web not on moblile.

  late double cardTitleTextSize; //done on web not on moblile.

  late double cardButtonHeight; //done on web not on moblile.
  late double cardButtonWidth; //done on web not on moblile.
  late double cardButtonTextSize; //done on web not on moblile.

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
    cardButtonTextSize = width * .1;
    normalButtonInsidePaddin = width * .08;
    bigButtonTextSize = height * .06;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .7;
    appBarIconSize = width * .07; //need a check
    appBarTextSize = width * .06;
    drinkCardWidth = width * .4;
    drinkCardHeight = height * .4;
    cardTitleTextSize = height * .03;
    cardNormalTextSize = height * .025;
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
    print('set size for computer');

    cardButtonTextSize = width < height ? height * .02 : width * .012;
    normalButtonInsidePaddin = width * .03;
    textFieldWidth = width * .4;
    bigButtonTextSize = height * .06;
    normalButtonTextSize = height * .04;
    textFieldTextSize = height * .04;
    appBarIconSize = width < height
        ? height * .05
        : context.widthInches > 12
            ? width * .035
            : width * .045;
    appBarTextSize = width < height ? height * .06 : width * .04;
    drinkCardWidth = width * .22;
    drinkCardHeight = height * .5;
    cardNormalTextSize = width < height ? height * .025 : width * .015;
    cardTitleTextSize = width < height ? height * .03 : width * .03;
    cardTitleTextSize = height * .05;
    cardButtonHeight = width < height ? height * .04 : width * .035;
    cardButtonWidth = context.widthInches > 12 ? width * .07 : width * .08;
    eventCardWidth = width * .9;
    eventCardHeight = height * .55;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = width < height ? height * .012 : width * .035; //to do
    normalButtonWidht = width * .17;
    bigButtonHeight = height * .24;
    bigButtonWidht = width * .27;
  }

  void setSizesForTablet() {
    print('set size for tablet');
    cardButtonTextSize = width < height
        ? height * .014
        : context.widthInches > 7
            ? width * .015
            : width * .016;
    bigButtonTextSize = height * .06;
    normalButtonInsidePaddin = width * .02;
    normalButtonTextSize = height * .04;
    textFieldTextSize = width * .1;
    textFieldWidth = width * .7;
    appBarIconSize = context.widthInches > 7
        ? width * .05
        : context.widthInches > 5
            ? width * .06
            : width * .08;
    appBarTextSize = width * .04;
    drinkCardWidth = width * .3;
    drinkCardHeight = height * .35;
    cardTitleTextSize = width < height
        ? height * .03
        : context.widthInches > 7
            ? width * .035
            : width * .04;
    cardNormalTextSize = width < height
        ? height * .025
        : context.widthInches > 7
            ? width * .02
            : width * .035;
    cardButtonWidth = width * .1;
    cardButtonHeight = width < height ? height * .05 : width * .05;
    cardButtonWidth = context.widthInches > 7 ? width * .08 : width * .1;

    eventCardWidth = width * .9;
    eventCardHeight = height * .45;
    floatButtonWidth = width * .08;
    floatButtonHeight = height * .06;
    normalButtonHeight = width < height ? height * .1 : width * .035; //to do
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
    } else if (widthInInches >= 10) {
      return 'computer';
    }
    return '';
  }
}
