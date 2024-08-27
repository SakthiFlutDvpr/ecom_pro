import 'package:flutter/cupertino.dart';

@immutable
abstract class CartEvent {}


class LoadCartValues extends CartEvent{

  final BuildContext? context;

  LoadCartValues({this.context});
}