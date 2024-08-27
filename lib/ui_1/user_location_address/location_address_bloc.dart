import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_event.dart';

import 'location_address_binding/location_info/location_info_screen.dart';

class GetLocationBloc extends Bloc<GetLocationEvent, BaseState> {
  bool isSelected = false;
  Location location = Location();
  LocationData? locationData;

  GetLocationBloc() : super(InitialState()) {
    on<GetUserLocation>(getUserLocationDetails);
    on<GetUserCoordinates>(getCurrentLocation);
  }

  FutureOr getUserLocationDetails(
      GetUserLocation event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final permission = await location.requestPermission();
    if (permission == PermissionStatus.granted) {
      getUserCurrentLocation();
      emit(SuccessState(successResponse: true));
    } else if (permission == PermissionStatus.denied) {
      emit(FailureState(errorMessage: "location denied"));
    } else {}
  }

  void getUserCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    debugPrint("service enabled : $serviceEnabled");
    if (!serviceEnabled) {
      var permissionService = await location.requestService();
      debugPrint("check : $permissionService");
      if (permissionService) {
        locationData = await location.getLocation();
        if (locationData!.latitude != null && locationData!.longitude != null) {
          location.changeSettings(
              accuracy: LocationAccuracy.high, interval: 500);
          debugPrint("location data received : $locationData");
        }
      } else {
        debugPrint("location service enabled");
      }
    } else {
      // emit(FailureState(errorMessage: "location denied"));
      debugPrint("location enabled already");
    }
  }

  FutureOr<void> getCurrentLocation(
      GetUserCoordinates event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    if (locationData == null) {
      locationData = await location.getLocation().then((response) async {
        if (response.longitude != null && response.latitude != null) {
          debugPrint("location response ; $response");
          emit(SuccessState(successResponse: true));
          GoRouter.of(event.context)
              .push(LocationInformationScreen.routeName, extra: response);
        }
        return response;
      });
    } else {
      emit(SuccessState(successResponse: true));

      GoRouter.of(event.context)
          .push(LocationInformationScreen.routeName, extra: locationData);
    }
  }
}
