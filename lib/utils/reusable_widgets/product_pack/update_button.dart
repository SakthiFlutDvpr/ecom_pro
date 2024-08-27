import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_event.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key, required this.productBloc});
  final ProductBloc productBloc;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<ProductBloc, BaseState>(
        bloc: productBloc,
        builder: (context, state) {
          return productBloc.varient.quantity <= 0
              ? OutlinedButton(
                  onPressed: () {
                    productBloc.add(ProductClickedEvent());
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: 1, color: AppColors().primaryDarkGreen),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(width <= 650
                              ? const Radius.circular(14).r
                              : width >= 650 && width <= 1100
                                  ? const Radius.circular(16).r
                                  : const Radius.circular(20).r))),
                  child: Text("Add",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColors().primaryDarkGreen,
                          fontSize: width <= 650
                              ? 11.sp
                              : width >= 650 && width <= 1100
                                  ? 7.sp
                                  : 4.sp,
                          fontWeight: FontWeight.w600)))
              : Container(
                  decoration: BoxDecoration(
                    color: AppColors().primaryDarkGreen,
                    borderRadius: width <= 650
                        ? BorderRadius.all(const Radius.circular(6).r)
                        : BorderRadius.all(const Radius.circular(8).r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          productBloc.add(ProductDecreamentEvent());
                        },
                        child: Container(
                          padding: width <= 650
                              ? EdgeInsets.symmetric(horizontal: 8.w)
                              : width >= 650 && width <= 1100
                                  ? EdgeInsets.symmetric(horizontal: 5.w)
                                  : EdgeInsets.symmetric(horizontal: 3.w),
                          alignment: Alignment.center,
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontSize: width <= 650
                                    ? 12.sp
                                    : width >= 650 && width <= 1100
                                        ? 8.sp
                                        : 5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: width <= 650
                              ? EdgeInsets.symmetric(vertical: 4.h)
                              : width >= 650 && width <= 1100
                                  ? EdgeInsets.symmetric(vertical: 4.h)
                                  : EdgeInsets.symmetric(vertical: 4.h),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            productBloc.varient.quantity.toString(),
                            style: TextStyle(
                                fontSize: width <= 650
                                    ? 11.sp
                                    : width >= 650 && width <= 1100
                                        ? 7.sp
                                        : 4.sp,
                                color: AppColors().primaryDarkGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          productBloc.add(ProductIncreamentEvent());
                        },
                        child: Container(
                          padding: width <= 650
                              ? EdgeInsets.symmetric(horizontal: 8.w)
                              : width >= 650 && width <= 1100
                                  ? EdgeInsets.symmetric(horizontal: 5.w)
                                  : EdgeInsets.symmetric(horizontal: 3.w),
                          alignment: Alignment.center,
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: width <= 650
                                    ? 12.sp
                                    : width >= 650 && width <= 1100
                                        ? 8.sp
                                        : 5.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
