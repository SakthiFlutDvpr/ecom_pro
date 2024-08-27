import 'package:flutter/material.dart';

abstract class AddressEvent {}

class AddressInitialContent extends AddressEvent {
  final BuildContext? context;

  AddressInitialContent(this.context);
}
