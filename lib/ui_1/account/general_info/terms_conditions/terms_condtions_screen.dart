import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/general_info/terms_conditions/terms_conditions_binding/terms_screen_desk.dart';
import 'package:sel_org/ui_1/account/general_info/terms_conditions/terms_conditions_binding/terms_screen_mobile.dart';
import 'package:sel_org/ui_1/account/general_info/terms_conditions/terms_conditions_binding/terms_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});
  static const String routeName = "/terms_conditions";
  @override
  State<TermsConditionScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: TermsConditionScreenDesk(),
      mediumScreen: TermsConditionScreenTab(),
      smallScreen: TermsConditionScreenMob(),
    );
  }
}
