import 'package:flutter/material.dart';

abstract class ProfileEvent {}

class ProfileInitialContent extends ProfileEvent {
  final BuildContext? context;

  ProfileInitialContent(this.context);
}

class ProfileUpdateEvent extends ProfileEvent {}

class ProfileGetEvent extends ProfileEvent {}
