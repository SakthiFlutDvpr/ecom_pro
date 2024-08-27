import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sel_org/constants/constants.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/login_bloc.dart';
import 'package:sel_org/ui_1/login/login_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/font.dart';

class OtpPageMob extends CoreWidgets {
  const OtpPageMob({super.key});

  @override
  CoreWidgetsState<OtpPageMob> createState() => _OtpPageState();
}

class _OtpPageState extends CoreWidgetsState<OtpPageMob> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final prefilled = Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: const Color(0xff9A9F97),
    ));

    return BlocConsumer<LoginBloc, BaseState>(builder: (context, state) {
      if (state is InitialState) {
        context.read<LoginBloc>().add(LoadOTPScreenContent(context: context));
      }
      return FlutterScaffold(
          isAppBar: true,
          isLoading: state is LoadingState,
          backgroundVectorCurve: true,
          isScrollPhysics: false,
          toolBarIconEnum: IconEnum.back,
          // leadingIcon: const Icon(
          //   Icons.arrow_back_rounded,
          //   color: Colors.white,
          // ),
          child: SafeArea(
            child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OTP \nVerification",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontFamily: Font.poppinsBold.value),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            "OTP has been sent to ${context.read<LoginBloc>().enteredMobNum}",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.08),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ValueListenableBuilder(
                            valueListenable:
                                context.read<LoginBloc>().numLength,
                            builder: (context, value, child) {
                              final isInvalid = value.length ==
                                  4; // or any condition to determine invalid OTP

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Pinput(
                                    androidSmsAutofillMethod:
                                        AndroidSmsAutofillMethod
                                            .smsUserConsentApi,
                                    listenForMultipleSmsOnAndroid: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    defaultPinTheme: PinTheme(
                                      width: 40.w,
                                      height: 40.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: isInvalid
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                      textStyle: isInvalid
                                          ? Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(color: Colors.white)
                                          : Theme.of(context)
                                              .textTheme
                                              .headlineSmall!,
                                    ),
                                    preFilledWidget: prefilled,
                                    autofocus: true,
                                    length: 4,
                                    showCursor: true,
                                    forceErrorState: true,
                                    pinAnimationType: PinAnimationType.fade,
                                    pinputAutovalidateMode:
                                        PinputAutovalidateMode.onSubmit,
                                    onChanged: (value) {
                                      context
                                          .read<LoginBloc>()
                                          .numLength
                                          .value = value;
                                    },
                                    onCompleted: (pin) {
                                      context.read<LoginBloc>().add(VerifyOTP(
                                          context: context,
                                          otp: pin.toString()));
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
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        // StreamBuilder(
                        //     stream: context.read<LoginBloc>().count,
                        //     builder: (context, snapshot) {
                        //       print("my time is ${snapshot.data}");
                        //       if (snapshot.hasData) {
                        //         int min = snapshot.data! ~/ 60;
                        //         int sec = snapshot.data! % 60;
                        //         return Text(
                        //             "${min.toString().padLeft(2, "0")} : ${sec.toString().padLeft(2, "0")}",
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .headlineMedium!
                        //                 .copyWith(
                        //                   color: Colors.white,
                        //                 ));
                        //       } else {
                        //         return Text("00 : 00",
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .headlineMedium!
                        //                 .copyWith(
                        //                   color: Colors.white,
                        //                 ));
                        //       }
                        //     }),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                                              fontSize: 18
                                                  .sp, // Adjust the text size with ScreenUtil
                                              color: Colors.white,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          "Didn't get it? ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                fontSize: 16
                                                    .sp, // Adjust the text size with ScreenUtil
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                      width(5.w),
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
                                          " Resend",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                fontSize: 16
                                                    .sp, // Adjust the text size with ScreenUtil
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ));
    }, listener: (context, state) {
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
