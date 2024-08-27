import 'package:flutter/material.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'otp_screen_mobile.dart';
import 'otp_screen_web.dart';

class OtpPageScreen extends StatefulWidget {
  const OtpPageScreen({Key? key}) : super(key: key);

  static const String routeName = "/otp_page";

  @override
  State createState() => OtpPageScreenState();
}

class OtpPageScreenState extends State<OtpPageScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: OtpPageWeb(),
      mediumScreen: OtpPageMob(),
      smallScreen: OtpPageMob(),
    );
    // return Text('Hi');
  }
}
