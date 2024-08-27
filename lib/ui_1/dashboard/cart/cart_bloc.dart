import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/cart/cart_event.dart';

class CartBloc extends Bloc<CartEvent, BaseState> {
  CartBloc() : super(InitialState()) {
    on<CartDetailInitialContent>(LoadingcartContent);
  }

  // ignore: non_constant_identifier_names
  Future<FutureOr<void>> LoadingcartContent(
      CartDetailInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: true));
  }
}
