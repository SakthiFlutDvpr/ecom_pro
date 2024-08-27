import 'package:flutter/material.dart';

@immutable
abstract class HomepageEvent {}

class HomepageInitialContent extends HomepageEvent {
  HomepageInitialContent();
}

class CategoryNavigationEvent extends HomepageEvent {
  final String categoryCode;

  CategoryNavigationEvent({
    required this.categoryCode,
  });
}

class ScreenNavigationEvent extends HomepageEvent {
  final String routName;

  ScreenNavigationEvent(this.routName);
}
