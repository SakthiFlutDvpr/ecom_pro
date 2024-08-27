// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_screen.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/dropdown_btn.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';

import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/update_button.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
        create: (_) => ProductBloc(widget.productModel), child: Product());
  }
}

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);

    return BlocBuilder<ProductBloc, BaseState>(
        bloc: productBloc,
        builder: (context, state) {
          // Varient? varient;
          // if (state is SuccessState) {
          //   varient = state.successResponse as Varient;
          // }
          return Stack(
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
                              : 40.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                            ProductDetailScreeen.routeName,
                            extra: productBloc);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              height: width <= 650
                                  ? 125.h
                                  : width >= 650 && width <= 1100
                                      ? 120.h
                                      : 200.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1).r)),
                              child: Image.asset(
                                productBloc.productModel.imageUrl,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(productBloc.varient.title,
                        // varient != null
                        //     ? varient.title
                        //     : productBloc.productModel.title,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: "Poppins-SemiBold",
                            fontSize: width <= 650
                                ? 11.sp
                                : width >= 650 && width <= 1100
                                    ? 7.sp
                                    : 4.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff202020),
                            overflow: TextOverflow.ellipsis)),
                    SizedBox(
                        height: width <= 650
                            ? 26.h
                            : width >= 650 && width <= 1100
                                ? 24.h
                                : 40.h,
                        //width: screenSize.width * 0.40,
                        child: ProductDropDown(
                          productBloc: productBloc,
                        )),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            " ₹ ${productBloc.varient.price.toString().substring(0, 4)}",
                            // "Rs. ${varient != null ? varient.price.toString().substring(0, 4)
                            // : productBloc.productModel.price.toString().substring(0, 4)}",
                            style: TextStyle(
                                fontFamily: "Poppins-Bold",
                                fontSize: width <= 650
                                    ? 12.sp
                                    : width >= 650 && width <= 1100
                                        ? 8.sp
                                        : 4.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                            " ₹ ${productBloc.varient.mrp.toString().substring(0, 4)}",
                            // "Rs. ${varient != null ? varient.mrp.toString().substring(0, 4)
                            // : productBloc.productModel.mrp.toString().substring(0, 4)}",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: width <= 650
                                    ? 10.sp
                                    : width >= 650 && width <= 1100
                                        ? 6.sp
                                        : 3.5.sp,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0xff969696),
                                color: Color(0xff969696)))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: width <= 650
                              ? 30.h
                              : width >= 650 && width <= 1100
                                  ? 30.h
                                  : 40.h,
                          child: UpdateButton(
                            productBloc: productBloc,
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  child: FractionallySizedBox(
                widthFactor: 0.4,
                child: Container(
                  height: width <= 650
                      ? 25.h
                      : width >= 650 && width <= 1100
                          ? 30.h
                          : 40.h,
                  //width: screenSize.width * 0.20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors().primaryDarkGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12).r,
                          bottomRight: Radius.circular(12).r)),
                  child: FittedBox(
                    child: Text(productBloc.varient.offer,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 10.sp
                                : width >= 650 && width <= 1100
                                    ? 6.sp
                                    : 3.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              )),
              if (productBloc.productModel.isStocked == "yes")
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
          );
        });
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
