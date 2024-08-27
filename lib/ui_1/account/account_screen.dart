import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/account_screen_binding/account_screen_desk.dart';
import 'package:sel_org/ui_1/account/account_screen_binding/account_screen_mobile.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'account_screen_binding/account_screen_tab.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static const String routeName = "/account_screen";

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: AccountScreenDesk(),
        mediumScreen: AccountScreenTab(),
        smallScreen: AccountScreenMob());
  }
}
