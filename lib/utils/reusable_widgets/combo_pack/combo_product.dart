// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_screen.dart';

import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class ComboProduct extends StatefulWidget {
  const ComboProduct({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ComboProduct> createState() => _ComboProductState();
}

class _ComboProductState extends State<ComboProduct> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            padding: width <= 650
                ? EdgeInsets.only(left: 8.w, right: 8.w, bottom: 10.h)
                : width >= 650 && width <= 1100
                    ? EdgeInsets.only(left: 4.w, right: 4.w, bottom: 10.h)
                    : EdgeInsets.only(left: 2.w, right: 2.w, bottom: 15.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12).r)),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: width <= 650
                      ? 25.h
                      : width >= 650 && width <= 1100
                          ? 30.h
                          : 35.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: width <= 650
                            ? 80.h
                            : width >= 650 && width <= 1100
                                ? 120.h
                                : 150.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1).r)),
                        child: Image.asset(
                          widget.productModel.imageUrl,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(widget.productModel.title,
                    // varient != null
                    //     ? varient.title
                    //     : productBloc.productModel.title,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: width <= 650
                            ? 10.sp
                            : width >= 650 && width <= 1100
                                ? 7.sp
                                : 4.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff202020),
                        overflow: TextOverflow.ellipsis)),
                SizedBox(
                  height: width <= 650
                      ? 24.h
                      : width >= 650 && width <= 1100
                          ? 28.h
                          : 32.h,
                  //width: screenSize.width * 0.40,
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(4).r),
                      child: Text(
                        "Combo pack - 3 items",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 10.sp
                                : width >= 650 && width <= 1100
                                    ? 6.sp
                                    : 3.5.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        " Rs. ${widget.productModel.price.toString().substring(0, 4)}",
                        // "Rs. ${varient != null ? varient.price.toString().substring(0, 4)
                        // : productBloc.productModel.price.toString().substring(0, 4)}",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 11.sp
                                : width >= 650 && width <= 1100
                                    ? 8.sp
                                    : 4.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Text(
                        " Rs. ${widget.productModel.mrp.toString().substring(0, 4)}",
                        // "Rs. ${varient != null ? varient.mrp.toString().substring(0, 4)
                        // : productBloc.productModel.mrp.toString().substring(0, 4)}",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 10.sp
                                : width >= 650 && width <= 1100
                                    ? 6.sp
                                    : 3.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey))
                  ],
                ),
                SizedBox(
                  height: width <= 650
                      ? 28.h
                      : width >= 650 && width <= 1100
                          ? 32.h
                          : 38.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1,
                                    color: AppColors().primaryDarkGreen),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8).r))),
                            child: Text("Add",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: AppColors().primaryDarkGreen,
                                    fontSize: width <= 650
                                        ? 10.sp
                                        : width >= 650 && width <= 1100
                                            ? 6.sp
                                            : 3.5.sp,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              height: width <= 650
                  ? 25.h
                  : width >= 650 && width <= 1100
                      ? 30.h
                      : 35.h,
              //width: screenSize.width * 0.20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors().primaryDarkGreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12).r,
                      bottomRight: Radius.circular(12).r)),
              child: FittedBox(
                child: Text(widget.productModel.offer,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: width <= 650
                            ? 10.sp
                            : width >= 650 && width <= 1100
                                ? 6.sp
                                : 3.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )),
          if (widget.productModel.isStocked != "yes")
            Container(
                color: Colors.transparent.withOpacity(0.7),
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  heightFactor: 0.2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: width <= 650
                            ? 20.h
                            : width >= 650 && width <= 1100
                                ? 15.h
                                : 10.h),
                    color: AppColors().primaryDarkGreen,
                    alignment: Alignment.center,
                    child: Text(
                      "Out of stock",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: width <= 650
                            ? 12.sp
                            : width >= 650 && width <= 1100
                                ? 8.sp
                                : 4.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}

///////////////////////// product for desktop layout ////////////////////////////

// class ProductDesk extends StatefulWidget {
//   const ProductDesk({super.key, required this.productModel});

//   final ProductModel productModel;

//   @override
//   State<ProductDesk> createState() => _ProductDeskState();
// }

// class _ProductDeskState extends State<ProductDesk> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductBloc, BaseState>(builder: (context, state) {
//       Varient? currentVarient;

//       if (state is SuccessState) {
//         currentVarient = state.successResponse;
//       }
//       return Card(
//         color: Colors.white,
//         child: Stack(
//           alignment: Alignment.topLeft,
//           children: [
//             Container(
//               padding:
//               child: Flex(
//                 direction: Axis.vertical,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height:,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       GoRouter.of(context).push(ProductDetailScreeen.routeName);
//                     },
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             height:
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(1).r)),
//                             child: Image.asset(
//                               widget.productModel.imageUrl,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                       currentVarient != null
//                           ? currentVarient.title
//                           : widget.productModel.title,
//                       maxLines: 2,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize:
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xff202020),
//                           overflow: TextOverflow.ellipsis)),
//                   SizedBox(
//                       height:
//                       //width: screenSize.width * 0.40,
//                       child: ProductDropDownDesk(
//                           varients: widget.productModel.varients)),
//                   Flex(
//                     direction: Axis.horizontal,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                           "Rs. ${currentVarient != null ? currentVarient.price.toString().substring(0, 5) : widget.productModel.price.toString().substring(0, 4)}",
//                           style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontSize:
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black)),
//                       Text(
//                           currentVarient != null
//                               ? currentVarient.mrp.toString().substring(0, 5)
//                               : widget.productModel.mrp
//                                   .toString()
//                                   .substring(0, 5),
//                           style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontSize:
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.lineThrough,
//                               color: Colors.grey))
//                     ],
//                   ),
//                   SizedBox(
//                     // width: screenSize.width * 0.40,
//                     height:
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: OutlinedButton(
//                               onPressed: () {},
//                               style: OutlinedButton.styleFrom(
//                                   side: BorderSide(
//                                       width: 1,
//                                       color: AppColors().primaryDarkGreen),
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(13)))),
//                               child: Text("Add",
//                                   style: TextStyle(
//                                       fontFamily: "Poppins",
//                                       color: AppColors().primaryDarkGreen,
//                                       fontSize:
//                                       fontWeight: FontWeight.w600))),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Positioned(
//                 child: FractionallySizedBox(
//               widthFactor: 0.5,
//               child: Container(
//                 height:
//                 //width: screenSize.width * 0.20,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     color: AppColors().primaryDarkGreen,
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(8),
//                         bottomRight: Radius.circular(8))),
//                 child: FittedBox(
//                   child: Text(widget.productModel.offer,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize:
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white)),
//                 ),
//               ),
//             )),
//             if (widget.productModel.nostock)
//               Container(
//                   color: Colors.transparent.withOpacity(0.8),
//                   alignment: Alignment.center,
//                   child: FractionallySizedBox(
//                     widthFactor: 1.0,
//                     heightFactor: 0.2,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       color: AppColors().primaryDarkGreen,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Out of stock",
//                         style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize:
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ))
//           ],
//         ),
//       );
//     });
//   }
// }

class ComboProductMobile extends StatefulWidget {
  const ComboProductMobile({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ComboProductMobile> createState() => _ComboProductMobileState();
}

class _ComboProductMobileState extends State<ComboProductMobile> {
  ProductModel? varient;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(ProductDetailScreeen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(1))),
                          child: Image.asset(
                            widget.productModel.imageUrl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(widget.productModel.title,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis)),
                Container(
                    height: 25.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8).r),
                    child: Text(
                      "Combo pack - 3 items",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )),
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        varient != null
                            ? varient!.price
                            : widget.productModel.price,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Text(
                        varient != null
                            ? varient!.mrp
                            : widget.productModel.mrp,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),
                  ],
                ),
                SizedBox(
                  height: 26.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1,
                                    color: AppColors().primaryDarkGreen),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(13).r))),
                            child: Text("Add",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: AppColors().primaryDarkGreen,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              height: 25.h,
              //width: screenSize.width * 0.20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffECAF01),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8).r,
                      bottomRight: Radius.circular(8).r)),
              child: FittedBox(
                child: Text("Combo",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
