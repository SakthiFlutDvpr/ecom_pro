// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mappls_direction_plugin/mappls_direction_plugin.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_bloc.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';

class CartScreenTab extends CoreWidgets {
  const CartScreenTab({super.key});
  @override
  CoreWidgetsState<CartScreenTab> createState() => _CartScreenMobState();
}

class _CartScreenMobState extends CoreWidgetsState<CartScreenTab> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<CartBloc, BaseState>(
      builder: (context, state) {
        if (state is InitialState) {
          context.read<CartBloc>().add(CartDetailInitialContent(context));
        }

        return FlutterScaffold(
          backgroundVectorCurve: false,
          backgroundVectorWave: false,
          isScrollPhysics: true,
          toolBarTitleString: 'Cart',
          bottomNavBarEnabled: false,
          greenBackground: false,
          isAppBar: true,
          toolBarIconEnum: IconEnum.back,
          child: state is SuccessState
              ? SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        color: Colors.white,
                        width: width,
                        height: height,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.05, vertical: 10.h),
                        width: width,
                        height: 150.h,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Padding(
                                padding: EdgeInsets.only(right: width * 0.20),
                                child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                        text: "Other - ",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 7.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors().fourgrey,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                "13, 8/22,Dr Muthu  Lakshmi Rd13, 8/22,Dr Muthu  Lakshmi Rd, 13, 8/22,Dr Muthu  Lakshmi Rd, D....1313, 8/22,Dr Muthu  Lakshmi Rd,, 8/22,Dr Muthu  Lakshmi RD",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors().sixgrey,
                                            ),
                                          ),
                                        ])),
                              ),
                              trailing: TextButton.icon(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        AppColors().primaryDarkGreen,
                                  ),
                                  icon: Icon(
                                    Icons.location_pin,
                                    size: 7.sp,
                                  ),
                                  label: Text(
                                    "Change",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "To Pay",
                                      style: TextStyle(
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "₹92",
                                      style: TextStyle(
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors().fourgrey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50.h,
                                  // width: width * 0.45,
                                  child: SelorgElevatedButton(
                                    onTap: () {},
                                    text: "CONTINUE TO PAYMENT",
                                    size: 7.sp,
                                  ),
                                ),
                              ],
                            ),
                            Spacer()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        );
      },
      listener: (BuildContext context, BaseState state) {},
    );
  }
}
