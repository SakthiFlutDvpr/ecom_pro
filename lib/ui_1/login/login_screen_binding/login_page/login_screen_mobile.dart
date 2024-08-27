// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/login_bloc.dart';
import 'package:sel_org/ui_1/login/login_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../../../../core/core_widget/core_widgets.dart';

class LoginScreenMob extends CoreWidgets {
  const LoginScreenMob({super.key});

  @override
  CoreWidgetsState<LoginScreenMob> createState() => _LoginScreenState();
}

class _LoginScreenState extends CoreWidgetsState<LoginScreenMob> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            isLoading: state is LoadingState,
            isAppBar: false,
            backgroundVectorCurve: true,
            child: Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.10),
                    child: Image.asset(AppDrawable().selorgLogo),
                  ),
                  // const Gap(24.0),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: Text("Organic groceries \ndelivered \nin 10 minutes",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white)),
                  ),
                  SizedBox(height: size.height * 0.06),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your 10 digit number",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Form(
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: 40,
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.black),

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: context.read<LoginBloc>().mobileController,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          context.read<LoginBloc>().numLength.value = value;
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          prefixText: "+91- ",
                          prefixStyle: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.black),
                          prefixIcon: const Icon(Icons.mobile_friendly),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black45,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent)),
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

                  Container(
                      padding: EdgeInsets.only(top: size.height * 0.04),
                      width: size.width * 0.8,
                      child: ValueListenableBuilder(
                          valueListenable: context.read<LoginBloc>().numLength,
                          builder: (context, value, child) {
                            return ElevatedButton(
                              onPressed: value.toString().length >= 10
                                  ? () {
                                      context.read<LoginBloc>().add(
                                          CheckMobileNum(
                                              context: context,
                                              mobNum: context
                                                  .read<LoginBloc>()
                                                  .mobileController
                                                  .text));
                                    }
                                  : null,
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.disabled)) {
                                      return Colors.grey;
                                    }
                                    return Theme.of(context)
                                        .buttonTheme
                                        .colorScheme!
                                        .background;
                                  },
                                ),
                                shape: MaterialStateProperty.resolveWith<
                                        OutlinedBorder>(
                                    (Set<MaterialState> states) {
                                  return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.0),
                                  );
                                }),
                              ),
                              child: Text(
                                "Submit",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            );
                          })),

                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: size.height * 0.06),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "By Continuing , You agree to our Terms of Use & Privacy Policy",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ))
                ],
              ),
            ));
      },
    );
  }
}
