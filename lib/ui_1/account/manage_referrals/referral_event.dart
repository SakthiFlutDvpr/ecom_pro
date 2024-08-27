import 'package:flutter/material.dart';

abstract class ReferralEvent {}

class ReferralInitialContent extends ReferralEvent {
  final BuildContext? context;

  ReferralInitialContent(this.context);
}
