import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/constants/const_values/const_values.dart';
import 'package:sel_org/services/storage_services/storage_service_implementation.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/entity/login_models.dart';
import 'package:sel_org/ui_1/login/login_event.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/otp_page/otp_screen.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_binding/get_user_location/get_location_screen.dart';

import '../../services/network_layer/network_api_service.dart';

class LoginBloc extends Bloc<LoginEvent, BaseState> {
  TextEditingController mobileController = TextEditingController();
  bool isbuttonEnabled = false;
  ValueNotifier numLength = ValueNotifier<String>("");
  Stream<int>? count;
  Timer? timer;
  StreamController<int>? streamController;
  String? enteredMobNum = "";
  int? timerCount = 20;

  LoginBloc() : super(InitialState()) {
    on<InitialLoginContent>(loadInitialLoginContent);
    on<CheckMobileNum>(checkMobileNum);
    on<LoadOTPScreenContent>(loadOtpPage);
    on<VerifyOTP>(verifyOTP);
    on<ResendOtp>(resendOtp);
  }

  FutureOr<void> loadInitialLoginContent(
      InitialLoginContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    emit(SuccessState(successResponse: true));
  }

  FutureOr checkMobileNum(CheckMobileNum event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    if (event.mobNum.isNotEmpty && event.mobNum.length == 10) {
      await StorageServiceImpl()
          .setValue(
              key: AppConstantValues().customerMobNum,
              value: event.mobNum.toString())
          .then((value) async {
        await NetworkCalls.getOtp(body: {
          "phoneNumber": event.mobNum.toString(),
          "orgid": AppConstantValues().orgId
        }).then((response) async {
          await StorageServiceImpl().setValue(
              key: AppConstantValues().customerId,
              value: response["message"]["customer_id"]);
          if (response != false) {
            // ignore: use_build_context_synchronously
            GoRouter.of(event.context).pushReplacement(OtpPageScreen.routeName);
            emit(SuccessState(successResponse: response));
          } else {
            emit(SuccessState(successResponse: "Something wrong"));
          }
        });
      });
    } else {
      emit(FailureState(errorMessage: "Invalid mobile number"));
    }
  }

  FutureOr resendOtp(ResendOtp event, Emitter<BaseState> emit) async {
    await NetworkCalls.getOtp(body: {
      "phoneNumber": await StorageServiceImpl()
          .getValue(key: AppConstantValues().customerMobNum),
      "orgid": AppConstantValues().orgId
    }).then((response) {
      if (response != false) {
        emit(SuccessState(successResponse: "OTP sent successfully"));
        startTimer(); // Restart the timer
        on<LoadOTPScreenContent>(loadOtpPage);
      } else {
        emit(SuccessState(successResponse: "Something wrong"));
      }
    });
  }

  FutureOr loadOtpPage(
      LoadOTPScreenContent event, Emitter<BaseState> emit) async {
    enteredMobNum = await StorageServiceImpl()
        .getValue(key: AppConstantValues().customerMobNum);
    startTimer(); // Start the timer when OTP page loads
    emit(SuccessState(successResponse: true));
  }

  void startTimer() {
    timerCount = 20;
    if (timer != null) {
      timer!.cancel();
    }
    if (streamController != null) {
      streamController!.close();
    }
    streamController = StreamController<int>();
    count = streamController!.stream;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (timerCount! > 0) {
        timerCount = timerCount! - 1;
        streamController!.add(timerCount!);
      } else {
        timer.cancel();
        streamController!.add(0); // Ensure 0 is emitted when timer stops
      }
    });
  }

  FutureOr verifyOTP(VerifyOTP event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    if (event.otp.toString().length == 4) {
      await NetworkCalls.verifyOtp(body: {
        "phoneNumber": await StorageServiceImpl()
            .getValue(key: AppConstantValues().customerMobNum),
        "otp": event.otp,
        "customer_id": await StorageServiceImpl()
            .getValue(key: AppConstantValues().customerId)
      }).then((response) async {
        if (response.data["message"]["status"] == 200) {
          GoRouter.of(event.context)
              .pushReplacement(GetLocationScreen.routeName);
          emit(SuccessState(successResponse: "OTP verified"));
        } else {
          emit(FailureState(errorMessage: "Unable to verify OTP"));
        }
      });
    }
  }
}
