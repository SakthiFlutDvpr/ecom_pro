// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../utils/font.dart';

class Constants {
  static const String darkMode = String.fromEnvironment(
    'darkMode',
    defaultValue: 'DarkMode',
  );

  static const String languageCode = String.fromEnvironment(
    'languageCode',
    defaultValue: 'languageCode',
  );

  final lightTheme = ThemeData.light().copyWith(
    sliderTheme: const SliderThemeData(
      // activeTrackColor: AppColors().lightSliderActive,
      // activeTickMarkColor: AppColors().lightSliderActive,
      trackHeight: 4,
      // inactiveTrackColor: AppColors().sliderInactiveColor,
      thumbColor: Colors.black,
      // overlayColor: AppColors().orangeSelected.withOpacity(0.3),
      //valueIndicatorColor: AppColors().sliderOrangeText,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorTextStyle:
          TextStyle(color: Colors.black), // Text style of the value indicator
    ),
    iconTheme: const IconThemeData(
      color: Colors.black, // Customize icon color for light theme
      opacity: 1.0, // Opacity of icons
      size: 24.0, // Default size of icons
    ),
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.blue,
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    disabledColor: Colors.grey[300],
    dividerColor: Colors.grey[300],
    focusColor: Colors.blueAccent,
    highlightColor: Colors.blueAccent,
    hoverColor: Colors.blueAccent.withOpacity(0.1),
    indicatorColor: Colors.blueAccent,
    primaryColorDark: Colors.blue[700],
    primaryColorLight: Colors.blue[200],
    shadowColor: Colors.black,
    splashColor: Colors.blueAccent.withOpacity(0.2),
    unselectedWidgetColor: Colors.grey[400],
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue,
      ),
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Colors.blue.withOpacity(0.12),
      ),
      splashRadius: 18.0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      // Background color of the app bar
      foregroundColor: Colors.black,
      // Text and icon color

      elevation: 4,
      // Elevation of the app bar
      shadowColor: Colors.grey,
      // Color of the app bar shadow
      centerTitle: true,
      // Center the title horizontally
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      // Spacing around the title
      toolbarTextStyle: TextStyle(
        color: Colors.black, // Text color of title, actions, and back button
        fontSize: 20, // Font size of the title
        fontWeight: FontWeight.bold, // Font weight of the title
      ),
      titleTextStyle: TextStyle(
        color: Colors.black, // Text color of the title in the middle
        fontSize: 20, // Font size of the title in the middle
        fontWeight: FontWeight.bold, // Font weight of the title in the middle
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black, // Icon color of actions
        size: 24, // Size of the icons in actions
      ),
      iconTheme: IconThemeData(
        color: Colors.black, // Icon color for leading and back button
        size: 24, // Size of the icons in leading and back button
      ),
      toolbarHeight: kToolbarHeight, // Height of the app bar
      // backwardsCompatibility: false, // Disable backward compatibility
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black, // Set the color to black
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ).apply(
      fontFamily: Font.poppinsRegular.value,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      labelStyle: TextStyle(color: Colors.blue),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF006782);
        }
        return null;
      }),
    ),
    colorScheme: const ColorScheme.light().copyWith(surface: Colors.white),
  );
}

Widget height(double x) => SizedBox(
      height: x,
    );
Widget width(double x) => SizedBox(
      width: x,
    );
