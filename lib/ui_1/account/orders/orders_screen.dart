import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/orders/orders_screen_binding/orders_screen_desk.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'orders_screen_binding/orders_mediumScreen.dart';
import 'orders_screen_binding/orders_screen_mobile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static const String routeName = "/orders";
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: OrdersScreenDesk(),
        mediumScreen: Ordermediumscreen(),
        smallScreen: OrdersScreenMobile());
  }
}
