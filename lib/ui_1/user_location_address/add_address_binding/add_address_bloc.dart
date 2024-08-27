import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_event.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, BaseState> {
  String userPickedAddress = "";
  String addressLabel = "";
  TextEditingController addressLine1 = TextEditingController();
  TextEditingController addressLine2 = TextEditingController();
  TextEditingController landmark = TextEditingController();

  AddAddressBloc() : super(InitialState()) {
    on<AddAddressContent>(getAddressDetails);
    on<SelectedAddressLabel>(addressLabelSelection);
    on<SaveAndContinue>(saveAndContinue);
  }

  FutureOr getAddressDetails(
      AddAddressContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    /// Location picked from maps has to be passed.

    userPickedAddress =
        "Indira Nagar, Adyar, Chennai, Tamil Nadu, 600020, India";
    await Future.delayed(const Duration(seconds: 1), () {
      emit(SuccessState(successResponse: true));
    });
  }

  FutureOr<void> addressLabelSelection(
      SelectedAddressLabel event, Emitter<BaseState> state) {
    debugPrint("label : ${event.label}");
    addressLabel = event.label;

    state(SuccessState(successResponse: true));
  }

  FutureOr<void> saveAndContinue(
      SaveAndContinue event, Emitter<BaseState> emit) {
    emit(SuccessState(successResponse: "addressSaved"));
  }
}
