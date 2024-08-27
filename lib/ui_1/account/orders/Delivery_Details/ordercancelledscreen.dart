import 'package:flutter/material.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'orders_screen_cancelled_binding/Small_Order_Cancelled.dart';
import 'orders_screen_cancelled_binding/large_order_cancelld.dart';
import 'orders_screen_cancelled_binding/medium_order_Canelled.dart';

class OrderCancelledScreen extends StatefulWidget {
  const OrderCancelledScreen({super.key});
  static const String routeName = "/orderCancelled";
  @override
  State<OrderCancelledScreen> createState() => _OrderCancelledScreenState();
}

class _OrderCancelledScreenState extends State<OrderCancelledScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: LargeOrderCancelld(),
        mediumScreen: MediumOrderCanelled(),
        smallScreen: SmallOrderCancelled());
  }
}
