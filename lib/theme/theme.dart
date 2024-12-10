import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.green.shade300,
    primary: Colors.green.shade200,
    secondary: Colors.green.shade800,
    inversePrimary: Colors.green.shade800,
  ),
);

// dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.green.shade900,
    primary: Colors.green.shade800,
    secondary: Colors.green.shade700,
    inversePrimary: Colors.green.shade300,
  ),
);
