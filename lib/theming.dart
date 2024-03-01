import 'package:flutter/material.dart';

class Theming{
  static Color primary = const Color(0xff1FCC79);
  static Color secondary = const Color(0xffFF6464);
  static Color mainText = const Color(0xff2E3E5C);
  static Color deepBlue = const Color(0xff3E5481);
  static Color secondaryText = const Color(0xff9FA5C0);
  static Color outline = const Color(0xffD0DBEA);
  static Color form = const Color(0xffF4F5F7);
  static Color white = const Color(0xffFFFFFF);

  static ThemeData lightTheme = ThemeData(

    primaryColor: primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
    selectedItemColor: primary,
    unselectedItemColor: secondaryText,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: deepBlue,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: secondaryText,
      ),

    ),
  );
  // Dark Mode
  // static ThemeData DarkTheme = ThemeData(
  //   scaffoldBackgroundColor: Colors.transparent,
  //   primaryColor: primaryLight,
  //   appBarTheme: AppBarTheme(
  //     centerTitle: true,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     iconTheme: IconThemeData(color: blackColor),
  //   ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     selectedItemColor: blackColor,
  //     unselectedItemColor:whiteColor ,
  //   ),
  //   textTheme: TextTheme(
  //     titleLarge: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 30,
  //       color: blackColor,
  //     ),
  //     titleMedium: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 30,
  //       color: blackColor,
  //     ),
  //     titleSmall: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       fontSize: 25,
  //       color: blackColor,
  //       fontFamily: 'Monotype',
  //     ),
  //     bodySmall: TextStyle(
  //       height: 2,
  //       // textBaseline: TextBaseline.alphabetic,
  //       fontSize: 25,
  //       color: blackColor,
  //       // fontFamily: "DecoType",
  //     ),
  //     bodyMedium: TextStyle(
  //       height: 2,
  //       fontSize: 25,
  //       color: blackColor,
  //       // fontWeight: FontWeight.bold,
  //       fontFamily: "KOUFIBD",
  //     ),
  //     bodyLarge: TextStyle(
  //       height: 2,
  //       fontSize: 25,
  //       color: whiteColor,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: "DecoType",
  //     ),
  //   ),
  // );

}