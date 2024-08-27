import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class InitialLoginContent extends LoginEvent {
  final BuildContext context;

  InitialLoginContent({required this.context});
}

class CheckMobileNum extends LoginEvent {
  final BuildContext context;
  final String mobNum;

  CheckMobileNum({required this.context, required this.mobNum});
}

class LoadOTPScreenContent extends LoginEvent {
  final BuildContext context;

  LoadOTPScreenContent({required this.context});
}

class ResendOtp extends LoginEvent {
  final BuildContext context;

  ResendOtp({required this.context});
}


class VerifyOTP extends LoginEvent {
  final BuildContext context;
  final String otp;

  VerifyOTP({required this.context, required this.otp});
}

class TimerEvent extends LoginEvent {}
