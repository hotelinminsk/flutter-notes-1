import 'package:flutter/material.dart';

//light mode

ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800));

//dark mode

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade300));
