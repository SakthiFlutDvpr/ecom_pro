import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/services/network_layer/network_api_service.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_entity/sub_category_model.dart';
import 'package:sel_org/ui_1/sub_categories/subcategory_event.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, BaseState> {
  final String categoryCode;
  List<ProductModel> productModels = [];
  List<SubcategoryModel> subcategoryModels = [];
  ValueNotifier value = ValueNotifier(0);
  SubCategoryBloc(this.categoryCode) : super(InitialState()) {
    on<SubCategoryFetchEvent>(loadingSubCategories);
    //on<ProductFetchEvent>(loadingProducts);
    on<ValueChangingEvent>(changValue);
  }

  Future loadingSubCategories(
      SubCategoryFetchEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    await NetworkCalls.getSubCategories(categoryCode).then((response) async {
      if (response["message"]["status"] == 200) {
        subcategoryModels
            .addAll(List.from(response["message"]["data"]).map((x) {
          return SubcategoryModel.from(x);
        }).toList());
        loadingProducts();
        emit(SuccessState(successResponse: true));
      }
    });
  }

  loadingProducts() {
    productModels.addAll(productList);
  }

  FutureOr<void> changValue(ValueChangingEvent event, Emitter<BaseState> emit) {
    value.value = event.value;
  }
}
