import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sel_org/resources/colors/app_colors.dart';

class TappableContainer extends StatelessWidget {
  final String svgIcon;
  final String text;
  final VoidCallback onTap;
  const TappableContainer({
    super.key,
    required this.svgIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: width < 650
            ? EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w)
            : width > 650 && width <= 1100
                ? EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w)
                : EdgeInsets.symmetric(vertical: 25.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              height: width < 650
                  ? 25.h
                  : width > 650 && width <= 1100
                      ? 20.h
                      : 35.h,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              width: width < 650
                  ? 16.w
                  : width > 650 && width <= 1100
                      ? 10.w
                      : 8.w,
            ),
            Text(text,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: width < 650
                      ? 14.sp
                      : width > 650 && width <= 1100
                          ? 7.sp
                          : 5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors().twoblack,
                )),
          ],
        ),
      ),
    );
  }
}
