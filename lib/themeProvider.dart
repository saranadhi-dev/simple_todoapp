import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/theme.dart';

class Themeprovider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData td) {
    _themeData = td;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      print("Current Theme Light Mode");
      themeData = darkMode;
    } else {
      print("Current Theme Dark Mode");

      themeData = lightMode;
    }
  }
}
