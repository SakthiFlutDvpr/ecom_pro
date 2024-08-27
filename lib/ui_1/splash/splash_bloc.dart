import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/constants/const_values/const_values.dart';
import 'package:sel_org/services/storage_services/storage_service_implementation.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_screen.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/login_page/login_screen.dart';
import 'package:sel_org/ui_1/splash/splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, BaseState> {
  SplashBloc() : super(InitialState()) {
    on<SplashInitialContent>(loadInitialContent);
  }

  FutureOr<void> loadInitialContent(
      SplashInitialContent event, Emitter<BaseState> emit) async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black.withOpacity(0.002),
      ),
    );

    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        emit(LoadingState());
        // await StorageServiceImpl()
        //     .setValue(key: AppConstantValues().customerId, value: "");
        await StorageServiceImpl()
            .setValue(key: AppConstantValues().customerName, value: "User 1");
        await StorageServiceImpl()
            .getValue(key: AppConstantValues().customerId)
            .then((value) async {
          if (value.toString().isNotEmpty) {
            emit(SuccessState(successResponse: HomepageScreen.routeName));
          } else {
            emit(SuccessState(successResponse: LoginScreenPage.routeName));
            //emit(SuccessState(successResponse: HomepageScreen.routeName));
          }
        });
        emit(SuccessState(successResponse: true));
      },
    );
  }
}
