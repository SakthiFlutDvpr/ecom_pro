import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_screen_binding/subcategory_screen_mobile.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_screen_binding/subcategory_screen_tab.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_screen_binding/subcategory_screen_web.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({super.key});

  static String routeName = "/subcategory_screen";

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: SubCategoryScreenWeb(),
        mediumScreen: SubCategoryScreenTab(),
        smallScreen: SubCategoryScreenMob());
  }
}
