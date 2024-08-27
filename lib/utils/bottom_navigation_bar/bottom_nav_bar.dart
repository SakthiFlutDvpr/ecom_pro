import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_screen.dart';

import '../../ui_1/cart/cart_screen.dart';
import '../../ui_1/dashboard/category/category_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(AppDrawable().navSelorgIcon,
              AppDrawable().navSelorgActive, 0, HomepageScreen.routeName),
          _buildNavItem(AppDrawable().navCategoriesIcon,
              AppDrawable().navCategoriesActive, 1, CategoryScreen.routeName),
          _buildNavItem(AppDrawable().navCartIcon, AppDrawable().navCartActive,
              2, CartScreen.routeName),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      String icon, String activeIcon, int index, String routeName) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(routeName),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            widget.selectedIndex == index ? activeIcon : icon,
          ),
          Text(
            _getLabel(index),
            style: TextStyle(
              color: index == widget.selectedIndex
                  ? AppColors().primaryDarkGreen
                  : AppColors().primaryDarkGreen,
              fontWeight: index == widget.selectedIndex
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Selorg';
      case 1:
        return 'Categories';
      case 2:
        return 'Cart';

      default:
        return '';
    }
  }
}
