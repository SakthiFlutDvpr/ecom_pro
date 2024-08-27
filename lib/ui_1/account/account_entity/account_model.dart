import 'package:flutter/material.dart';

class ListItem {
  final String leftIcon;
  final String text;
  final String route;
  final IconData rightIcon;

  ListItem({
    required this.leftIcon,
    required this.text,
    required this.route,
    required this.rightIcon,
  });
}
