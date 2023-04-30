import 'package:flutter/material.dart';

Color primaryColor = const Color.fromARGB(255, 29, 154, 170);
Color blackprimaryColor = const Color.fromARGB(255, 37, 89, 95);
Color num2Color = const Color.fromARGB(255, 120, 203, 214);
Color num3Color = const Color.fromARGB(255, 187, 220, 223);
Color theBlueColor = const Color.fromARGB(255, 137, 159, 172);
Color theorangeColor = const Color.fromARGB(255, 255, 177, 75);
Color backgroundColordark = Colors.black12;
Color backgroundColorlight = Colors.white;
Color lowWhite = const Color.fromARGB(255, 185, 185, 185);

class Themes {
  static ThemeData customdarktheme = ThemeData.dark().copyWith(
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.teal,
    ),
    primaryColor: blackprimaryColor,
    secondaryHeaderColor: Color.fromARGB(255, 0, 133, 119),
    backgroundColor: backgroundColordark,
    appBarTheme: AppBarTheme(color: blackprimaryColor),
    // bottomAppBarColor: blackprimaryColor,
  );
  static ThemeData customlighttheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    secondaryHeaderColor: num2Color,
    backgroundColor: backgroundColorlight,
    appBarTheme: AppBarTheme(color: primaryColor),
    // bottomAppBarColor: primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: num2Color,
    ),
  );
}
