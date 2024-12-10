import 'package:flutter/material.dart';
import 'package:todo_isar/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // intially, themes is light mode
  ThemeData _themeData = lightMode;

  // gettermethod to acces from the theme fromother parts of the code
  ThemeData get themeData => _themeData;

  // gettermethod to see if we in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  // setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // we woll use this toggle in a switch later on ...
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
