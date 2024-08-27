import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/refunds/refund_screen_binding/refund_screen_desk.dart';
import 'package:sel_org/ui_1/account/refunds/refund_screen_binding/refund_screen_mobile.dart';
import 'package:sel_org/ui_1/account/refunds/refund_screen_binding/refund_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class RefundScreen extends StatefulWidget {
  const RefundScreen({super.key});
  static const String routeName = "/refunds";
  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: RefundScreenDesk(),
      mediumScreen: RefundScreenTab(),
      smallScreen: RefundScreenMob(),
    );
  }
}
