import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/ui_1/account/account_screen.dart';
import 'package:sel_org/ui_1/account/address/address_screen.dart';
import 'package:sel_org/utils/reusable_widgets/search_widget.dart';

import '../../../cart/cart_screen.dart';

class HomePageAppBarDesk extends CoreWidgets {
  const HomePageAppBarDesk({super.key});

  @override
  CoreWidgetsState<HomePageAppBarDesk> createState() =>
      _HomePageAppBarDeskState();
}

class _HomePageAppBarDeskState extends CoreWidgetsState<HomePageAppBarDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 130.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: const Color(0xFF034703),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: 50.w,
              height: 80.h,
              child: Image.asset(
                "assets/png/logo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 50.h,
            width: 0.5.w,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01,
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AddressScreen.routeName);
            },
            child: Row(
              children: [
                Text(
                  "Adyar",
                  style: TextStyle(
                      fontFamily: "Poppins-SemiBold",
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                // const SizedBox(
                //   width: 6,
                // ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.white,
                  size: 6.sp,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
              ),
              width: size.width * 0.45,
              child: SelorgSearchField(
                hintText: "Search for products... ",
                size: 4.sp,
              )),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AccountScreen.routeName);
            },
            child: Text(
              "My Account",
              style: TextStyle(
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 40.h,
            width: 35.w,
            child: ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push(CartScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              label: Text("My Cart",
                  style: TextStyle(
                    fontSize: 4.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF034703),
                  )),
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF034703),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
