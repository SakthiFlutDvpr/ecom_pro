import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_screen_binding/customer_screen_desk.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_screen_binding/customer_screen_mobile.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_screen_binding/customer_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});
  static const String routeName = "/customer_support";
  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: CustomerScreenDesk(),
      mediumScreen: CustomerScreenTab(),
      smallScreen: CustomerScreenMob(),
    );
  }
}
