import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_manager/utils/globalcolors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: GlobalColors.primary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(GlobalColors.positiveButton),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.roboto(fontSize: 16),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.yellow,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
  ),
);
