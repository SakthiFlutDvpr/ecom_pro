import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/splash/splash_screen_binding/splash_screen_mobile.dart';
import 'package:sel_org/ui_1/splash/splash_screen_binding/splash_screen_web.dart';

import '../../utils/responsive_widget/responsive_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "/splash";
  final splashScreenCScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: SplashScreenWeb(),
      mediumScreen: SplashScreenMobile(),
      smallScreen: SplashScreenMobile(),
    );
    // return Text('Hi');
  }
}
