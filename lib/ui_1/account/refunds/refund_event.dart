import 'package:flutter/material.dart';

abstract class RefundEvent {}

class RefundInitialContent extends RefundEvent {
  final BuildContext? context;

  RefundInitialContent(this.context);
}
