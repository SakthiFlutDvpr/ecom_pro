import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/services/network_layer/network_api_service.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/category_entity/category_models.dart';

import 'homepage_event.dart';

class HomepageBloc extends Bloc<HomepageEvent, BaseState> {
  CategoryList categoryList = CategoryList();
  TextEditingController controller = TextEditingController();

  HomepageBloc() : super(InitialState()) {
    on<HomepageInitialContent>(loadInitialContent);
  }

  FutureOr<void> loadInitialContent(
      HomepageInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    await NetworkCalls.dashboardCall().then((response) {
      if (response.status == 200) {
        for (var element in Map<String, dynamic>.from(response.data).entries) {
          debugPrint("showBannerTitle---> ${element.value["showBannerTitle"]}");
          debugPrint("bannerTitle---> ${element.value["bannerTitle"]}");
        }
        emit(SuccessState(successResponse: response.data));
      } else {
        emit(SuccessState(successResponse: false));
      }
    });
  }
}
