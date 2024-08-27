import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';

import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_widgets/homepage_appbar_desk.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_bloc.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_entity/sub_category_model.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/sub_category_card.dart';

class SubCategoryScreenWeb extends CoreWidgets {
  const SubCategoryScreenWeb({super.key});
  @override
  CoreWidgetsState<SubCategoryScreenWeb> createState() =>
      _SubCategoryScreenWebState();
}

class _SubCategoryScreenWebState
    extends CoreWidgetsState<SubCategoryScreenWeb> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocConsumer<SubCategoryBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<SubCategoryBloc>().add(SubCategoryFetchEvent());

          //context.read<SubCategoryBloc>().add(ProductFetchEvent());
        }
        return FlutterScaffold(
          backgroundVectorWave: false,
          isLoading: state is LoadingState,
          backgroundVectorCurve: false,
          isAppBar: false,
          isScrollPhysics: true,
          greenBackground: false,
          child: state is SuccessState
              ? SizedBox(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Column(
                    children: [
                      const HomePageAppBarDesk(),
                      Expanded(
                        child: Container(
                          width: screenSize.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: Colors.white,
                                width: screenSize.width * 0.15,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: context
                                        .read<SubCategoryBloc>()
                                        .subcategoryModels
                                        .length,
                                    itemBuilder: (context, index) {
                                      SubcategoryModel subCategory = context
                                          .read<SubCategoryBloc>()
                                          .subcategoryModels[index];

                                      return ValueListenableBuilder(
                                          valueListenable: context
                                              .read<SubCategoryBloc>()
                                              .value,
                                          builder: (context, value, child) {
                                            return GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<SubCategoryBloc>()
                                                    .add(ValueChangingEvent(
                                                        index));
                                              },
                                              child: SubCategoryCard(
                                                subCategory: subCategory,
                                                index: index,
                                                value: context
                                                    .read<SubCategoryBloc>()
                                                    .value,
                                              ),
                                            );
                                          });
                                    }),
                              ),
                              Container(
                                  width: screenSize.width * 0.75,
                                  height: screenSize.height,
                                  padding: EdgeInsets.only(
                                      left: screenSize.width * 0.01,
                                      right: screenSize.width * 0.01,
                                      top: 25.h,
                                      bottom: 25.h),
                                  // decoration: const BoxDecoration(
                                  //     border: Border(
                                  //         left: BorderSide(
                                  //             width: 1.5, color: Colors.grey))),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30.h),
                                          child: Text("Buy Fresh Fruits Online",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 5.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                        AlignedGridView.count(
                                            shrinkWrap: true,
                                            crossAxisCount: 5,
                                            crossAxisSpacing:
                                                screenSize.width * 0.01,
                                            mainAxisSpacing: 25.h,
                                            itemCount: context
                                                .read<SubCategoryBloc>()
                                                .productModels
                                                .length,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                height: 450.h,
                                                child: ProductWidget(
                                                    productModel: context
                                                        .read<SubCategoryBloc>()
                                                        .productModels[index]),
                                              );
                                            }),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
