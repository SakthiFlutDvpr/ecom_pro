import 'package:flutter/material.dart';

abstract class CartEvent {}

class CartDetailInitialContent extends CartEvent {
  final BuildContext? context;

  CartDetailInitialContent(this.context);
}
