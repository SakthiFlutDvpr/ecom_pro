import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/notification/notification_screen_binding/notification_screen_desk.dart';
import 'package:sel_org/ui_1/account/notification/notification_screen_binding/notification_screen_mobile.dart';
import 'package:sel_org/ui_1/account/notification/notification_screen_binding/notification_screen_tab.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String routeName = "/notification";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: NotificationScreenDesk(),
      mediumScreen: NotificationScreenTab(),
      smallScreen: NotificationScreenMob(),
    );
  }
}
