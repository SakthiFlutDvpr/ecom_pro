import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_event.dart';

class ProductBloc extends Bloc<ProductEvent, BaseState> {
  final ProductModel productModel;
  late Varient varient;

  // String productSize = "";

  ProductBloc(this.productModel) : super(InitialState()) {
    varient = productModel.varients.first;

    on<VarientChangeEvent>(changeVarient);
    on<ProductClickedEvent>(productClicked);
    on<ProductIncreamentEvent>(productIncreament);
    on<ProductDecreamentEvent>(productDecreament);
  }

  FutureOr<void> changeVarient(
      VarientChangeEvent event, Emitter<BaseState> emit) {
    debugPrint(event.varient!.title);

    varient = event.varient!;
    // productSize = event.varient!.size;
    debugPrint(varient.title);

    emit(SuccessState(successResponse: true));
  }

  FutureOr<void> productClicked(
      ProductClickedEvent event, Emitter<BaseState> emit) {
    varient.quantity++;
    varient.clicked = true;
    emit(ProductUpdateState());
  }

  FutureOr<void> productIncreament(
      ProductIncreamentEvent event, Emitter<BaseState> emit) {
    varient.quantity++;
    varient.clicked = true;
    emit(ProductUpdateState());
  }

  FutureOr<void> productDecreament(
      ProductDecreamentEvent event, Emitter<BaseState> emit) {
    varient.quantity--;
    if (varient.quantity <= 0) {
      varient.clicked = false;
    }
    emit(ProductDownState());
  }
}
