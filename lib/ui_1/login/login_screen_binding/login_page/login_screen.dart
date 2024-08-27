import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/login_page/login_screen_mobile.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'login_screen_web.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  static const String routeName = "/login_screen";

  @override
  LoginScreenPageState createState() => LoginScreenPageState();
}

class LoginScreenPageState extends State<LoginScreenPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: LoginScreenWeb(),
      mediumScreen: LoginScreenMob(),
      smallScreen: LoginScreenMob(),
    );
    // return Text('Hi');
  }
}
