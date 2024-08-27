import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constants/constants.dart';
import '../../../orders_screen.dart';

void showRatingAlertDialogfeedback(
  BuildContext context,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Rate your Order",
                  style: TextStyle(
                    fontSize: 5.sp,
                    color: const Color(0xFF00A400),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // width(10.w),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(OrderScreen.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1.0).r,
                    child: Row(
                      children: [
                        width(1.w),
                        IconButton(
                          icon: Icon(Icons.cancel, color: Color(0xFFA9D046)),
                          iconSize: 8.sp,
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
            height(5.h),
          ],
        ),
        contentPadding: const EdgeInsets.all(0).r,
        content: Padding(
          padding: const EdgeInsets.only(bottom: 20).h,
          child: Container(
            height: 200.h,
            width: 130.w,
            color: Color(0xFF67C33C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 160.h,
                  //   width: 60.w,
                  child: Image.asset(
                    'assets/png/rating_img.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // RichText(
                      //   textAlign: TextAlign.justify,
                      //   text: TextSpan(
                      //     style: GoogleFonts.poppins(
                      //       textStyle: TextStyle(
                      //         fontSize: 5.sp,
                      //         color: Color(0xFF074B2C),
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     children: const [
                      //       TextSpan(
                      //         text:
                      //             "Farm Fresh fruits and veggies at your doorstep",
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Text(
                        "Fresh produce delivered at ",
                        style: GoogleFonts.poppins(
                            fontSize: 5.5.sp,
                            color: Color(0xFF074B2C),
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "your doorstep",
                        style: GoogleFonts.poppins(
                            fontSize: 5.5.sp,
                            color: Color(0xFF074B2C),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Thanks for your Feedback !",
                  style: GoogleFonts.poppins(
                      fontSize: 5.sp,
                      color: Color(0xFF00A85A),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
