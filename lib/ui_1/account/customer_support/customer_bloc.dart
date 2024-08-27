import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_event.dart';

class CustomerBloc extends Bloc<CustomerEvent, BaseState> {
  CustomerBloc() : super(InitialState()) {
    on<CustomerInitialContent>(loadingCustomerContent);
  }

  Future<FutureOr<void>> loadingCustomerContent(
      CustomerInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    // await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: true));
  }
}
