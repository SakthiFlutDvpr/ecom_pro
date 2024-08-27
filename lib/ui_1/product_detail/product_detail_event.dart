import 'package:flutter/material.dart';

abstract class ProductDetailEvent {}

class ProductDetailInitialContent extends ProductDetailEvent {
  final BuildContext? context;

  ProductDetailInitialContent({this.context});
}
