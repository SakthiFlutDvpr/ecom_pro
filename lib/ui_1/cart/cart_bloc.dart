import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';

import 'cart_event.dart';
import 'entity/cart_models.dart';


class CartBloc extends Bloc<CartEvent, BaseState> {

  CartDataModels? cartDataModels;

  CartBloc() : super(InitialState()) {
    on<LoadCartValues>(loadInitialContent);
  }

  FutureOr<void> loadInitialContent(
      LoadCartValues event, Emitter<BaseState> emit) async {
    emit(LoadingState());



  }
}
