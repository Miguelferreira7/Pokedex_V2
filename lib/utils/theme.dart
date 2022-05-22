import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData appTheme = ThemeData(
    primaryColor: Colors.redAccent,
   // accentColor:  accentColor,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    textTheme:   TextTheme(
      headline1: TextStyle(
          fontSize: 96.0, fontWeight: FontWeight.w100, letterSpacing: -1.5),
      headline2: TextStyle(
          fontSize: 60.0, fontWeight: FontWeight.w200, letterSpacing: -0.5),
      headline3: TextStyle(
          fontSize: 48.0, fontWeight: FontWeight.w400, letterSpacing: 0.0),
      headline4: TextStyle(
          fontSize: 34.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0.0),
      headline6: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: TextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 1.25,),
      caption: TextStyle(
          fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: TextStyle(
          fontSize: 10.0, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    buttonTheme:  ButtonThemeData(
      //buttonColor: accentColor,
      textTheme: ButtonTextTheme.primary,
    ),
    dividerTheme:  const DividerThemeData(
      thickness: 1.0,
    ),
    iconTheme:  IconThemeData(
     // color: accentColor,
      size: 24,
    ),
    appBarTheme:  AppBarTheme(
      iconTheme: const IconThemeData(
          size: 24
      ),
      actionsIconTheme: const IconThemeData(
      ), toolbarTextStyle: const TextTheme(
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
           ),
      ).bodyText2, titleTextStyle: const TextTheme(
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
           ),
      ).headline6,
    ),
    bottomAppBarTheme:  BottomAppBarTheme(
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
     // backgroundColor: accentColor,
    ),

  );
}