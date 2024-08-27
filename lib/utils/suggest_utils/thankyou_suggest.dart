// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';

class ThankyouSuggestionSmallScreen extends StatelessWidget {
  const ThankyouSuggestionSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height < 750 ? height * 0.35 : height * 0.30,
      width: width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 32.w),
            child: Column(
              children: [
                Text("Thank You!",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors().twoblack)),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: Image.asset(
                    "assets/png/cone_img.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("We’ve received your suggestion.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    height: 55.h,
                    child: SelorgElevatedButton(
                      onTap: () {},
                      text: "Done",
                      size: 12.sp,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ThankyouSuggestionLargeScreen extends StatelessWidget {
  const ThankyouSuggestionLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width * 0.30,
          margin: width >= 650 && width <= 1100
              ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h)
              : EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
          child: Column(
            children: [
              Text("Thank You!",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width >= 650 && width <= 1100 ? 9.sp : 7.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors().twoblack)),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: width >= 650 && width <= 1100 ? 75.h : 100.h,
                child: Image.asset(
                  "assets/png/cone_img.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text("We’ve received your suggestion.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width >= 650 && width <= 1100 ? 7.sp : 5.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff000000))),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                  height: width >= 650 && width <= 1100 ? 35.h : 50.h,
                  child: SelorgElevatedButton(
                    onTap: () {},
                    text: "Done",
                    size: 12.sp,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
