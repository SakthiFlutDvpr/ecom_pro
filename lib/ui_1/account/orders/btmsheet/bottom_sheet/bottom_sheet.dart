import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/rate_bloc.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/rate_event.dart';

import '../../../../../constants/constants.dart';
import '../../../../../state/application_state.dart';
import '../../orders_screen.dart';
import '3rating.dart';
import '5rating.dart';

void showRatingBottomSheet1(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => RatingBloc(),
        child: RatingBottomSheet(),
      );
    },
  );
}

class RatingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        double rating = 0.0;

        if (state is RatingUpdatedState) {
          rating = state.rating;
        }

        return SizedBox(
          height: 800.h,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(OrderScreen.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x4A67C33C),
                          borderRadius: BorderRadius.circular(10).w,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0).w,
                          child: Row(
                            children: [
                              Text(
                                '  Skip ',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(0xFF337712),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15.w,
                                color: Color(0xFF337712),
                              ),
                              width(3.w),
                            ],
                          ),
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
                            "Farm Fresh fruits and",
                            style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            " veggies at your doorstep",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    height(20.h),
                    Text(
                      "How was your Order?",
                      style: TextStyle(
                        fontSize: 15.sp,
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
                          showRatingBottomSheet3(context, value);
                        } else {
                          showRatingBottomSheet2(context, value);
                        }
                      },
                    ),
                    height(20.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
