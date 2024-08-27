// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sel_org/resources/colors/app_colors.dart';
// import 'package:sel_org/ui_1/product_detail/product_detail_screen.dart';
//
// class Searchproduct extends StatefulWidget {
//   final int id;
//   final double salePrice;
//   final double baseCost;
//   final String skuName;
//   final String size;
//
//   const Searchproduct({
//     required this.id,
//     required this.salePrice,
//     required this.baseCost,
//     required this.skuName,
//     required this.size,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Searchproduct> createState() => _SearchproductState();
// }
//
// class _SearchproductState extends State<Searchproduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white,
//       child: Stack(
//         alignment: Alignment.topLeft,
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
//             child: Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     GoRouter.of(context).push(ProductDetailScreeen.routeName);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 80.h,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(1))),
//                         child: Image.asset("asset/png/product_1.png"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(widget.skuName,
//                     maxLines: 2,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xff202020),
//                         overflow: TextOverflow.ellipsis)),
//                 // SizedBox(
//                 //     height: 25.h,
//                 //     //width: screenSize.width * 0.40,
//                 //     child: ProductDropDownMobile(
//                 //         varients: widget.product.varients)),
//                 Flex(
//                   direction: Axis.horizontal,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Rs. ${widget.salePrice.toString().substring(0, 4)}",
//                         style: TextStyle(
//                             fontFamily: "Poppins",
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black)),
//                     // const SizedBox(
//                     //   width: 20,
//                     // ),
//                     Text(widget.baseCost.toString().substring(0, 5),
//                         style: TextStyle(
//                             fontFamily: "Poppins",
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.lineThrough,
//                             color: Colors.grey))
//                   ],
//                 ),
//                 SizedBox(
//                   height: 26.h,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                             onPressed: () {},
//                             style: OutlinedButton.styleFrom(
//                                 side: BorderSide(
//                                     width: 1,
//                                     color: AppColors().primaryDarkGreen),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(13).r))),
//                             child: Text("Add",
//                                 style: TextStyle(
//                                     fontFamily: "Poppins",
//                                     color: AppColors().primaryDarkGreen,
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w600))),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//               child: FractionallySizedBox(
//             widthFactor: 0.5,
//             child: Container(
//               height: 25.h,
//               //width: screenSize.width * 0.20,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: AppColors().primaryDarkGreen,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8).r,
//                       bottomRight: Radius.circular(8).r)),
//               child: FittedBox(
//                 child: Text(widget.id.toString(),
//                     style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//               ),
//             ),
//           )),
//           // if (widget.product.nostock)
//           //   Container(
//           //       color: Colors.transparent.withOpacity(0.8),
//           //       alignment: Alignment.center,
//           //       child: FractionallySizedBox(
//           //         widthFactor: 1.0,
//           //         heightFactor: 0.2,
//           //         child: Container(
//           //           padding: EdgeInsets.symmetric(vertical: 10),
//           //           color: AppColors().primaryDarkGreen,
//           //           alignment: Alignment.center,
//           //           child: Text(
//           //             "Out of stock",
//           //             style: TextStyle(
//           //               fontFamily: "Poppins",
//           //               fontSize: 12.sp,
//           //               fontWeight: FontWeight.bold,
//           //               color: Colors.white,
//           //             ),
//           //           ),
//           //         ),
//           //       ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/constants/constants.dart';

import '../search_entity/search_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF034703),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0).r,
                bottomRight: const Radius.circular(10.0).r,
              ),
            ),
            child: Row(
              children: [
                Text(
                  "  20%",
                  style: GoogleFonts.poppins(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "off",
                  style: GoogleFonts.poppins(
                    fontSize: 10.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: Image.network(
              product.imageURL,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50.sp);
              },
            ),
          ),

          // Product Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.skuName,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                height(5.h),
                Text(
                  product.size,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                height(5.h),
                Text(
                  product.salePrice,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
