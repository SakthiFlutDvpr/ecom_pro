import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/ui_1/account/account_screen.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_details/add_address_sreen.dart';

import '../../../../resources/drawable/app_drawable.dart';
import '../../../../utils/reusable_widgets/search_widget.dart';

class HomePageAppBarMobile extends StatelessWidget {
  const HomePageAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
      color: const Color(0xff034703),
      child: SafeArea(
        child: Column(
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AddAddressScreen.routeName);
                  },
                  child: Flex(direction: Axis.horizontal, children: [
                    Text("Adyar",
                        style: TextStyle(
                            fontFamily: "Poppins-SemiBold",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                      size: 16.sp,
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AccountScreen.routeName);
                  },
                  child: SvgPicture.asset(
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    AppDrawable().profileIcon,
                    height: 25.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                width: size.width,
                height: 45.h,
                child: SelorgSearchField(
                  hintText: "Search for \" Orange \" ",
                  size: 12.sp,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 16.sp,
                    color: Colors.black,
                  ),
                  horizontalPadding: 8.w,
                  borderColor: AppColors().sixgrey,
                  //borderWidth: 1,
                  fillColor: Colors.white,
                  borderRadius: 8.r,
                ))
          ],
        ),
      ),
    );
  }
}
