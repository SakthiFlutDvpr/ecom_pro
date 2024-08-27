import 'package:flutter/material.dart';

abstract class GeneralEvent {}

class GeneralIntitialContent extends GeneralEvent {
  final BuildContext context;

  GeneralIntitialContent(this.context);
}
