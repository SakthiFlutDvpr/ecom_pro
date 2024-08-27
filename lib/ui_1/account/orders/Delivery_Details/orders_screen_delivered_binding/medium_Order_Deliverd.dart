import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/ui_1/account/orders/orders_entity/order_model.dart';

import '../../../../../constants/constants.dart';
import '../../../../../state/application_state.dart';
import '../../../../../utils/flutter_appBar/flutter_app_bar.dart';
import '../../../../../utils/flutter_scaffold/flutter_scaffold.dart';
import '../order_details_bloc.dart';
import '../order_details_event.dart';

class MediumDelivered extends StatefulWidget {
  const MediumDelivered({super.key});

  @override
  State<MediumDelivered> createState() => _MediumDeliveredState();
}

class _MediumDeliveredState extends State<MediumDelivered> {
  @override
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
          toolBarTitleString: "Order",
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.check_circle,
                              color: Color(0xFF00A85A),
                              size: 10.sp,
                            ),
                            onPressed: () {},
                          ),
                          width(3.w),
                          Text(
                            "Order Delivered",
                            style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              color: Color(0xFF444444),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Arrived in',
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: Color(0xFF222222),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          height(3.h),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFCDE19A),
                                borderRadius: BorderRadius.circular(10).r),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0).r,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    // width(3.w),
                                    SizedBox(
                                      height: 25.h,
                                      width: 15.w,
                                      child: Image.asset(
                                        "assets/png/electro.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      '6 MINS',
                                      style: GoogleFonts.poppins(
                                        fontSize: 7.sp,
                                        color: Color(0xFF496308),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    width(3.w),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height(15.h),
                  Container(
                    height: 1.h,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFD2CDCD),
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
                      '1 Items in Order',
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    height(7.h),
                    //(state.successResponse as Orderlist).amount
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount:
                          (state.successResponse as Orderlist).imageUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        String imageUrl = (state.successResponse as Orderlist)
                            .imageUrls[index];

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // width: 40.w,
                                      height: 90.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFFBBBBBB),
                                          width: 1.0,
                                        ),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0).r,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0).r,
                                        child: Image.asset(
                                          imageUrl,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    width(15.w),
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
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            width(20.w),
                                            Text(
                                              '1 Unit',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 7.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
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
                                          fontSize: 8.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '₹145',
                                      style: GoogleFonts.poppins(
                                          fontSize: 9.sp,
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
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item Total',
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
                                        fontSize: 8.sp,
                                        color: Color(0xFF666666),
                                        decoration: TextDecoration.lineThrough,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 8.sp,
                                        color: Color(0xFF666666),
                                        decoration: TextDecoration.lineThrough,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 7.sp,
                                        color: Color(0xFF666666),
                                        decoration: TextDecoration.lineThrough,
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
                            color: Color(0xFFD2CDCD),
                          ),
                          height(7.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'To Pay ',
                                style: GoogleFonts.poppins(
                                    fontSize: 9.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '₹145',
                                style: GoogleFonts.poppins(
                                    fontSize: 9.sp,
                                    color: Color(0xFF444444),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          height(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF90D2B3),
                                  border: Border.all(
                                    color: const Color(0xFF90D2B3),
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(10.0).r,
                                ),
                                child: Row(
                                  children: [
                                    width(7.w),
                                    Text(
                                      'Download Invoice',
                                      style: GoogleFonts.poppins(
                                        fontSize: 7.sp,
                                        color: const Color(0xFF057641),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    width(7.w),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  // Container(
                  //   height: 1.h,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color(0xFFD2CDCD),
                  // ),
                  height(20.h),
                ],
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(20.h),
                  Text(
                    'Order Details',
                    style: GoogleFonts.poppins(
                      fontSize: 9.sp,
                      color: Color(0xFF222222),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  height(15.h),
                  Text(
                    'Order ID',
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Your Delivery Address',
                    style: GoogleFonts.poppins(
                      fontSize: 7.sp,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  height(15.h),
                  Text(
                    'Delivery at',
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'E101, 1st Floor, AB Avenue, Indira Nagar, Adyar, Chennai, Tamil Nadu',
                    style: GoogleFonts.poppins(
                      fontSize: 7.sp,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  height(15.h),
                  Text(
                    'Order Placed',
                    style: GoogleFonts.poppins(
                      fontSize: 8.sp,
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.w600,
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
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            height(30.h),
          ],
        ),
      );
    } else if (state is FailureState) {
      return Center(
        child: Text(
          'Failed to load data',
          style: TextStyle(fontSize: 10.sp, color: Colors.red),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
