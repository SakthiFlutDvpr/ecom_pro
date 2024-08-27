import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the screen size based on maxWidth
        if (constraints.maxWidth >= 1100) {
          // If the maxWidth is 1100 or more, return the largeScreen widget
          return largeScreen;
        } else if (constraints.maxWidth >= 650) {
          // If the maxWidth is between 650 and 1099, return the mediumScreen widget
          return mediumScreen;
        } else {
          // If the maxWidth is less than 650, return the smallScreen widget
          return smallScreen;
        }
      },
    );
  }
}
