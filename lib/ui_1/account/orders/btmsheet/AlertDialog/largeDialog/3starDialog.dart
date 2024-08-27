import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/AlertDialog/largeDialog/tq&feedbackDialog.dart';
import '../../../../../../constants/constants.dart';
import '../../../orders_screen.dart';

//3star open
void showRatingAlertDialog5star(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rate your Order",
                  style: TextStyle(
                    fontSize: 5.sp,
                    // color: Colors.red,
                    color: const Color(0xFF00A400),
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
                                fontSize: 4.5.sp,
                                color: const Color(0xFF337712),
                                fontWeight: FontWeight.w500),
                          ),
                          width(1.w),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 4.w,
                            color: const Color(0xFF337712),
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
                height: 130.h,
                width: 200.w,
                child: Column(
                  children: [
                    Text(
                      "How was your Order?",
                      style: GoogleFonts.poppins(
                          fontSize: 5.sp,
                          color: const Color(0xFF00A85A),
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
                            size: 8.sp,
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
              Text(
                'What will we do well ?',
                style: GoogleFonts.poppins(
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF00A85A),
                ),
              ),
              height(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(50.h),
                  SizedBox(
                    width: 25.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/3star_rating_img/rate1.png"),
                        ),
                        height(7.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 3.5.sp,
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
                    width: 25.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/3star_rating_img/rate2.png"),
                        ),
                        height(7.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 3.5.sp,
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
                    width: 25.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/3star_rating_img/rate3.png"),
                        ),
                        height(7.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 3.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            children: const [
                              TextSpan(
                                text: "Fair Prices",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/3star_rating_img/rate4.png"),
                        ),
                        height(7.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 3.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            children: const [
                              TextSpan(
                                text: "Product Selection",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                              "assets/png/3star_rating_img/rate5.png"),
                        ),
                        height(7.h),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 3.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            children: const [
                              TextSpan(
                                text: "On Time Delivery",
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
                        fillColor: const Color(0xFFF3FEF3),
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
                            horizontal: 30.0, vertical: 20.0),
                        hintText: 'Comments / Suggestions ?',
                        hintStyle: TextStyle(
                          fontSize: 3.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  height(20.h),
                  SizedBox(
                    height: 60.h,
                    width: 100.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showRatingAlertDialogfeedback(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF034703),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.poppins(
                          fontSize: 5.sp,
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
