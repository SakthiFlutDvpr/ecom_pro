import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';

import 'package:sel_org/ui_1/banner_products/banner_event.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class BannerBloc extends Bloc<BannerProductEvent, BaseState> {
  List<ProductModel> productModels = [];

  BannerBloc() : super(InitialState()) {
    on<ProductFromBannerEvent>(loadingProducts);
  }

  FutureOr<void> loadingProducts(
      ProductFromBannerEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    Future.delayed(const Duration(seconds: 1));
    productModels.addAll(productList);
    emit(SuccessState());
  }
}
