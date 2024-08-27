import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_screen_binding/cart_screen_desk.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_screen_binding/cart_screen_mobile.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_screen_binding/cart_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cart_screen";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: CartScreenDesk(),
        mediumScreen: CartScreenTab(),
        smallScreen: CartScreenMob());
  }
}
