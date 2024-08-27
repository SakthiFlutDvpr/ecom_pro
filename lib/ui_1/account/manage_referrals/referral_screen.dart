import 'package:flutter/material.dart';
import 'package:sel_org/ui_1/account/manage_referrals/referral_screen_binding/referral_screen_mobile.dart';
import 'package:sel_org/utils/responsive_widget/responsive_widget.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});
  static const String routeName = "/referrals";
  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      largeScreen: ReferralScreenMob(),
      mediumScreen: ReferralScreenMob(),
      smallScreen: ReferralScreenMob(),
    );
  }
}
