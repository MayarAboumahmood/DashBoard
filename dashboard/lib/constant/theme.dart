import 'package:dashboard/constant/font.dart';
import 'package:flutter/material.dart';

//for light mode
Color primaryColor =
    Colors.teal[300]!; //const Color.fromARGB(1, 43, 120, 97); //done
Color lightHoverButtonColor = Colors.teal[400]!;
Color woodBrownColor =
    Colors.brown; // const Color.fromARGB(255, 54, 33, 20); //done
Color? skinColorWhite =
    Colors.brown[50]; // const Color.fromARGB(255, 226, 212, 172); //done

//for the dark mode:
Color darkPrimaryColor = Colors.teal[900]!;
Color darkHoverButtonColor = Colors.teal[800]!;
Color darkWoodBrownColor = Colors.redAccent[700]!;
Color backGroundDarkColor = Colors.black87;

/*---------------*/
class Themes {
  static ThemeData customdarktheme = ThemeData.dark().copyWith(
    listTileTheme: ListTileThemeData(
      iconColor: darkPrimaryColor,
    ),
    primaryIconTheme: IconThemeData(color: darkPrimaryColor),

    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: darkPrimaryColor,
            onPrimary: darkPrimaryColor,
            secondary: darkWoodBrownColor,
            onSecondary: darkWoodBrownColor,
            error: darkWoodBrownColor,
            onError: darkWoodBrownColor,
            background: backGroundDarkColor,
            onBackground: backGroundDarkColor,
            surface: darkPrimaryColor,
            onSurface: darkPrimaryColor)),
    primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        bodyLarge: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        displayMedium: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        displaySmall: TextStyle(color: skinColorWhite, fontFamily: 'Jost')),
    dialogBackgroundColor: backGroundDarkColor,
    iconTheme: IconThemeData(color: darkPrimaryColor),
    hintColor: darkPrimaryColor, //hint text color
    dividerColor: darkPrimaryColor, //control the divider color
    drawerTheme: DrawerThemeData(
      backgroundColor: darkPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: darkWoodBrownColor,
    textTheme: TextTheme(
        displayLarge:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily),
        displaySmall:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily)),
    primaryColor: darkPrimaryColor,
    secondaryHeaderColor: darkWoodBrownColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          color: skinColorWhite,
          fontFamily:
              jostFontFamily), //controller the color of the appbar text.
      iconTheme: IconThemeData(color: darkPrimaryColor),

      color: backGroundDarkColor.withOpacity(
          0.1), //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary:
          backGroundDarkColor, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          skinColorWhite!, //control the color of the title on the appBar.
      secondary: darkPrimaryColor,
      onSecondary: skinColorWhite!,
      primaryContainer: Colors.blueGrey,
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //darckPrimaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),

    brightness: Brightness.dark,
    disabledColor:
        backGroundDarkColor, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );

  ///

  static ThemeData customlighttheme = ThemeData.light().copyWith(
    listTileTheme: ListTileThemeData(
      iconColor: primaryColor,
    ),
    primaryIconTheme: IconThemeData(color: primaryColor),
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: primaryColor,
            secondary: woodBrownColor,
            onSecondary: woodBrownColor,
            error: woodBrownColor,
            onError: woodBrownColor,
            background: skinColorWhite!,
            onBackground: skinColorWhite!,
            surface: primaryColor,
            onSurface: primaryColor)),

    primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        bodyLarge: TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        displayMedium:
            TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        displaySmall:
            TextStyle(color: backGroundDarkColor, fontFamily: 'Jost')),
    dialogBackgroundColor: primaryColor,
    iconTheme: IconThemeData(color: primaryColor),
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
        displayLarge:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily),
        displayMedium:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily),
        displaySmall:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily)),
    primaryColor: primaryColor,
    secondaryHeaderColor: woodBrownColor,
    appBarTheme: AppBarTheme(
      titleTextStyle:
          TextStyle(color: Colors.black, fontFamily: jostFontFamily),
      iconTheme: IconThemeData(color: primaryColor),
      color:
          skinColorWhite, //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary:
          skinColorWhite!, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          skinColorWhite!, //control the color of the title on the appBar.
      secondary: primaryColor,
      onSecondary: backGroundDarkColor,
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
  // static ThemeData systemTheme = ThemeData..copyWith();
}
