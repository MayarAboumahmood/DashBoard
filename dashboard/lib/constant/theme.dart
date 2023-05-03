import 'package:flutter/material.dart';

//for light mode
Color primaryColor = const Color.fromARGB(1, 43, 120, 97); //done
Color woodBrownColor = const Color.fromARGB(255, 54, 33, 20); //done
Color skinColorWhite = const Color.fromARGB(255, 226, 212, 172); //done

Color blackprimaryColor = const Color.fromARGB(255, 0, 15, 15);
Color lightBrownColor = const Color.fromARGB(255, 141, 91, 73);

//for dark mode
//to do .... to do .... to do ... to do ... to do ...
Color primaryDarkColor = const Color.fromARGB(255, 9, 99, 110);
Color blackprimaryDarkColor = const Color.fromARGB(255, 0, 8, 8);
Color brownDarkColor = const Color.fromARGB(255, 65, 40, 36);
Color lightDarkBrownColor = const Color.fromARGB(255, 141, 91, 73);
Color skinDarkColorWhite = const Color.fromARGB(255, 184, 140, 125);

/*---------------*/
class Themes {
  static ThemeData customdarktheme = ThemeData.dark().copyWith(
      buttonTheme: ButtonThemeData(
        buttonColor: lightBrownColor,
      ),
      primaryColor: blackprimaryColor,
      secondaryHeaderColor: woodBrownColor,
      appBarTheme: AppBarTheme(color: primaryColor),
      brightness: Brightness.dark,
      disabledColor: skinColorWhite,
      dialogBackgroundColor: primaryColor,
      dividerColor: primaryDarkColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          hoverColor: primaryColor, backgroundColor: skinColorWhite),
      focusColor: primaryColor,
      hoverColor: woodBrownColor,
      iconTheme: IconThemeData(color: primaryColor),
      cardColor: primaryColor,
      hintColor: primaryColor,
      scaffoldBackgroundColor: skinColorWhite);

  ///
  static ThemeData customlighttheme = ThemeData.light().copyWith(
    buttonTheme: ButtonThemeData(
      buttonColor: lightBrownColor,
    ),
    dialogBackgroundColor: primaryColor,
    hoverColor: woodBrownColor,
    iconTheme: IconThemeData(color: primaryColor),
    hintColor: primaryColor,
    cardColor: primaryColor,
    dividerColor: primaryDarkColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: primaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        hoverColor: primaryColor, backgroundColor: skinColorWhite),
    focusColor: primaryColor,
    textTheme: TextTheme(displaySmall: TextStyle(color: primaryDarkColor)),
    primaryColor: blackprimaryColor,
    secondaryHeaderColor: woodBrownColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: blackprimaryColor, //to change the text color in the container.
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: woodBrownColor,
      error: Colors.black,
      onError: Colors.white,
      background: Colors.blue,
      onBackground: Colors.white,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),
    appBarTheme: AppBarTheme(color: primaryColor),
    brightness: Brightness.light,
    disabledColor: skinColorWhite,
    scaffoldBackgroundColor: skinColorWhite,
  );
}
