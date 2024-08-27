import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/general_info/privacy_policy/privacy_screen_binding/privacy_screen_desk.dart';
import 'package:sel_org/ui_1/account/general_info/privacy_policy/privacy_screen_binding/privacy_screen_mobile.dart';
import 'package:sel_org/ui_1/account/general_info/privacy_policy/privacy_screen_binding/privacy_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});
  static const String routeName = "/privacy_policy";
  @override
  State<PrivacyPolicyScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: PrivacyPolicyScreenDesk(),
      mediumScreen: PrivacyPolicyScreenTab(),
      smallScreen: PrivacyPolicyScreenMob(),
    );
  }
}
