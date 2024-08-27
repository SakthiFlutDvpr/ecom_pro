import 'package:flutter/material.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'orders_screen_delivered_binding/Small_Order_Delivered.dart';
import 'orders_screen_delivered_binding/large_Order_Deliverd.dart';
import 'orders_screen_delivered_binding/medium_Order_Deliverd.dart';

class OrderDeliveredScreen extends StatefulWidget {
  const OrderDeliveredScreen({super.key});
  static const String routeName = "/orderDelivered";
  @override
  State<OrderDeliveredScreen> createState() => _OrderDeliveredScreenState();
}

class _OrderDeliveredScreenState extends State<OrderDeliveredScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: LargeDelivered(),
        mediumScreen: MediumDelivered(),
        smallScreen: SmallDelivered());
  }
}
