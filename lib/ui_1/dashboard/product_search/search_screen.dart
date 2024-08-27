import 'package:flutter/material.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_binding/search_small_screen.dart';

import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class SearchScreen extends CoreWidgets {
  const SearchScreen({super.key});
  static const String routeName = "/search";
  @override
  CoreWidgetsState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends CoreWidgetsState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
        largeScreen: SearchMob(),
        mediumScreen: SearchMob(),
        smallScreen: SearchMob());
  }
}
