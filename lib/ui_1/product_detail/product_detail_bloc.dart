import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/product_detail/product_detail_event.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, BaseState> {
  ProductDetailBloc() : super(InitialState()) {
    on<ProductDetailInitialContent>(productDetailInitialContent);
  }

  Future<FutureOr<void>> productDetailInitialContent(
      ProductDetailInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 1));

    emit(SuccessState(successResponse: true));
  }
}
