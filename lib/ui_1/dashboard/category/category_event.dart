import 'package:flutter/cupertino.dart';

@immutable
abstract class CategoryEvent {}


class CategoryPageContent extends CategoryEvent{

  final BuildContext? context;

  CategoryPageContent({this.context});
}