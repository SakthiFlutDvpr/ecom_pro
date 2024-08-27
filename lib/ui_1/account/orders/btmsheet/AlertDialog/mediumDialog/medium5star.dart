import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constants/constants.dart';
import '../../../orders_screen.dart';
import 'mediumtq&feedback.dart';

//5star open
void showRatingAlertDialog3medium(
  BuildContext context,
  double rating,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0).r,
        ),
        contentPadding: EdgeInsets.zero,
        title: Column(
          children: [
            height(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate your Order",
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.red,
                    // color: const Color(0xFF00A400),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // width(10.w),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(OrderScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x4A67C33C),
                      borderRadius: BorderRadius.circular(7).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0).r,
                      child: Row(
                        children: [
                          Text(
                            '  Skip ',
                            style: GoogleFonts.poppins(
                                fontSize: 8.sp,
                                color: const Color(0xFF337712),
                                fontWeight: FontWeight.w500),
                          ),
                          width(1.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 8.w,
                            color: Color(0xFF337712),
                          ),
                          width(1.w),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            height(20.h),
            Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.grey[300],
            ),
            height(40.h),
          ],
        ),
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100.h,
                width: 300.w,
                child: Column(
                  children: [
                    Text(
                      "How was your Order?",
                      style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          color: Color(0xFF00A85A),
                          fontWeight: FontWeight.w500),
                    ),
                    height(15.h),
                    PannableRatingBar(
                      rate: rating,
                      items: List.generate(
                        5,
                        (index) => RatingWidget(
                          selectedColor: Colors.red,
                          unSelectedColor: Colors.grey,
                          child: Icon(
                            Icons.star,
                            size: 13.sp,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (kDebugMode) {
                          print("Rating changed: $value");
                        }
                      },
                    ),
                  ],
                ),
              ),
              height(15.h),
              Container(
                child: Text(
                  'What will we do well ?',
                  style: GoogleFonts.poppins(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00A85A),
                  ),
                ),
              ),
              height(25.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(50.h),
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star01.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star02.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star03.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star04.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star05.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            child: Image.asset(
                                "assets/png/5star_rating_img/5star06.png"),
                          ),
                          height(7.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 7.sp,
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
                        ],
                      ),
                    ),
                    height(50.h),
                  ],
                ),
              ),
              height(15.h),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Colors.grey[300],
              ),
              height(15.h),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ).w,
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3FEF3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: Color(0xFFEBEAEA),
                            width: 1.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20.0)
                            .r,
                        hintText: 'Comments / Suggestions ?',
                        hintStyle: TextStyle(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  height(20.h),
                  Container(
                    height: 50.h,
                    width: 150.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        //  showRatingBottomSheet4(context);
                        showRatingAlertDialogfeedbackmedium(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF034703),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0).r,
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  height(20.h),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
