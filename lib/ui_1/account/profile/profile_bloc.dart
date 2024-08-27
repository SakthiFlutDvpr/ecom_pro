import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/constants/const_values/const_values.dart';

import 'package:sel_org/services/network_layer/network_api_service.dart';
import 'package:sel_org/services/storage_services/storage_service_implementation.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/profile/profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, BaseState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  ProfileBloc() : super(InitialState()) {
    on<ProfileInitialContent>(getProfileContent);

    on<ProfileUpdateEvent>(updateProfileContent);
  }

  FutureOr<void> getProfileContent(
      ProfileInitialContent event, Emitter<BaseState> emit) async {
    // emit(LoadingState());
    // try {
    //   await NetworkCalls.getProfile().then((response) {
    //     // CustomerLoginDetails customerDetails = CustomerLoginDetails.fromJson(
    //     //     Map<String, dynamic>.from(response.data["message"]));

    //     emit(SuccessState(successResponse: response.data["message"]["data"]));
    //   });
    // } catch (e) {
    //   debugPrint("error in getprofile");
    // }
    emit(SuccessState(successResponse: true));
  }

  FutureOr<void> updateProfileContent(
      ProfileUpdateEvent event, Emitter<BaseState> emit) async {
    try {
      await NetworkCalls.updateProfile(body: {
        "customer_id": await StorageServiceImpl()
            .getValue(key: AppConstantValues().customerId),
        "name": nameController.text.toString(),
        "email": emailController.text.toString()
      }).then((response) {
        debugPrint("UpdateProfile success in stage 2");
      });
    } catch (e) {
      debugPrint("Error in update Profile");
    }
  }
}
