import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constants.dart';
import '../../orders_screen.dart';

//Thank you
void showRatingBottomSheet4(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50).r,
        topRight: Radius.circular(50).r,
      ),
    ),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    builder: (BuildContext context) {
      return SizedBox(
        height: 800.h,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              // padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rate your Order",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color(0xFF00A400),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //  color: Color(0x4A67C33C),
                      borderRadius: BorderRadius.circular(10).w,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0).r,
                      child: Row(
                        children: [
                          width(1.w),
                          IconButton(
                            icon: const Icon(Icons.cancel,
                                color: Color(0xFFA9D046)),
                            iconSize: 30.sp, // Set the desired size
                            onPressed: () {
                              Navigator.pop(context);
                              GoRouter.of(context).push(OrderScreen.routeName);
                            },
                          ),
                          width(1.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Color(0xFF67C33C),
              child: Padding(
                padding: EdgeInsets.all(10.0).w,
                child: Row(
                  children: [
                    SizedBox(
                      height: 180.h,
                      width: 150.w,
                      child: Image.asset(
                        'assets/png/rating_img.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fresh produce delivered",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "  at your doorstep",
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   width: 140.w,
                    //   child: RichText(
                    //     textAlign: TextAlign.justify,
                    //     text: TextSpan(
                    //       style: GoogleFonts.poppins(
                    //         textStyle: TextStyle(
                    //           fontSize: 13.sp,
                    //           color: Color(0xFF074B2C),
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //       children: const [
                    //         TextSpan(
                    //           text:
                    //               "Farm Fresh fruits and veggies at your doorstep",
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  height(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check,
                        size: 35.w,
                        color: Color(0xFF337712),
                      ),
                      width(7.w),
                      Text(
                        "Thanks for your Feedback !",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF00A85A),
                        ),
                      ),
                    ],
                  ),
                  height(20.h)
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

///=====
///  void _showRatingBottomSheet(
//       ShowRatingBottomSheetEvent event, Emitter<BaseState> emit) {
//     emit(BottomSheetState());
//   }
///===
///   on<ShowRatingBottomSheetEvent>(_showRatingBottomSheet);
