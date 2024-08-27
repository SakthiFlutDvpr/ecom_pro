import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/add_button.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class VarientBox extends StatelessWidget {
  const VarientBox({
    super.key,
    required this.varient,
    required this.bloc,
  });

  final Varient varient;
  final ProductBloc bloc;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<ProductBloc, BaseState>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            padding: width <= 650
                ? EdgeInsets.symmetric(
                    horizontal: 4.w,
                  )
                : width >= 650 && width <= 1100
                    ? EdgeInsets.symmetric(
                        horizontal: 4.w,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(const Radius.circular(4).r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(varient.size.toString(),
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 11.sp
                                : width >= 650 && width <= 1100
                                    ? 7.sp
                                    : 4.sp,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey.shade200,
                          padding: EdgeInsets.all(4.r),
                          child: Text(varient.offer,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: width <= 650
                                      ? 10.sp
                                      : width >= 650 && width <= 1100
                                          ? 6.sp
                                          : 3.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff49C949))),
                        ),
                        SizedBox(
                          width: width <= 650
                              ? 5.w
                              : width >= 650 && width <= 1100
                                  ? 3.w
                                  : 2.w,
                        ),
                        Text("₹${varient.price}".toString().substring(0, 5),
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: width <= 650
                                    ? 11.sp
                                    : width >= 650 && width <= 1100
                                        ? 7.sp
                                        : 4.sp,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: width <= 650
                              ? 5.w
                              : width >= 650 && width <= 1100
                                  ? 3.w
                                  : 2.w,
                        ),
                        Text(
                          "₹${varient.mrp}".toString().substring(0, 5),
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: width <= 650
                                ? 10.sp
                                : width >= 650 && width <= 1100
                                    ? 6.sp
                                    : 3.sp,
                            color: const Color(0xff969696),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                    width: width <= 650
                        ? 45.w
                        : width >= 650 && width <= 1100
                            ? 30.w
                            : 18.w,
                    height: width <= 650
                        ? 30.h
                        : width >= 650 && width <= 1100
                            ? 35.h
                            : 40.h,
                    child: ProductAddButton(
                      bloc: bloc,
                      varient: varient,
                    ))
              ],
            ),
          );
        });
  }
}

///////////////// varient box for desk top layout //////////////////////

// class VarientBoxDesk extends StatelessWidget {
//   const VarientBoxDesk({super.key, required this.varient});

//   final Varient varient;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding:
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.grey),
//           borderRadius: BorderRadius.all(const Radius.circular(4).r)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(varient.gram,
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize:
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     color: Colors.grey.shade200,
//                     padding: EdgeInsets.all(4.r),
//                     child: Text(varient.offer,
//                         style: TextStyle(
//                             fontFamily: "Poppins",
//                             fontSize: 
//                             fontWeight: FontWeight.bold,
//                             color: const Color(0xff49C949))),
//                   ),
//                   SizedBox(width: ),
//                   Text("₹${varient.price}".toString().substring(0, 5),
//                       style: TextStyle(
//                           fontFamily: "Poppins",
//                           fontSize:
//                           fontWeight: FontWeight.bold)),
//                   SizedBox(width: ),
//                   Text(
//                     "₹${varient.mrp}".toString().substring(0, 5),
//                     style: TextStyle(
//                       fontFamily: "Poppins",
//                       fontSize:
//                       color: const Color(0xff969696),
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.lineThrough,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//               width: 
//               height: 
//               child: OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                     // backgroundColor: AppColors().primaryDarkGreen,
//                     side: BorderSide(color: AppColors().primaryDarkGreen),
//                     padding: const EdgeInsets.symmetric(),
//                     shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.all(const Radius.circular(25).r))),
//                 child: Text("Add",
//                     style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontSize:
//                         fontWeight: FontWeight.bold,
//                         color: AppColors().primaryDarkGreen)),
//               ))
//         ],
//       ),
//     );
//   }
// }
