import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/utils/reusable_widgets/combo_pack/combo_product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class AdditionalMenuItem extends StatelessWidget {
  const AdditionalMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        alignment: Alignment.center,
        child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return
                        //Padding(
                        // padding: width <= 650
                        //     ? EdgeInsets.symmetric(
                        //         vertical: 0, horizontal: width * 0.16)
                        //     : width >= 650 && width <= 1100
                        //         ? EdgeInsets.symmetric(
                        //             vertical: 0, horizontal: width * 0.12)
                        //         : EdgeInsets.symmetric(
                        //             vertical: 0, horizontal: width * 0.25),
                        Padding(
                      padding: width <= 650
                          ? EdgeInsets.symmetric(
                              vertical: 0, horizontal: width * 0.15)
                          : const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                      child: Dialog(
                        backgroundColor: const Color(0xffDDD8D8),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(16).r)),
                        child: Container(
                          width: width <= 650
                              ? 185.w
                              : width >= 650 && width <= 1100
                                  ? 230.w
                                  : 180.w,
                          height: width <= 650
                              ? 400.h
                              : width >= 650 && width <= 1100
                                  ? 450.h
                                  : 550.h,
                          alignment: Alignment.center,
                          padding: width <= 650
                              ? EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 50.h)
                              : width >= 650 && width <= 1100
                                  ? EdgeInsets.symmetric(
                                      horizontal: 25.w, vertical: 50.h)
                                  : EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 50.h),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: width <= 650
                                    ? 135.w
                                    : width >= 650 && width <= 1100
                                        ? 90.w
                                        : 50.w,
                                height: width <= 650
                                    ? 300.h
                                    : width >= 650 && width <= 1100
                                        ? 350.h
                                        : 450.h,
                                child: ComboProduct(
                                    productModel: productList.first),
                              );
                            },
                            itemCount: 3,
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: width <= 650
                  ? 35.h
                  : width >= 650 && width <= 1100
                      ? 40.h
                      : 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffCACACA),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(5).r,
                  )),
              child: Text("+ More Combo",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width <= 650
                          ? 11.sp
                          : width >= 650 && width <= 1100
                              ? 7.sp
                              : 4.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )));
  }
}

// class AdditionalMenuItemDesk extends StatefulWidget {
//   const AdditionalMenuItemDesk({super.key});

//   @override
//   State<AdditionalMenuItemDesk> createState() => _AdditionalMenuItemDeskState();
// }

// class _AdditionalMenuItemDeskState extends State<AdditionalMenuItemDesk> {
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Container(
//       alignment: Alignment.center,
//       child: GestureDetector(
//         onTap: () {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: 0, horizontal: screenSize.width * 0.14),
//                   child: Dialog(
//                     backgroundColor: const Color(0xffDDD8D8),
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(16))),
//                     child: Container(
//                       height: 350.h,
//                       child: ListView.builder(itemBuilder: (context, index) {
//                         return ComboProductMobile(
//                             productModel: productsList.first);
//                       }),
//                     ),
//                   ),
//                 );
//               });
//         },
//         child: Container(
//           height:
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: const Color(0xffCACACA),
//               borderRadius: BorderRadius.all(
//                 const Radius.circular(4).r,
//               )),
//           child: Text("+ More Combo",
//               style: TextStyle(
//                   fontFamily: "Poppins",
//                   fontSize: 
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//         ),
//       ),
//     );
//   }
// }
