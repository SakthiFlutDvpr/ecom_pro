import 'package:flutter/material.dart';

import 'base_colors.dart';

class AppColors implements BaseColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  AppColors._internal();

  @override
  Color get primaryDarkGreen => const Color(0xff034703);

  @override
  Color get primaryLightGreen => const Color(0xFF41A64C);

  @override
  Color get buttonBackgroundColor => const Color(0xff67C33C);

  @override
  Color get productCardColor => const Color(0xffE5EEC3);

  @override
  Color get appBackgroundWhite => const Color(0xffEEEEF0);

  @override
  // ignore: use_full_hex_values_for_flutter_colors
  Color get logoutButtonColor => const Color(0xffce17178);

  @override
  Color get walletCardColor => const Color(0xffE5EEC3);

  @override
  Color get orderCancelledColor => const Color(0xffE54444);

  @override
  Color get orderSuccessColor => const Color(0xff00A85A);

  @override
  Color get fourgrey => const Color(0xff444444);

  @override
  Color get sixgrey => const Color(0xff666666);

  @override
  Color get sevengrey => const Color(0xff777777);

  @override
  Color get twoblack => const Color(0xff222222);
}
