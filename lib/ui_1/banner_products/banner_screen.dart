import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/banner_products/banner_screen_binding/banner_screen_mobile.dart';
import 'package:sel_org/ui_1/banner_products/banner_screen_binding/banner_screen_tab.dart';
import 'package:sel_org/ui_1/banner_products/banner_screen_binding/banner_screen_web.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  static String routeName = "/banner_screen";

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: BannerScreenWeb(),
        mediumScreen: BannerScreenTab(),
        smallScreen: BannerScreenMob());
  }
}
