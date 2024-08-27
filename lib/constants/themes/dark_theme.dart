  import 'package:flutter/material.dart';


extension MyAppCustomTheme on ThemeData {
  ThemeData get myDarkTheme => AppTheme().darkTheme();
}

class AppTheme {
  ThemeData darkTheme() {
    // ColorScheme scheme = darkColorScheme ??
    //     ColorScheme.fromSeed(
    //         seedColor: const Color(0xFFF47C7C), brightness: Brightness.dark);
    return ThemeData(
        brightness: Brightness.dark, colorSchemeSeed: Colors.green.shade400);
  }
}
