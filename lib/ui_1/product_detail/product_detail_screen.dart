import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_screen_binding/product_detail_screen_desk.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_screen_binding/product_detail_screen_mobile.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_screen_binding/product_detail_screen_tab.dart';

import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class ProductDetailScreeen extends StatefulWidget {
  const ProductDetailScreeen({super.key});

  static String routeName = "/product_detail_page";

  @override
  State<ProductDetailScreeen> createState() => _ProductDetailScreeenState();
}

class _ProductDetailScreeenState extends State<ProductDetailScreeen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: ProductDetailScreenDesk(),
        mediumScreen: ProductDetailScreenTab(),
        smallScreen: ProductDetailScreenMob());
  }
}
