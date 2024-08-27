import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/resources/colors/app_colors.dart';

import 'package:sel_org/ui_1/sub_categories/subcategory_entity/sub_category_model.dart';

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard(
      {super.key,
      required this.subCategory,
      required this.index,
      required this.value});

  final SubcategoryModel subCategory;
  final int index;
  final ValueNotifier value;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var descript = subCategory.categoryDesc.toString().split(' ').map((e) {
      return e[0].toUpperCase() + e.substring(1).toLowerCase();
    }).join(' ');
    return Container(
      padding: width <= 650
          ? EdgeInsets.symmetric(horizontal: 4.w)
          : width >= 650 && width <= 1100
              ? EdgeInsets.symmetric(horizontal: 4.w)
              : EdgeInsets.symmetric(horizontal: 2.w, vertical: 16.h),
      margin: width <= 650
          ? EdgeInsets.symmetric(vertical: 2.h)
          : width >= 650 && width <= 1100
              ? EdgeInsets.symmetric(vertical: 2.h)
              : EdgeInsets.symmetric(vertical: 0.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:
              index == value.value ? Colors.green.shade200 : Colors.transparent,
          border: Border(
              left: index == value.value
                  ? BorderSide(width: 3, color: AppColors().primaryDarkGreen)
                  : const BorderSide(width: 0, color: Colors.transparent))),
      child: width <= 650
          ? SizedBox(
              height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 50.h, child: Image.network(subCategory.imageUrl)),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  Text(descript.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2)
                ],
              ),
            )
          : width >= 650 && width <= 1100
              ? SizedBox(
                  height: 120.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 60.h,
                          child: Image.network(subCategory.imageUrl)),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      Text(descript.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 6.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2)
                    ],
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        backgroundColor:
                            index == value.value ? Colors.white : null,
                        radius: 30.r,
                        child: Image.network(subCategory.imageUrl)),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(descript.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 4.sp,
                              fontWeight: index == value.value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index == value.value
                                  ? AppColors().primaryDarkGreen
                                  : Colors.black),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    )
                  ],
                ),
    );
  }
}
