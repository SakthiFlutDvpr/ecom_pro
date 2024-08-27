import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/address/address_screen_binding/address_screen_desk.dart';
import 'package:sel_org/ui_1/account/address/address_screen_binding/address_screen_mobile.dart';
import 'package:sel_org/ui_1/account/address/address_screen_binding/address_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  static const String routeName = "/address";

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: AddressScreenDesk(),
      mediumScreen: AddressScreenTab(),
      smallScreen: AddressScreenMob(),
    );
  }
}
