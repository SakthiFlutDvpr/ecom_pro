import 'package:flutter/material.dart';

abstract class AccountEvent {}

class AccountInitialContent extends AccountEvent {
  final BuildContext? context;

  AccountInitialContent({this.context});
}

class SuggestBottomEvent extends AccountEvent {
  final String text;
  final BuildContext? context;

  SuggestBottomEvent({required this.text, this.context});
}

class ThankYouBottomEvent extends AccountEvent {
  final bool result;
  final BuildContext? context;

  ThankYouBottomEvent({required this.result, this.context});
}
