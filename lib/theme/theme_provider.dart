import 'package:flutter/material.dart';
import 'package:newnotesapp/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = light;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == dark;

  set themeData(ThemeData td) {
    _themeData = td;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeData == light) {
      _themeData = dark;
    } else {
      _themeData = light;
    }

    notifyListeners();
  }
}
