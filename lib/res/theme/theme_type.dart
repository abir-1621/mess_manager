import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blueGrey,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.yellow,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
  ),
);