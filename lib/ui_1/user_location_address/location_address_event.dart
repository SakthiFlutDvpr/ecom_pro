import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class GetLocationEvent {}

class GetUserLocation extends GetLocationEvent {
  final BuildContext context;

  GetUserLocation({required this.context});
}



class GetUserCoordinates extends GetLocationEvent {
  final BuildContext context;

  GetUserCoordinates(this.context);
}


class GetLocationData extends GetLocationEvent{
  final BuildContext context;
  GetLocationData(this.context);
}

class PlaceMarkerOnTap extends GetLocationEvent{
  final LatLng latLng;

  PlaceMarkerOnTap({required this.latLng});
}
