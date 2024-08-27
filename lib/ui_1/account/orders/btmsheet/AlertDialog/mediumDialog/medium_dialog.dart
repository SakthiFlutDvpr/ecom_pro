import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/rate_bloc.dart';

import '../../../../../../constants/constants.dart';
import '../../../../../../state/application_state.dart';
import '../../../orders_screen.dart';
import '../../rate_event.dart';
import 'medium3star.dart';
import 'medium5star.dart';

void showRatingmediumDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => RatingBloc(),
        child: RatingDialog(),
      );
    },
  );
}

class RatingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        double rating = 0.0;

        if (state is RatingUpdatedState) {
          rating = state.rating;
        }

        return AlertDialog(
          title: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Rate your Order",
                      style: TextStyle(
                        fontSize: 10.sp,
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
                          padding: const EdgeInsets.all(2.0).r,
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
                                size: 10.w,
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
              ),
              height(15.h),
            ],
          ),
          content: Container(
            height: 170.h,
            width: 250.w,
            color: Color(0xFF67C33C),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  width(5.w),
                  SizedBox(
                    height: 170.h,
                    //   width: 60.w,
                    child: Image.asset(
                      'assets/png/rating_img.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
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
                          "Farm Fresh fruits and",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Color(0xFF074B2C),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " veggies at your doorstep",
                          style: GoogleFonts.poppins(
                              fontSize: 10.sp,
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
          contentPadding: EdgeInsets.all(0),
          actions: [
            SizedBox(
              height: 85.h,
              width: double.infinity,
              child: Column(
                children: [
                  height(15.h),
                  Text(
                    "How was your Order?",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: Color(0xFF00A85A),
                        fontWeight: FontWeight.w500),
                  ),
                  height(10.h),
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

                      BlocProvider.of<RatingBloc>(context)
                          .add(UpdateRatingEvent(value));
                      Navigator.of(context).pop();

                      if (value >= 3) {
                        showRatingAlertDialog3medium(context, value);
                      } else {
                        showRatingAlertDialog5starmedium(context, value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
