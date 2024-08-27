import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/banner_products/banner_bloc.dart';
import 'package:sel_org/ui_1/banner_products/banner_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';

class BannerScreenMob extends CoreWidgets {
  const BannerScreenMob({super.key});
  @override
  CoreWidgetsState<BannerScreenMob> createState() => _BannerScreenMobState();
}

class _BannerScreenMobState extends CoreWidgetsState<BannerScreenMob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          toolBarTitleString: "Products",
          isAppBar: true,
          toolBarIconEnum: IconEnum.back,
          child: state is SuccessState
              ? Container(
                  width: width,
                  height: height,
                  padding: EdgeInsets.symmetric(
                      vertical: 20.h, horizontal: width * 0.05),
                  child: AlignedGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: width * 0.04,
                    itemCount: context.read<BannerBloc>().productModels.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 300.h,
                        child: ProductWidget(
                            productModel: context
                                .read<BannerBloc>()
                                .productModels[index]),
                      );
                    },
                  ))
              : const SizedBox(),
        );
      },
    );
  }
}
