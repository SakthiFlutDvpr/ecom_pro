import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/utils/font.dart';

extension MyAppCustomTheme on ThemeData {
  ThemeData get myLightTheme => AppTheme().lightTheme();
}

class AppTheme {
  ThemeData lightTheme() {
    ColorScheme scheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF41A64C),
        surface: Colors.grey.shade200,
        primary: const Color(0xff034703));
    return ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            disabledBackgroundColor: Colors.grey.shade200,
            elevation: 0.0,
            side: const BorderSide(width: 1.5, color: Colors.black),
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xff67C33C),
                // ignore: deprecated_member_use
                background: const Color(0xff67C33C))),
        colorScheme: scheme,
        dialogBackgroundColor: Colors.green.shade200,
        dialogTheme: DialogTheme(
            backgroundColor: Colors.grey.shade200,
            surfaceTintColor: Colors.grey.shade200),
        fontFamily: Font.poppinsRegular.value,
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.grey.shade200,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide.none),
              splashFactory: InkSplash.splashFactory,
              backgroundColor: const Color(0xff034703),
              fixedSize: const Size(330, 40)),
        ),
        textTheme: TextTheme(
                headlineSmall: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black),
                headlineMedium: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black),
                headlineLarge: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black),
                titleSmall: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black),
                labelSmall: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.fade,
                    color: Colors.black),
                displaySmall: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.fade,
                    color: Colors.black),
                bodySmall: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.fade,
                    color: Colors.black))
            .apply(fontFamily: Font.poppinsRegular.value),

        // textTheme: const TextTheme(
        //   headlineSmall: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 12,
        //       fontWeight: FontWeight.w600,
        //       overflow: TextOverflow.fade),
        //   headlineMedium: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 15,
        //       fontWeight: FontWeight.w600,
        //       overflow: TextOverflow.fade),
        //   headlineLarge: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 18,
        //       fontWeight: FontWeight.w600,
        //       overflow: TextOverflow.fade),
        //   bodySmall: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 12,
        //       fontWeight: FontWeight.w400,
        //       overflow: TextOverflow.ellipsis),
        //   bodyMedium: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 15,
        //       fontWeight: FontWeight.w400,
        //       overflow: TextOverflow.ellipsis),
        //   bodyLarge: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 18,
        //       fontWeight: FontWeight.w400,
        //       overflow: TextOverflow.ellipsis),
        //   titleSmall: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 12,
        //       overflow: TextOverflow.ellipsis),
        //   titleMedium: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 15,
        //       overflow: TextOverflow.fade),
        //   titleLarge: TextStyle(
        //       color: Colors.black, // Set the color to black
        //       fontSize: 18,
        //       overflow: TextOverflow.ellipsis),
        //   labelSmall: TextStyle(
        //     color: Colors.black, // Set the color to black
        //     fontSize: 10,
        //     fontWeight: FontWeight.w200,
        //   ),
        //   labelMedium: TextStyle(
        //     color: Colors.black, // Set the color to black
        //     fontSize: 12,
        //     fontWeight: FontWeight.w200,
        //   ),
        //   labelLarge: TextStyle(
        //     color: Colors.black, // Set the color to black
        //     fontSize: 14,
        //     fontWeight: FontWeight.w200,
        //   ),
        // ).apply(
        //   fontFamily: Font.poppinsRegular.value,
        // ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelStyle: const TextStyle(color: Colors.black45, fontSize: 12),
          hintStyle: const TextStyle(color: Colors.black26, fontSize: 10),
          filled: true,
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 14),
          fillColor: Colors.grey.shade200,
          prefixStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(color: Colors.redAccent)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ));
  }
}
