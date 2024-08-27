import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constants.dart';
import '../../../../../state/application_state.dart';
import '../../../../../utils/flutter_appBar/flutter_app_bar.dart';
import '../../../../../utils/flutter_scaffold/flutter_scaffold.dart';
import '../../orders_entity/order_model.dart';
import '../order_details_bloc.dart';
import '../order_details_event.dart';

class MediumOrderCanelled extends StatefulWidget {
  const MediumOrderCanelled({super.key});

  @override
  State<MediumOrderCanelled> createState() => _MediumOrderCanelledState();
}

class _MediumOrderCanelledState extends State<MediumOrderCanelled> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Order_DetailsBloc, BaseState>(
      listener: (context, state) {
        // Handle side effects if needed
      },
      builder: (context, state) {
        if (state is InitialState) {
          context.read<Order_DetailsBloc>().add(DetailsInitialContent());
        }

        return FlutterScaffold(
          isLoading: false,
          isAppBar: true,
          toolBarTitleString: "Order cancelled",
          isScrollPhysics: true,
          greenBackground: false,
          backgroundVectorCurve: false,
          backgroundVectorWave: false,
          toolBarIconEnum: IconEnum.back,
          child: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, BaseState state) {
    if (state is SuccessState) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(10.h),
                    Text(
                      'Your Payment was not completed. Any amount if debited will get refunded within 3-5 days.',
                      style: GoogleFonts.poppins(
                        fontSize: 8.sp,
                        color: Color(0xFFED476B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    height(10.h),
                    Text(
                      'Please try placing the order again!',
                      style: GoogleFonts.poppins(
                        fontSize: 6.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    height(15.h),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(15.h),
                      Text(
                        '3 Items in Order',
                        style: GoogleFonts.poppins(
                          fontSize: 8.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      height(7.h),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: (state.successResponse as Orderlist)
                            .imageUrls
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          String imageUrl = (state.successResponse as Orderlist)
                              .imageUrls[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10).h,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 35.w,
                                          height: 85.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFFBBBBBB),
                                              width: 1.0,
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              imageUrl,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        width(7.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "productname",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 8.sp,
                                                  color: Color(0xFF444444),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '1/2 L',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 7.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                width(20.w),
                                                Text(
                                                  '1 Unit',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 7.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        height(10.h),
                                        Text(
                                          '₹120',
                                          style: GoogleFonts.poppins(
                                              fontSize: 9.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '₹145',
                                          style: GoogleFonts.poppins(
                                              fontSize: 6.sp,
                                              color: Color(0xFFED476B),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                height(5.h),
                              ],
                            ),
                          );
                        },
                      ),
                      height(15.h),
                    ],
                  ),
                ),
              ),
              height(15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(15.h),
                    Text(
                      'Bill Summary',
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    height(15.h),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item Total & GST',
                                    style: GoogleFonts.poppins(
                                        fontSize: 8.sp,
                                        color: Color(0xFF444444),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹120',
                                        style: GoogleFonts.poppins(
                                            fontSize: 7.sp,
                                            color: Color(0xFF666666),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      width(7.w),
                                      Text(
                                        '₹145',
                                        style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                            color: Color(0xFF444444),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              height(7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Handling charge',
                                    style: GoogleFonts.poppins(
                                        fontSize: 8.sp,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹120',
                                        style: GoogleFonts.poppins(
                                            fontSize: 7.sp,
                                            color: Color(0xFF666666),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      width(7.w),
                                      Text(
                                        '₹145',
                                        style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                            color: Color(0xFF444444),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              height(7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery Fee',
                                    style: GoogleFonts.poppins(
                                        fontSize: 8.sp,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '₹120',
                                        style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                            color: Color(0xFF666666),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      width(7.w),
                                      Text(
                                        '₹145',
                                        style: GoogleFonts.poppins(
                                            fontSize: 7.sp,
                                            color: Color(0xFF444444),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              height(7.h),
                              Container(
                                height: 1.h,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xFFD9D4D4),
                              ),
                              height(7.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Bill',
                                    style: GoogleFonts.poppins(
                                        fontSize: 9.sp,
                                        color: Color(0xFF444444),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  height(5.h),
                                  Row(
                                    children: [
                                      Text(
                                        '₹120',
                                        style: GoogleFonts.poppins(
                                            fontSize: 8.sp,
                                            color: Color(0xFF666666),
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      width(5.w),
                                      Text(
                                        '₹145',
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.sp,
                                            color: Color(0xFF444444),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              height(5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Incl.all taxes and charges',
                                    style: GoogleFonts.poppins(
                                        fontSize: 5.sp,
                                        color: Color(0xFF898A8D),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF00A85A),
                                      borderRadius: BorderRadius.circular(10).r,
                                    ),
                                    child: Row(
                                      children: [
                                        width(7.w),
                                        Text(
                                          'Saved',
                                          style: GoogleFonts.poppins(
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        width(3.w),
                                        Text(
                                          '₹88',
                                          style: GoogleFonts.poppins(
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        width(7.w),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              height(10.h),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              height(15.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          height(10.h),
                          Text(
                            'Order Details',
                            style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height(10.h),
                          Text(
                            'Order ID',
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: Color(0xFF444444),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '#C142345678912MC3',
                            style: GoogleFonts.poppins(
                              fontSize: 7.sp,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height(10.h),
                          Text(
                            'Delivery at',
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: Color(0xFF444444),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 7.sp,
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w500),
                              ),
                              children: const [
                                TextSpan(
                                    text:
                                        "E101, 1st Floor, AB Avenue, Indira Nagar, Adyar, Chennai, Tamil Nadu"),
                              ],
                            ),
                          ),
                          height(10.h),
                          Text(
                            'Order Placed',
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: Color(0xFF444444),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '21 May 2024, 12:04 Pm',
                            style: GoogleFonts.poppins(
                              fontSize: 7.sp,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height(10.h),
                        ],
                      ),
                    ),
                  );
                },
              ),
              height(30.h),
              Center(
                child: SizedBox(
                  width: 100.w,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF034703),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0.r),
                      ),
                    ),
                    child: Text(
                      "Order Again",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              height(30.h),
            ],
          ));
    } else if (state is ErrorState) {
      return Center(
        child: Text(
          'An error occurred. Please try again later.',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
