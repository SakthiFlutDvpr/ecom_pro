import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/general_info/general_screen_binding/general_screen_desk.dart';
import 'package:sel_org/ui_1/account/general_info/general_screen_binding/general_screen_mobile.dart';
import 'package:sel_org/ui_1/account/general_info/general_screen_binding/genral_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});
  static const String routeName = "/general_info";
  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: GeneralScreenDesk(),
      mediumScreen: GeneralScreenTab(),
      smallScreen: GeneralScreenMob(),
    );
  }
}
