import 'package:flutter/material.dart';

//for light mode
Color primaryColor = const Color.fromARGB(1, 43, 120, 97); //done
Color woodBrownColor = const Color.fromARGB(255, 54, 33, 20); //done
// Color skinColorWhite = const Color.fromARGB(255, 226, 212, 172); //done
Color skinColorWhite = Color.fromARGB(255, 117, 86, 0); //done

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
      buttonColor: primaryColor,
    ),
    dialogBackgroundColor: skinColorWhite,
    iconTheme: IconThemeData(color: skinColorWhite),
    hintColor: primaryColor,
    dividerColor: primaryDarkColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: woodBrownColor,
    textTheme: TextTheme(
        displayLarge: TextStyle(color: skinColorWhite),
        displayMedium: TextStyle(color: skinColorWhite),
        displaySmall: TextStyle(color: skinColorWhite)),
    primaryColor: primaryColor,
    secondaryHeaderColor: woodBrownColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: skinColorWhite, //to change the text color in the container.
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: woodBrownColor,
      error: Colors.black,
      onError: Colors.white,
      background:
          skinColorWhite, //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.white,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),
    brightness: Brightness.light,
    disabledColor:
        skinColorWhite, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );

  ///
  static ThemeData customlighttheme = ThemeData.light().copyWith(
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
    ),
    dialogBackgroundColor: skinColorWhite,
    iconTheme: IconThemeData(color: skinColorWhite),
    hintColor: primaryColor,
    dividerColor: primaryDarkColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: woodBrownColor,
    textTheme: TextTheme(
        displayLarge: TextStyle(color: skinColorWhite),
        displayMedium: TextStyle(color: skinColorWhite),
        displaySmall: TextStyle(color: skinColorWhite)),
    primaryColor: primaryColor,
    secondaryHeaderColor: Colors.black, //should be woodBrownColor
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: const Color.fromARGB(1, 43, 120,
          97), //the appBar colors and the text colors in the container.
      onPrimary: Colors.amber, //primaryColor
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.redAccent, //primaryColor
      primaryContainer: Colors.blueGrey, //primaryColor
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //primaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown, // primaryColor
      surface: Colors.pink,
      onSurface: Colors.white,
    ),
    brightness: Brightness.light,
    disabledColor: Colors
        .indigo, //skinColorWhite //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );
}
// all the colors should know where they came from befor start writing code