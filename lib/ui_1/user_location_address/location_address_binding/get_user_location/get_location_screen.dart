import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/get_user_location/get_location_screen_mob.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/get_user_location/get_location_screen_web.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({Key? key}) : super(key: key);

  static const String routeName = "/get_user_location";

  @override
  GetLocationScreenState createState() => GetLocationScreenState();
}

class GetLocationScreenState extends State<GetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: GetUserLocationDetailsDesk(),
      mediumScreen: GetUserLocationDetailsMob(),
      smallScreen: GetUserLocationDetailsMob(),
    );
  }
}
