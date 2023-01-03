import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blueGrey,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 25),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.yellow,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
  ),
);
