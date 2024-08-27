import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_screen_binding/homepage_screen_mobile.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_screen_binding/homepage_screen_tab.dart';

import '../../../utils/responsive_widget/responsive_widget.dart';
import 'homepage_screen_binding/homepage_screen_web.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  static const String routeName = "/homepage_screen";

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: HomepageScreenWeb(),
      mediumScreen: HomepageScreenTab(),
      smallScreen: HomepageScreenMob(),
    );
    // return HomepageScreenMob();
    // return Text('Hi');
  }
}
