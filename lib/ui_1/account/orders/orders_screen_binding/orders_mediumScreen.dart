import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/ui_1/account/orders/orders_bloc.dart';
import 'package:sel_org/ui_1/account/orders/orders_event.dart';

import '../../../../constants/constants.dart';
import '../../../../state/application_state.dart';
import '../../../../utils/flutter_appBar/flutter_app_bar.dart';
import '../../../../utils/flutter_scaffold/flutter_scaffold.dart';
import '../Delivery_Details/orderDeliveredScreen.dart';
import '../Delivery_Details/ordercancelledscreen.dart';
import '../btmsheet/AlertDialog/mediumDialog/medium_dialog.dart';
import '../orders_entity/order_model.dart';

class Ordermediumscreen extends StatefulWidget {
  const Ordermediumscreen({super.key});

  @override
  State<Ordermediumscreen> createState() => _OrdermediumscreenState();
}

class _OrdermediumscreenState extends State<Ordermediumscreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderBloc()),
      ],
      child: BlocConsumer<OrderBloc, BaseState>(
        listener: (context, state) {
          if (state is ShowBottomSheetState) {
            showRatingmediumDialog(context);
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is InitialState) {
            context.read<OrderBloc>().add(OrderInitialEvent(context));
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
      ),
    );
  }

  Widget _buildBody(BuildContext context, BaseState state) {
    if (state is LoadingState) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    } else if (state is SuccessState && state.successResponse.isNotEmpty) {
      List<Orderlist> orders = state.successResponse as List<Orderlist>;
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ).r,
            child: Column(
              children: [
                height(60.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    Orderlist order = orders[index];
                    return GestureDetector(
                      onTap: () {
                        if (order.status == 'Order Delivered') {
                          GoRouter.of(context).push(
                              OrderDeliveredScreen.routeName,
                              extra: order);
                        } else if (order.status == 'Order Cancelled') {
                          GoRouter.of(context).push(
                              OrderCancelledScreen.routeName,
                              extra: order);
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                height(20.h),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, right: 20)
                                          .w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height(15.h),
                                      SizedBox(
                                        height: 100.h,
                                        child: order.imageUrls.length > 1
                                            ? ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    order.imageUrls.length,
                                                itemBuilder:
                                                    (context, imageIndex) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.w),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFFBBBBBB),
                                                          width: 1.0,
                                                        ),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                    .circular(
                                                                        10.0)
                                                                .r,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .all(8.0)
                                                                .r,
                                                        child: Image.asset(
                                                          order.imageUrls[
                                                              imageIndex],
                                                          // width: 45.w,
                                                          // height: 50.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFFBBBBBB),
                                                    width: 1.0,
                                                  ),
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                              10.0)
                                                          .r,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0)
                                                          .r,
                                                  child: Image.asset(
                                                    order.imageUrls.first,
                                                    width: 45.w,
                                                    height: 50.h,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      height(9.h),
                                      Row(
                                        children: [
                                          Text(
                                            order.status,
                                            style: GoogleFonts.poppins(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          width(3.w),
                                          Icon(
                                            order.status == 'Order Delivered'
                                                ? Icons.check_circle_rounded
                                                : Icons.cancel,
                                            color: order.status ==
                                                    'Order Delivered'
                                                ? const Color(0xFF00A85A)
                                                : Colors.grey,
                                            size: 9.sp,
                                          ),
                                        ],
                                      ),
                                      height(5.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                order.date,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 7.sp,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                ' , ',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 7.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                order.time,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 7.sp,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '₹ ',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.start,
                                                text: TextSpan(
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: const Color(
                                                            0xFF666666),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: order.amount,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 9.w),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                                size: 9.w,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )

                                      // height(5.h),
                                    ],
                                  ),
                                ),
                                height(7.h),
                                Container(
                                  width: double.infinity,
                                  height: 1.02,
                                  color: Colors.grey[300],
                                ),
                                height(7.h),
                                Center(
                                  child: order.status == 'Order Cancelled'
                                      ? GestureDetector(
                                          onTap: () {
                                            context.push(
                                              '/orderAgain',
                                              extra: order,
                                            );
                                          },
                                          child: Text(
                                            order.orderdetails,
                                            style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<OrderBloc>(context)
                                                .add(
                                                    ShowRatingBottomSheetEvent());
                                          },
                                          child: Text(
                                            order.orderdetails,
                                            style: GoogleFonts.poppins(
                                              color: Colors.red,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                ),
                                height(7.h),
                              ],
                            ),
                          ),
                          height(20.h),
                        ],
                      ),
                    );
                  },
                ),
                //  height(10.h),
              ],
            ),
          ),
          height(25.h),
          SizedBox(
            width: 80.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(8.0).r,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0).r,
                  side: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
              child: Row(
                children: [
                  width(5.w),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                    size: 12.sp,
                  ),
                  width(2.w),
                  Text(
                    'Load More',
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          height(15.h),
        ],
      );
    } else if (state is SuccessState && state.successResponse.isEmpty) {
      return Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
                width: 70.w,
                child: Image.asset("assets/png/order_icon.png"),
              ),
              width(7.w),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 17.sp,
                          color: const Color(0xFF666666),
                          fontWeight: FontWeight.w500),
                    ),
                    children: const [
                      TextSpan(
                        text:
                            'No orders placed yet. Start exploring and items to your cart !',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                //   width: double.infinity,
                height: 40.h,
                width: 200.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF034703),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0.r),
                    ),
                  ),
                  child: Text(
                    "Browser Now",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Unknown state'),
          ],
        ),
      );
    }
  }
}
