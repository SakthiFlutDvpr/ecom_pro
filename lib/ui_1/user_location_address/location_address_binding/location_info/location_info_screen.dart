import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/location_info/location_information_mob.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class LocationInformationScreen extends StatefulWidget {
  const LocationInformationScreen({Key? key}) : super(key: key);

  static const String routeName = "/location_information";

  @override
  LocationInformationScreenState createState() => LocationInformationScreenState();
}

class LocationInformationScreenState extends State<LocationInformationScreen> {


  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: LocationInformationPage(),
      mediumScreen: LocationInformationPage(),
      smallScreen: LocationInformationPage(),
    );
  }
}