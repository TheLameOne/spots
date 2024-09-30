import 'package:flutter/material.dart';
import 'package:spots/core/theme/blue_dark.dart';
import 'package:spots/core/theme/blue_light.dart';
import 'package:spots/core/theme/dark.dart';
import 'package:spots/core/theme/green_dark.dart';
import 'package:spots/core/theme/green_light.dart';
import 'package:spots/core/theme/light.dart';
import 'package:spots/core/theme/orange_dark.dart';
import 'package:spots/core/theme/orange_light.dart';
import 'package:spots/core/theme/yellow_dark.dart';
import 'package:spots/core/theme/yellow_light.dart';

class ThemeProvider extends ChangeNotifier {
  // Store the available themes in lists
  final List<ThemeData> _lightThemes = [
    blueLight,
    greenLight,
    orangeLight,
    yellowLight,
    light
    // warmEarthLight,
  ];
  final List<ThemeData> _darkThemes = [
    blueDark,
    greenDark,
    orangeDark,
    yellowDark,
    dark
    // mochaDark
  ];

  final List<String> _lightThemesName = [
    "Midnight Blue",
    "Olive Grove",
    "Crimson Ember",
    "Golden Sable",
    "Urban Mist"
  ];

  final List<String> _darkThemesName = [
    "Midnight Blue",
    "Olive Grove",
    "Crimson Ember",
    "Golden Sable",
    "Urban Mist"
  ];

  // Track the current theme index and dark mode state
  int _currentThemeIndex = 0;
  bool _darkMode = false;

  // Get the current theme
  ThemeData get themeData => (_darkMode)
      ? _darkThemes[_currentThemeIndex % _darkThemes.length]
      : _lightThemes[_currentThemeIndex % _lightThemes.length];

  // Toggle the theme by cycling through the list
  void toggleTheme() {
    _currentThemeIndex = (_currentThemeIndex + 1) %
        (_darkMode ? _darkThemes.length : _lightThemes.length);
    notifyListeners();
  }

  // Toggle between light and dark mode
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  // Set a specific theme by index
  void setTheme(int themeIndex) {
    if (_darkMode && themeIndex >= 0 && themeIndex < _darkThemes.length) {
      _currentThemeIndex = themeIndex;
    } else if (!_darkMode &&
        themeIndex >= 0 &&
        themeIndex < _lightThemes.length) {
      _currentThemeIndex = themeIndex;
    }
    notifyListeners();
  }

  List<ThemeData> getThemeList() {
    if (_darkMode) {
      return _darkThemes;
    } else {
      return _lightThemes;
    }
  }

  List<String> getThemeName() {
    if (_darkMode) {
      return _darkThemesName;
    } else {
      return _lightThemesName;
    }
  }

  List<ThemeData> getDarkThemeList() {
    return _darkThemes;
  }

  void setDarkMode() {
    _darkMode = true;
    notifyListeners();
  }

  // Set to light mode
  void setLightMode() {
    _darkMode = false;
    notifyListeners();
  }

  // Set to system default mode
  void setSystemDefaultMode(Brightness systemBrightness) {
    _darkMode = (systemBrightness == Brightness.dark);
    notifyListeners();
  }

  // Get the current theme index
  int get currentThemeIndex => _currentThemeIndex;

  // Get whether the current theme is dark mode
  bool get isDarkMode => _darkMode;

  List<ThemeData> get lightModeList => _lightThemes;
  List<ThemeData> get darkModeList => _darkThemes;
}
