import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../state/application_state.dart';
import '../orders_entity/order_model.dart';
import 'order_details_event.dart';

class Order_DetailsBloc extends Bloc<DetailsEvent, BaseState> {
  Orderlist order;
  Order_DetailsBloc(this.order) : super(InitialState()) {
    on<DetailsInitialContent>(loadingAddressContent);
  }

  Future<FutureOr<void>> loadingAddressContent(
      DetailsInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    //await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: order));
  }
}
