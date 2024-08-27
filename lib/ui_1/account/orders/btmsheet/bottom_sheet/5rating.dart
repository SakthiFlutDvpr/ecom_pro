import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/constants/constants.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/bottom_sheet/tq&feedback.dart';

import '../../orders_screen.dart';

void showRatingBottomSheet3(BuildContext context, double rating) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          height: 800.h,
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF3FBE1),
                    borderRadius: BorderRadius.circular(25).w,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      bottom: 15,
                      left: 25,
                      right: 25,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rate your Order",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF00A400),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            // Future.delayed(const Duration(milliseconds: 500),
                            //     () {
                            GoRouter.of(context).push(OrderScreen.routeName);
                            // });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x4A67C33C),
                              borderRadius: BorderRadius.circular(15).w,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Text(
                                    '  Skip ',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: const Color(0xFF337712),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 17,
                                    color: Color(0xFF337712),
                                  ),
                                  SizedBox(width: 3.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: Colors.grey[300],
                ),
                Container(
                  width: double.infinity,
                  color: Color(0xFFFFFFFF),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        height(20.h),
                        Text(
                          "How was your Order ?",
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF00A85A),
                          ),
                        ),
                        height(5.h),
                        PannableRatingBar(
                          rate: rating,
                          items: List.generate(
                              5,
                              (index) => RatingWidget(
                                    selectedColor: Colors.red,
                                    unSelectedColor: Colors.grey,
                                    child: Icon(
                                      Icons.star,
                                      size: 25.sp,
                                    ),
                                  )),
                          onChanged: (value) {
                            if (kDebugMode) {
                              print("03_Rating: $value");
                            }
                          },
                        ),

                        // ),
                        height(15.h),
                      ]),
                ),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: Colors.grey[300],
                ),
                height(20.h),
                Container(
                  child: Text(
                    'What will we do well ?',
                    style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00A85A),
                    ),
                  ),
                ),
                height(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      //   color: Colors.red,
                      width: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star01.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "Product Selection or availability",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      width: 100.w,
                      // height: 100.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star02.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "Delivery Experience",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //    color: Colors.red,
                      width: 100.w,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star03.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "Product Quality",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                height(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/5star_rating_img/5star04.png"),
                        ),
                        height(7.h),
                        SizedBox(
                          width: 100.w,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "Missing or incorrect item",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/5star_rating_img/5star05.png"),
                        ),
                        height(7.h),
                        SizedBox(
                          width: 100.w,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "High Prices",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/5star_rating_img/5star06.png"),
                        ),
                        height(7.h),
                        SizedBox(
                          width: 100.w,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              children: const [
                                TextSpan(
                                  text: "Delay in Delivery",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height(10.h),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: Colors.grey[300],
                ),
                height(15.h),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15).w,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0).r,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF3FEF3),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0).r,
                              borderSide: BorderSide(
                                color: Color(0xFFEBEAEA),
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0).r,
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 30.0),
                            hintText: 'Comments / Suggestions ?',
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      height(20.h),
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showRatingBottomSheet4(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFF034703),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0).r,
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      height(20.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
