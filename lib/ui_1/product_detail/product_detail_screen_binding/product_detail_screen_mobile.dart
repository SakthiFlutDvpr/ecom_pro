import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_bloc.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/footer_widget/footer.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';

import 'package:sel_org/utils/reusable_widgets/product_pack/update_button.dart';

import '../../../utils/reusable_widgets/product_pack/dropdown_btn.dart';
import '../../../utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class ProductDetailScreenMob extends CoreWidgets {
  const ProductDetailScreenMob({super.key});

  @override
  CoreWidgetsState<ProductDetailScreenMob> createState() =>
      _ProdutDetailScreenMobState();
}

class _ProdutDetailScreenMobState
    extends CoreWidgetsState<ProductDetailScreenMob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
              isAppBar: true,
              toolBarTitleString: "Product Detail",
              toolBarIconEnum: IconEnum.back,
              child: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.asset(bloc.productModel.imageUrl),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(bloc.varient.title,
                              // varient != null
                              //     ? varient.title
                              //     : productBloc.productModel.title,
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                  " Rs. ${bloc.varient.price.toString().substring(0, 4)}",
                                  // "Rs. ${varient != null ? varient.price.toString().substring(0, 4)
                                  // : productBloc.productModel.price.toString().substring(0, 4)}",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                  " Rs. ${bloc.varient.mrp.toString().substring(0, 4)}",
                                  // "Rs. ${varient != null ? varient.mrp.toString().substring(0, 4)
                                  // : productBloc.productModel.mrp.toString().substring(0, 4)}",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff404040),
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 30.h,
                                  width: 125.w,
                                  child: ProductDropDown(
                                    productBloc: bloc,
                                  )),
                              SizedBox(
                                width: 4.w,
                              ),
                              SizedBox(
                                  height: 30.h,
                                  width: 100.w,
                                  child: UpdateButton(
                                    productBloc: bloc,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    ExpansionTile(
                        childrenPadding: EdgeInsets.only(
                            left: width * 0.04,
                            right: width * 0.04,
                            bottom: 15.h),
                        backgroundColor: Colors.white,
                        collapsedBackgroundColor: Colors.white,
                        trailing: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 14.sp,
                        ),
                        tilePadding:
                            EdgeInsets.symmetric(horizontal: width * 0.04),
                        title: Text("Product Information",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff202020))),
                        children: List.generate(5, (i) {
                          return Flex(
                            direction: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 2.r,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text(
                                    textAlign: TextAlign.start,
                                    "About - Tomatoes are a yummy fruit used in cooking purposes and foods like salads, sauces, and sandwiches.",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
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
                          horizontal: width * 0.04, vertical: 20.h),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Similar Products",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 300.h,
                            width: width,
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: width * 0.02,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: 300.h,
                                      width: width * 0.35,
                                      child: ProductWidget(
                                          productModel: productList[index]));
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: 20.h),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You might also like",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff202020))),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 300.h,
                            width: width,
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: width * 0.02,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      height: 300.h,
                                      width: width * 0.35,
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
