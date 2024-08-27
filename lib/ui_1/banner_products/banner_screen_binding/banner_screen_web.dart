import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_widgets/homepage_appbar_desk.dart';
import 'package:sel_org/ui_1/banner_products/banner_bloc.dart';
import 'package:sel_org/ui_1/banner_products/banner_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';

class BannerScreenWeb extends CoreWidgets {
  const BannerScreenWeb({super.key});
  @override
  CoreWidgetsState<BannerScreenWeb> createState() => _BannerScreenWebState();
}

class _BannerScreenWebState extends CoreWidgetsState<BannerScreenWeb> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocConsumer<BannerBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<BannerBloc>().add(ProductFromBannerEvent());
        }
        return FlutterScaffold(
          backgroundVectorWave: false,
          isLoading: state is LoadingState,
          backgroundVectorCurve: false,
          isScrollPhysics: true,
          greenBackground: false,
          isAppBar: false,
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
                              vertical: 50.h,
                              horizontal: screenSize.width * 0.05,
                            ),
                            child: AlignedGridView.count(
                              crossAxisCount: 6,
                              mainAxisSpacing: 25.h,
                              crossAxisSpacing: screenSize.width * 0.01,
                              itemCount: context
                                  .read<BannerBloc>()
                                  .productModels
                                  .length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 450.h,
                                  child: ProductWidget(
                                      productModel: context
                                          .read<BannerBloc>()
                                          .productModels[index]),
                                );
                              },
                            )),
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
