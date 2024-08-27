import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';

import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/login_bloc.dart';
import 'package:sel_org/ui_1/login/login_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/font.dart';

import '../../../../utils/flutter_appBar/flutter_app_bar.dart';

class OtpPageWeb extends CoreWidgets {
  const OtpPageWeb({super.key});

  @override
  CoreWidgetsState<OtpPageWeb> createState() => _OtpPageWebState();
}

class _OtpPageWebState extends CoreWidgetsState<OtpPageWeb> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final prefilled = Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: const Color(0xff9A9F97),
    ));
    // final defaultThemePin = PinTheme(
    //   width: MediaQuery.of(context).size.width * 0.04,
    //   height: MediaQuery.of(context).size.height * 0.09,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(5),
    //     color: Colors.white24.withOpacity(0.5),
    //   ),
    //   textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
    //       color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    // );
    return BlocConsumer<LoginBloc, BaseState>(builder: (context, state) {
      debugPrint("timer in : ${context.read<LoginBloc>().timerCount}");

      if (state is InitialState) {
        context.read<LoginBloc>().add(LoadOTPScreenContent(context: context));
      }
      return FlutterScaffold(
          isAppBar: true,
          isLoading: state is LoadingState,
          backgroundVectorCurveWeb: true,
          isScrollPhysics: false,
          toolBarIconEnum: IconEnum.back,
          backgroundFitMob: false,
          toolBarTitleString: "",
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP Verification",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Colors.white,
                              fontSize: 36,
                              fontFamily: Font.poppinsBold.value),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 40),
                      child: Text(
                        "OTP has been sent to +91 ${context.read<LoginBloc>().enteredMobNum}",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ValueListenableBuilder(
                        valueListenable: context.read<LoginBloc>().numLength,
                        builder: (context, value, child) {
                          final isInvalid = value.length ==
                              4; // or any condition to determine invalid OTP

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Pinput(
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                defaultPinTheme: PinTheme(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color:
                                          isInvalid ? Colors.red : Colors.white,
                                    ),
                                    textStyle: isInvalid
                                        ? TextStyle(
                                            fontSize: 5.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)
                                        : TextStyle(
                                            fontSize: 5.sp,
                                            fontWeight: FontWeight.bold)),
                                preFilledWidget: prefilled,
                                autofocus: true,
                                length: 4,
                                showCursor: true,
                                forceErrorState: true,
                                pinAnimationType: PinAnimationType.fade,
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                onChanged: (value) {
                                  context.read<LoginBloc>().numLength.value =
                                      value;
                                },
                                onCompleted: (pin) {
                                  context.read<LoginBloc>().add(VerifyOTP(
                                      context: context, otp: pin.toString()));
                                },
                              ),
                              if (isInvalid)
                                Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Invalid OTP. Please Try Again.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.red),
                                    )),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder(
                          stream: context.read<LoginBloc>().count,
                          builder: (context, snapshot) {
                            int min = 0;
                            int sec = 0;
                            if (snapshot.hasData) {
                              min = snapshot.data! ~/ 60;
                              sec = snapshot.data! % 60;
                            }
                            return Row(
                              children: [
                                Text(
                                  "${min.toString().padLeft(2, "0")} : ${sec.toString().padLeft(2, "0")}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Didn't get it?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: snapshot.data == 0
                                      ? () {
                                          debugPrint("yes");
                                          context.read<LoginBloc>().add(
                                                ResendOtp(
                                                  context: context,
                                                ),
                                              );
                                        }
                                      : null,
                                  child: Text(
                                    "Resend",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: 20,
                                          color: snapshot.data == 0
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    }, listener: (context, state) {
      debugPrint("timer in : ${context.read<LoginBloc>().timerCount}");
      if (state is SuccessState) {
        if (state.successResponse == "otp verified") {
          showSnackBar(
              value: "Otp verified successfully", type: SnackBarType.success);
        }
      } else if (state is FailureState) {
        if (state.errorMessage == "Unable to verify Otp") {
          showSnackBar(value: "Unable to verify Otp");
        }
      }
    });
  }
}
