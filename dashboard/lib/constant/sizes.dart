// ignore_for_file: avoid_print

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

  late double normalButtonHeight; //done but not on the mobile.
  late double normalButtonWidht; //done but not on the mobile.
  late double normalButtonInsidePaddin; //done

  late double bigButtonHeight; //done but not on the mobile.
  late double bigButtonWidht; //done but not on the mobile.

  late double smallEventCardHeight;
  late double smallEventCardWidth;

  late double bigButtonTextSize;
  late double normalButtonTextSize;
  // late double autoSizeTextMaxSizeNormalButton;

  late double textFieldIconSize; //done by default.
  late double textFieldWidth; //done by padding.
  late double textFieldHeight; //done by default.
  late double textFieldTextSize; //done by default

  late double wideNormalButtonTextSize; //done.
  late double wideNormalButtonWidth; //done.
  late double appBarTextFieldWidth;

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
    //need a check.
    smallEventCardHeight = height * .2;
    smallEventCardWidth = width * .75;

    print('set size for mobile');
    appBarTextFieldWidth =
        width * .8; //it's just an icon here so we not going to use it.
    wideNormalButtonTextSize = 18;
    wideNormalButtonWidth = width * .85;
    cardButtonTextSize = width * .1;
    normalButtonInsidePaddin = width * .08;
    bigButtonTextSize = height * .04;
    normalButtonTextSize = height * .035;
    textFieldTextSize = height * .04;
    textFieldWidth = width * .8;
    appBarIconSize = width * .07;
    appBarTextSize = width * .1;
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
    normalButtonHeight = height * .06;
    normalButtonWidht = width * .5;
    bigButtonHeight = height * .2;
    bigButtonWidht = width * .3;
  }

  void setSizesForComputer() {
    print('set size for computer');

    smallEventCardHeight = 130;
    smallEventCardWidth = 220;
    appBarTextFieldWidth = 300;
    wideNormalButtonWidth = context.widthInches > 5 ? 300 : width * .85;
    wideNormalButtonTextSize = 20;
    cardButtonTextSize = width < height ? height * .02 : width * .012;
    normalButtonInsidePaddin = width * .03;
    textFieldWidth = 325;
    bigButtonTextSize = context.widthInches > 12 ? 25 : 22;
    normalButtonTextSize = context.widthInches > 12 ? 18 : 17;
    textFieldTextSize = height * .04;
    appBarIconSize = width < height
        ? height * .05
        : context.widthInches > 12
            ? width * .035
            : width * .045;
    appBarTextSize = context.widthInches > 12 ? 43 : 42;
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
    normalButtonHeight = 35;

    // normalButtonHeight = context.heightInches > 3 && context.widthInches > 12
    //     ? height * .08
    //     : context.heightInches > 3 && context.widthInches < 12
    //         ? height * .07
    //         : context.widthInches > 12
    //             ? width * .04
    //             : width * .038; //to do
    normalButtonWidht = 150;
    bigButtonHeight = height * .24;
    bigButtonWidht = width * .2;
  }

  void setSizesForTablet() {
    smallEventCardHeight = 130;
    smallEventCardWidth = 220;
    print('set size for tablet');
    // print('context.widthinches: ${context.widthInches}');
    appBarTextFieldWidth = 50;
    wideNormalButtonWidth = context.widthInches > 5 ? 300 : width * .85;
    wideNormalButtonTextSize = 20;
    cardButtonTextSize = width < height
        ? height * .014
        : context.widthInches > 7
            ? width * .015
            : width * .016;
    bigButtonTextSize = context.widthInches > 7 ? 20 : 16;
    normalButtonInsidePaddin = width * .02;
    normalButtonTextSize = context.widthInches > 7 ? 16 : 14;
    textFieldTextSize = width * .1;
    textFieldWidth = 325; //context.widthInches > 7 ? width * .38 : width * .5;
    appBarIconSize = context.widthInches > 7
        ? width * .05
        : context.widthInches > 5
            ? 35
            : 30;
    appBarTextSize = context.widthInches > 6 ? 35 : 33;
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
    normalButtonHeight = 35;

    //  context.heightInches > 3 && context.widthInches > 7
    //     ? height * .06
    //     : context.heightInches > 3 && context.widthInches < 7
    //         ? height * .07
    //         : context.widthInches > 7
    //             ? width * .04
    //             : width * .038;
    normalButtonWidht = context.widthInches > 7 ? width * .15 : width * .16;
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
