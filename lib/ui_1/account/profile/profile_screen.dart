import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/profile/profile_screen_binding/profile_screen_desk.dart';
import 'package:sel_org/ui_1/account/profile/profile_screen_binding/profile_screen_mobile.dart';
import 'package:sel_org/ui_1/account/profile/profile_screen_binding/profile_screen_tab.dart';

import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: ProfileScreenDesk(),
      mediumScreen: ProfileScreenTab(),
      smallScreen: ProfileScreenMob(),
    );
  }
}
