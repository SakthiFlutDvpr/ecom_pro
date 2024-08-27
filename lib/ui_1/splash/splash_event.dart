import 'package:flutter/cupertino.dart';

@immutable
abstract class SplashEvent {}

class SplashInitialContent extends SplashEvent {
  final BuildContext? context;
  SplashInitialContent({this.context});
}
