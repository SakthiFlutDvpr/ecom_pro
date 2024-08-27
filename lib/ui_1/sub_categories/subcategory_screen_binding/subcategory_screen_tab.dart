import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_bloc.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_entity/sub_category_model.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/sub_category_card.dart';

class SubCategoryScreenTab extends CoreWidgets {
  const SubCategoryScreenTab({super.key});
  @override
  CoreWidgetsState<SubCategoryScreenTab> createState() =>
      _SubCategoryScreenTabState();
}

class _SubCategoryScreenTabState
    extends CoreWidgetsState<SubCategoryScreenTab> {
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
          isLoading: false,
          backgroundVectorCurve: false,
          isScrollPhysics: true,
          toolBarTitleString: 'Products',
          greenBackground: false,
          isAppBar: true,
          toolBarIconEnum: IconEnum.back,
          child: state is SuccessState
              ? SizedBox(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
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
                                  valueListenable:
                                      context.read<SubCategoryBloc>().value,
                                  builder: (context, value, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<SubCategoryBloc>()
                                            .add(ValueChangingEvent(index));
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
                          width: screenSize.width * 0.85,
                          height: screenSize.height,
                          padding: EdgeInsets.all(screenSize.width * 0.02),
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 1.5, color: Colors.grey))),
                          child: AlignedGridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: screenSize.width * 0.02,
                              mainAxisSpacing: 20.h,
                              itemCount: context
                                  .read<SubCategoryBloc>()
                                  .productModels
                                  .length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 350.h,
                                  child: ProductWidget(
                                      productModel: context
                                          .read<SubCategoryBloc>()
                                          .productModels[index]),
                                );
                              }))
                    ],
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
