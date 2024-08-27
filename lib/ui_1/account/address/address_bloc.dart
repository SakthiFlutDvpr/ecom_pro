import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/address/address_event.dart';

class AddressBloc extends Bloc<AddressEvent, BaseState> {
  List addressList = [1];

  AddressBloc() : super(InitialState()) {
    on<AddressInitialContent>(loadingAddressContent);
  }

  Future<FutureOr<void>> loadingAddressContent(
      AddressInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    //await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: addressList));
  }
}
