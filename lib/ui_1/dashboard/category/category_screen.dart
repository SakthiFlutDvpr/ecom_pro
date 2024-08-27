import 'package:flutter/cupertino.dart';
import 'package:sel_org/ui_1/dashboard/category/category_screen_binding/category_screen_desk.dart';
import 'package:sel_org/ui_1/dashboard/category/category_screen_binding/category_screen_mob.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

import 'category_screen_binding/category_screen_tab.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static const String routeName = "/category_screen";

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: CategoryScreenWeb(),
      mediumScreen: CategoryScreenTab(),
      smallScreen: CategoryScreenMob(),
    );
    // return Text('Hi');
  }
}
