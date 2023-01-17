import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/globalcolors.dart';

ThemeData lightTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: appPrimaryCol,
  primaryColorLight: appPrimaryLightVariant,
  primarySwatch: const MaterialColor(
    0xFF55418E, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF55418E), //10%
      100: Color(0xFF55418E), //20%
      200: Color(0xFF55418E), //30%
      300: Color(0xFF55418E), //40%
      400: Color(0xFF55418E), //50%
      500: Color(0xFF55418E), //60%
      600: Color(0xFF55418E), //70%
      700: Color(0xFF55418E), //80%
      800: Color(0xFF55418E), //90%
      900: Color(0xFF55418E), //100%
    },
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: appPrimaryCol,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: appPrimaryLightVariant,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: GoogleFonts.mulish(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
  ),

  textTheme: TextTheme(
    headline4: GoogleFonts.mulish(
      color: appPrimaryCol,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(color: Colors.deepPurpleAccent),
    headline6: GoogleFonts.mulish(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),

    //for body text
    bodyText1: GoogleFonts.mulish(
      color: Colors.white,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),

    bodyText2: GoogleFonts.mulish(
      color: appPrimaryLightVariant,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
    ),
    //for menu
    subtitle1: GoogleFonts.mulish(
      color: appPrimaryCol,
      fontSize: 11.sp,
      fontWeight: FontWeight.bold,
    ),
    //for list heading
    subtitle2: GoogleFonts.mulish(
      color: appPrimaryCol,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    ),
    caption: GoogleFonts.mulish(
      color: appPrimaryLightVariant,
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
    ),
    overline: GoogleFonts.mulish(
      color: appPrimaryLightVariant,
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: appPrimaryCol,
  appBarTheme: const AppBarTheme(
    backgroundColor: appPrimaryCol,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: appPrimaryLightVariant,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),

  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.deepPurpleAccent),
    headline2: TextStyle(color: Colors.deepPurpleAccent),
    headline6: GoogleFonts.mulish(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.mulish(
      color: Colors.white,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(color: Colors.deepPurpleAccent),
    subtitle1: GoogleFonts.mulish(
      color: appPrimaryCol,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  ),
);
