import 'package:flutter/material.dart';

//for light mode
Color primaryColor =
    Colors.teal[300]!; //const Color.fromARGB(1, 43, 120, 97); //done
Color woodBrownColor =
    Colors.brown; // const Color.fromARGB(255, 54, 33, 20); //done
Color? skinColorWhite =
    Colors.brown[100]; // const Color.fromARGB(255, 226, 212, 172); //done

//for the dark mode:
Color darckPrimaryColor = Colors.teal[900]!;
Color darckWoodBrown = Colors.redAccent[700]!;
Color backGroundDarkColor = Colors.black12;

/*---------------*/
class Themes {
  static ThemeData customdarktheme = ThemeData.dark().copyWith(
    dialogBackgroundColor: backGroundDarkColor,
    iconTheme: IconThemeData(color: backGroundDarkColor),
    hintColor: darckPrimaryColor, //hint text color
    dividerColor: darckPrimaryColor, //control the divider color
    drawerTheme: DrawerThemeData(
      backgroundColor: darckPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: darckWoodBrown,
    textTheme: TextTheme(
        displayLarge: TextStyle(color: backGroundDarkColor),
        displayMedium: TextStyle(color: backGroundDarkColor),
        displaySmall: TextStyle(color: backGroundDarkColor)),
    primaryColor: darckPrimaryColor,
    secondaryHeaderColor: darckWoodBrown,
    appBarTheme: AppBarTheme(
      color:
          darckPrimaryColor, //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary:
          backGroundDarkColor!, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          backGroundDarkColor!, //control the color of the title on the appBar.
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.redAccent,
      primaryContainer: Colors.blueGrey,
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //darckPrimaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),

    brightness: Brightness.light,
    disabledColor:
        backGroundDarkColor, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );

  ///

  static ThemeData customlighttheme = ThemeData.light().copyWith(
    dialogBackgroundColor: skinColorWhite,
    iconTheme: IconThemeData(color: skinColorWhite),
    hintColor: primaryColor, //hint text color
    dividerColor: primaryColor, //control the divider color
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
    appBarTheme: AppBarTheme(
      color:
          primaryColor, //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary:
          skinColorWhite!, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          skinColorWhite!, //control the color of the title on the appBar.
      secondary: Colors.deepPurpleAccent,
      onSecondary: Colors.redAccent,
      primaryContainer: Colors.blueGrey,
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //primaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),

    brightness: Brightness.light,
    disabledColor:
        skinColorWhite, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );
}
