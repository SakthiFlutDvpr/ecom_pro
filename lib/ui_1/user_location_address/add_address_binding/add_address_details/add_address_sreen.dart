import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_details/add_address_screen_mob.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'add_address_screen_web.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  static const String routeName = "/add_address_screen";

  @override
  AddAddressScreenState createState() => AddAddressScreenState();
}

class AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: AddAddressDetailsWeb(),
      mediumScreen: AddAddressDetailsTab(),
      smallScreen: AddAddressDetailsMob(),
    );
  }
}
