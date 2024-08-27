import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_widgets/homepage_appbar_desk.dart';

import 'package:sel_org/ui_1/banner_products/banner_screen.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_screen.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/footer_widget/footer.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';

import '../../../../utils/reusable_widgets/product_pack/product_entity/product_model.dart';

import '../homepage_bloc.dart';
import '../homepage_event.dart';

class HomepageScreenWeb extends CoreWidgets {
  const HomepageScreenWeb({super.key});

  @override
  CoreWidgetsState<HomepageScreenWeb> createState() =>
      _DashboardScreenMobState();
}

class _DashboardScreenMobState extends CoreWidgetsState<HomepageScreenWeb> {
  @override
  Widget build(BuildContext context) {
    HomepageBloc homepageBloc =
        BlocProvider.of<HomepageBloc>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return BlocBuilder(
        bloc: homepageBloc,
        buildWhen: (previous, current) {
          return current is SuccessState;
        },
        builder: (context, state) {
          return BlocConsumer<HomepageBloc, BaseState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is InitialState) {
                homepageBloc.add(HomepageInitialContent());
              }
              return FlutterScaffold(
                isAppBar: false,
                greenBackground: false,
                backgroundVectorCurve: false,
                isScrollPhysics: true,
                isLoading: state is LoadingState,
                child: state is SuccessState
                    ? SizedBox(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HomePageAppBarDesk(),
                              Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: Column(
                                  children: Map<String, dynamic>.from(
                                          state.successResponse)
                                      .entries
                                      .map((element) {
                                    return Column(
                                      children: [
                                        if (element.value["showBannerTitle"] ==
                                            true)
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 25.h,
                                                horizontal: size.width * 0.05),
                                            child: Flex(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              direction: Axis.horizontal,
                                              children: [
                                                Text(
                                                  element.value["bannerTitle"]
                                                              .toString()
                                                              .toLowerCase() ==
                                                          "categories"
                                                      ? "Explore by Categories"
                                                      : element
                                                          .value["bannerTitle"],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "Poppins-SemiBold",
                                                      fontSize: 7.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                if (element
                                                        .value["showSeeAll"] ==
                                                    true)
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "See All",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            fontSize: 5.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors()
                                                                .primaryDarkGreen,
                                                          ),
                                                        ),

                                                        Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            size: 5
                                                                .sp), // Your icon here
                                                      ],
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25.h,
                                              horizontal: size.width * 0.05),
                                          child: (() {
                                            switch (element.value["bannerType"]
                                                .toString()
                                                .toLowerCase()) {
                                              case 'images':
                                                return (element.value["images"]
                                                                as List)
                                                            .length >
                                                        1
                                                    ? SizedBox(
                                                        width: size.width,
                                                        height: 325.h,
                                                        child:
                                                            ListView.separated(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (context, index) {
                                                            var image = element
                                                                        .value[
                                                                    "images"]
                                                                [index];
                                                            return GestureDetector(
                                                              onTap: () {
                                                                GoRouter.of(
                                                                        context)
                                                                    .push(BannerScreen
                                                                        .routeName);
                                                              },
                                                              child: SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.29,
                                                                child: Image
                                                                    .network(
                                                                  image[
                                                                      'imageUrl'],
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  loadingBuilder: (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null) {
                                                                      return child;
                                                                    }
                                                                    return SizedBox(
                                                                      height: size
                                                                          .height,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                              : null,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  errorBuilder: (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                    return const SizedBox(
                                                                        child: Icon(
                                                                            Icons.error_outline)
                                                                        // const Text(
                                                                        //     'Failed to load image'),
                                                                        );
                                                                  },
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.01,
                                                            );
                                                          },
                                                          itemCount: (element
                                                                          .value[
                                                                      "images"]
                                                                  as List<
                                                                      dynamic>)
                                                              .length,
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: size.width,
                                                        child: Column(
                                                          children: (element
                                                                          .value[
                                                                      "images"]
                                                                  as List)
                                                              .map((e) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                GoRouter.of(
                                                                        context)
                                                                    .push(BannerScreen
                                                                        .routeName);
                                                              },
                                                              child:
                                                                  Image.network(
                                                                e['imageUrl'],
                                                                width:
                                                                    size.width *
                                                                        0.90,
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                loadingBuilder: (BuildContext
                                                                        context,
                                                                    Widget
                                                                        child,
                                                                    ImageChunkEvent?
                                                                        loadingProgress) {
                                                                  if (loadingProgress ==
                                                                      null) {
                                                                    return child;
                                                                  }
                                                                  return SizedBox(
                                                                    height: size
                                                                        .height,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes !=
                                                                                null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                                loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                errorBuilder: (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                                  return const SizedBox(
                                                                      child: Icon(
                                                                          Icons
                                                                              .error_outline)
                                                                      // const Text(
                                                                      //     'Failed to load image'),
                                                                      );
                                                                },
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ));

                                              case 'products':
                                                return SizedBox(
                                                  height: 500.h,
                                                  width: size.width,
                                                  child: ListView.separated(
                                                      physics:
                                                          const ScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: (element.value[
                                                                  "products"]
                                                              as List<dynamic>)
                                                          .length,
                                                      separatorBuilder:
                                                          (context, index) {
                                                        return SizedBox(
                                                            width: size.width *
                                                                0.01);
                                                      },
                                                      itemBuilder:
                                                          (context, int index) {
                                                        final product = element
                                                                .value[
                                                            "products"][index];
                                                        return SizedBox(
                                                            height: 500.h,
                                                            width: size.width *
                                                                0.14,
                                                            child: ProductWidget(
                                                                productModel: ProductModel(
                                                                    skuCode: product["skuCode"],
                                                                    imageUrl: "assets/png/product_1.png",
                                                                    title: product["skuName"],
                                                                    size: product["size"],
                                                                    price: product["salePrice"],
                                                                    mrp: product["mrp"],
                                                                    offer: '25% Off',
                                                                    varients: List.from(product["Variants"]).map((x) {
                                                                      return Varient(
                                                                          title: x[
                                                                              "skuName"],
                                                                          size: x[
                                                                              "size"],
                                                                          price: x[
                                                                              "salePrice"],
                                                                          mrp: x[
                                                                              "mrp"],
                                                                          offer:
                                                                              "20%Off",
                                                                          skuCode:
                                                                              '',
                                                                          imageUrl:
                                                                              '',
                                                                          quantity:
                                                                              0,
                                                                          clicked:
                                                                              false);
                                                                    }).toList(),
                                                                    isStocked: product["isStocked"])));
                                                      }),
                                                );
                                              default: //categories
                                                return GridView.builder(
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.zero,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 6,
                                                      crossAxisSpacing: 2.0.w,
                                                      mainAxisSpacing: 5.0,
                                                      childAspectRatio: 1,
                                                    ),
                                                    itemCount: (element.value[
                                                                "categories"]
                                                            as List<dynamic>)
                                                        .length,
                                                    //products
                                                    itemBuilder:
                                                        (context, int index) {
                                                      Map<String, dynamic>
                                                          product =
                                                          (element.value[
                                                                  "categories"]
                                                              as List<
                                                                  dynamic>)[index];
                                                      var descript = (product[
                                                                  "category_desc"] ??
                                                              '')
                                                          .toString()
                                                          .split(' ')
                                                          .map((e) {
                                                        if (e.isEmpty) return e;
                                                        return e[0]
                                                                .toUpperCase() +
                                                            e
                                                                .substring(1)
                                                                .toLowerCase();
                                                      }).join(' ');

                                                      return GestureDetector(
                                                        onTap: () {
                                                          GoRouter.of(context).push(
                                                              SubCategoryScreen
                                                                  .routeName,
                                                              extra: product
                                                                      .containsKey(
                                                                          "categorytype")
                                                                  ? product[
                                                                      "category_code"]
                                                                  : product[
                                                                      "parent_code"]);
                                                        },
                                                        child: Card(
                                                          color: AppColors()
                                                              .productCardColor,
                                                          elevation: 5,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                        .circular(
                                                                            10)
                                                                    .r,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20.h,
                                                                    horizontal:
                                                                        4.w),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(descript.toString(),
                                                                    maxLines: 2,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize: 5
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: const Color(
                                                                            0xff202020),
                                                                        overflow:
                                                                            TextOverflow.ellipsis)),
                                                                Flexible(
                                                                  child:
                                                                      AspectRatio(
                                                                    aspectRatio:
                                                                        0.8,
                                                                    child: Image
                                                                        .network(
                                                                      product["image"] ??
                                                                          '',
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent?
                                                                              loadingProgress) {
                                                                        if (loadingProgress ==
                                                                            null) {
                                                                          return child;
                                                                        }
                                                                        return SizedBox(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      errorBuilder: (BuildContext context,
                                                                          Object
                                                                              exception,
                                                                          StackTrace?
                                                                              stackTrace) {
                                                                        return SizedBox(
                                                                          // width: size.width >= 1366
                                                                          //     ? size.width *
                                                                          //         0.4
                                                                          //     : size.width *
                                                                          //         0.7,
                                                                          // height: size
                                                                          //     .height,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 4.w), child: const Icon(Icons.error_outline)),
                                                                            //       Text(
                                                                            //     'Failed to load image',
                                                                            //     textAlign:
                                                                            //         TextAlign.center,
                                                                            //     style: TextStyle(
                                                                            //         fontSize: 10,
                                                                            //         fontWeight: FontWeight.bold,
                                                                            //         color: Colors.black,
                                                                            //         overflow: TextOverflow.ellipsis),
                                                                            //   ),
                                                                            // ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      //fit: BoxFit.cover,
                                                                      // height: 100,
                                                                      // repeat:
                                                                      //     ImageRepeat.repeat,
                                                                      cacheWidth:
                                                                          500,
                                                                      cacheHeight:
                                                                          500,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                            }
                                          })(),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.20,
                                    vertical: 80.h),
                                alignment: Alignment.center,
                                color: const Color(0xffEEEEEE),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Can’t Find What You Were Looking For?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8.sp,
                                              letterSpacing: 1.25,
                                              color: AppColors()
                                                  .sixgrey
                                                  .withOpacity(0.5),
                                              overflow: TextOverflow.fade),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/face_emoji.svg",
                                          height: 50.h,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 40.h),
                                    SizedBox(
                                      width: 90.w,
                                      height: 100.h,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            hintText: "Suggest a Product",
                                            hintStyle: TextStyle(
                                                fontSize: 5.5.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors().sixgrey),
                                            filled: true,
                                            fillColor: Colors.white,
                                            // Un-commented and used white to show the fill effect
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: AppColors().sixgrey),
                                                borderRadius: BorderRadius.all(
                                                    const Radius.circular(50)
                                                        .r)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: AppColors().sixgrey),
                                                borderRadius: BorderRadius.all(
                                                    const Radius.circular(50)
                                                        .r)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2,
                                                    color: AppColors().sixgrey),
                                                borderRadius: BorderRadius.all(
                                                    const Radius.circular(50).r))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Footer(),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              );
            },
          );
        });
  }
}
