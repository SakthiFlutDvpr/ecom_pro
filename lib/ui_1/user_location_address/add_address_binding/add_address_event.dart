


import 'package:flutter/material.dart';

@immutable
abstract class AddAddressEvent {}


class AddAddressContent extends AddAddressEvent{
  final BuildContext context;

  AddAddressContent({required this.context});

}

class SelectedAddressLabel extends AddAddressEvent{
  final String label;

  SelectedAddressLabel({required this.label});

}

class SaveAndContinue extends AddAddressEvent{
  final String label;

  SaveAndContinue({required this.label});

}
