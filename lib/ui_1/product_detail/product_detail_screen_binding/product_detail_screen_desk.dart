import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_widgets/homepage_appbar_desk.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_bloc.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/footer_widget/footer.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';

import 'package:sel_org/utils/reusable_widgets/product_pack/update_button.dart';

import '../../../utils/reusable_widgets/product_pack/dropdown_btn.dart';
import '../../../utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class ProductDetailScreenDesk extends CoreWidgets {
  const ProductDetailScreenDesk({super.key});

  @override
  CoreWidgetsState<ProductDetailScreenDesk> createState() =>
      _ProdutDetailScreenDeskState();
}

class _ProdutDetailScreenDeskState
    extends CoreWidgetsState<ProductDetailScreenDesk> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ProductBloc bloc = context.read<ProductBloc>();

    return BlocBuilder<ProductBloc, BaseState>(
        bloc: bloc,
        builder: (context, state) {
          return FlutterScaffold(
              isLoading: state is LoadingState,
              isScrollPhysics: true,
              greenBackground: false,
              backgroundVectorCurve: false,
              backgroundVectorWave: false,
              isAppBar: false,
              toolBarIconEnum: IconEnum.back,
              child: SizedBox(
                width: screenWidth,
                //height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomePageAppBarDesk(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      color: const Color(0xFFFFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenHeight * 0.50,
                            width: screenWidth,
                            alignment: Alignment.center,
                            child: Image.asset(
                              productList.first.imageUrl,
                              height: screenHeight * 0.40,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Text(productList.first.title,
                              // varient != null
                              //     ? varient.title
                              //     : productBloc.productModel.title,
                              style: TextStyle(
                                  fontSize: 6.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Text(
                                  "Rs. ${productList.first.price.toString().substring(0, 4)}",
                                  // "Rs. ${varient != null ? varient.price.toString().substring(0, 4)
                                  // : productBloc.productModel.price.toString().substring(0, 4)}",
                                  style: TextStyle(
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              SizedBox(
                                width: 15.h,
                              ),
                              Text(
                                  "Rs. ${productList.first.mrp.toString().substring(0, 4)}",
                                  // "Rs. ${varient != null ? varient.mrp.toString().substring(0, 4)
                                  // : productBloc.productModel.mrp.toString().substring(0, 4)}",
                                  style: TextStyle(
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff404040),
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: const Color(0xff404040),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 45.h,
                                  width: 60.w,
                                  child: ProductDropDown(
                                    productBloc: bloc,
                                  )),
                              SizedBox(
                                width: 4.w,
                              ),
                              SizedBox(
                                  height: 45.h,
                                  width: 40.w,
                                  child: UpdateButton(
                                    productBloc: bloc,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 65.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpansionTile(
                        childrenPadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05, vertical: 30.h),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 8.sp,
                        ),
                        tilePadding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05, vertical: 20.h),
                        title: Text("Product Information",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff202020))),
                        children: List.generate(5, (i) {
                          return Flex(
                            direction: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 3.r,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Expanded(
                                child: Text(
                                    textAlign: TextAlign.start,
                                    "About - Tomatoes are a yummy fruit used in cooking purposes and foods like salads, sauces, and sandwiches.",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 4.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5,
                                        color: const Color(0xff565656))),
                              )
                            ],
                          );
                        })),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05, vertical: 30.h),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Similar Products",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 450.h,
                            width: screenWidth,
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: screenWidth * 0.01,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: 450.h,
                                      width: screenWidth * 0.14,
                                      child: ProductWidget(
                                          productModel: productList[index]));
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05, vertical: 30.h),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You might also like",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 5.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 450.h,
                            width: screenWidth,
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: screenWidth * 0.01,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: 450.h,
                                      width: screenWidth * 0.14,
                                      child: ProductWidget(
                                          productModel: productList[index]));
                                }),
                          ),
                        ],
                      ),
                    ),
                    const Footer(),
                  ],
                ),
              ));
        });
  }
}
