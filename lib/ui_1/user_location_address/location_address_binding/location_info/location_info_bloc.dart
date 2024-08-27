import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_event.dart';

class LocationInfoBloc extends Bloc<GetLocationEvent, BaseState> {
  LocationData? locationData;
  LocationData? locationCoordinates;
  GoogleMapController? controller;

  Set<Marker> marker = {};
  Set<Circle> circle = {};
  Placemark? place;

  LocationInfoBloc({this.locationData}) : super(InitialState()) {
    on<GetLocationData>(loadLocationData);
    on<PlaceMarkerOnTap>(placeMarker);
  }

  FutureOr loadLocationData(
      GetLocationData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    locationCoordinates = locationData;
    debugPrint("locationCoordinates $locationCoordinates");

    marker.add(
      Marker(
        markerId: const MarkerId("Your location"),
        position: LatLng(
            locationCoordinates!.latitude!, locationCoordinates!.longitude!),
        infoWindow: const InfoWindow(
          title: 'Your location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    circle.add(Circle(
      circleId: const CircleId('circle1'),
      center: LatLng(
          locationCoordinates!.latitude!, locationCoordinates!.longitude!),
      radius: 50,
      fillColor: Colors.blue.withOpacity(0.2),
      strokeColor: Colors.blue,
      strokeWidth: 1,
    ));

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        locationCoordinates!.latitude!, locationCoordinates!.longitude!);

    place = placeMarks.first;
    debugPrint("address : $place");

    debugPrint("address1 : ${place!.street} ${place!.locality} ${place!.name} ${place!.postalCode}");

    emit(SuccessState(successResponse: place));
  }

  void placeMarker(PlaceMarkerOnTap event, Emitter<BaseState> emit) async {
    debugPrint("new latlng : ${event.latLng}");
    // emit(LoadingState());
    marker.clear();
    circle.clear();

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        event.latLng.latitude, event.latLng.longitude);

    place = placeMarks[0];

    debugPrint("new address : $place");

    controller?.animateCamera(
      CameraUpdate.newLatLng(event.latLng),
    );

    controller?.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: event.latLng),
      ),
    );

    circle.add(
      Circle(
        circleId: const CircleId('circle1'),
        center: event.latLng,
        radius: 50,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      ),
    );
    marker.add(
      Marker(
        markerId: const MarkerId("Your location"),
        position: event.latLng,
        infoWindow: const InfoWindow(
          title: 'Your location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );

    emit(SuccessState(successResponse: true));

    // Add a new marker at the tapped location.
  }
}
