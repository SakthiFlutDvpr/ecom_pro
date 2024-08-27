// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/login_bloc.dart';
import 'package:sel_org/ui_1/login/login_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/font.dart';

import '../../../../core/core_widget/core_widgets.dart';

class LoginScreenWeb extends CoreWidgets {
  const LoginScreenWeb({super.key});

  @override
  CoreWidgetsState<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends CoreWidgetsState<LoginScreenWeb> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginBloc, BaseState>(
      listener: (context, state) {
        if (state is FailureState) {
          if (state.errorMessage.toString() == "invalid mobile number") {
            showSnackBar(
              value: "Enter valid mobile number",
              type: SnackBarType.info,
            );
          } else if (state.errorMessage.toString() == "otp error") {
            showSnackBar(
              value: "Unable to get OTP, please try after sometime",
              type: SnackBarType.fail,
            );
          }
        } else if (state is SuccessState) {
          if (state.successResponse == "Something wrong") {
            showSnackBar(
              value: "Unable to get OTP, please try after sometime",
              type: SnackBarType.fail,
            );
          }
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          context.read<LoginBloc>().add(InitialLoginContent(context: context));
        }
        return FlutterScaffold(
            isScrollPhysics: true,
            isLoading: state is LoadingState,
            isAppBar: false,
            backgroundFitMob: false,
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Image.asset(
                        AppDrawable().selorgLogo,
                      ),
                    ),
                    // const Gap(24.0),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 32.0, right: 32.0, top: 24, bottom: 50),
                      child: Text(
                        "Organic groceries delivered in 10 minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    // const Gap(32.0),

                    SizedBox(
                      width: width * 0.3,
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter your 10 digit number",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            child: Form(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: Font.poppinsSemiBold.value),

                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller:
                                    context.read<LoginBloc>().mobileController,
                                maxLength: 10,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  counterText: '',
                                  // prefixText: "",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                            left: 20, right: 10)
                                        .r,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          AppDrawable().indiaimg,
                                          width: 10.w,
                                          height: 25.h,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          "  +91  ",
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 4.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Container(
                                            width: 0.5.w,
                                            height: 33.h,
                                            color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: const BorderSide(
                                          color: Colors.redAccent)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),

                                // focusNode: _focusNode,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Gap(32.0),

                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: SizedBox(
                        width: width * 0.3,
                        height: height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(CheckMobileNum(
                                context: context,
                                mobNum: context
                                    .read<LoginBloc>()
                                    .mobileController
                                    .text));
                          },
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                return Theme.of(context)
                                    .buttonTheme
                                    .colorScheme!
                                    // ignore: duplicate_ignore
                                    // ignore: deprecated_member_use
                                    .background;
                              },
                            ),
                            shape: MaterialStateProperty.resolveWith<
                                OutlinedBorder>((Set<MaterialState> states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              );
                            }),
                          ),
                          child: Text(
                            "Submit",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: size.height * 0.25),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "By Continuing , You agree to our Terms of Use & Privacy Policy",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
