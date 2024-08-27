import 'package:flutter/material.dart';

abstract class CustomerEvent {}

class CustomerInitialContent extends CustomerEvent {
  final BuildContext? context;

  CustomerInitialContent(this.context);
}
