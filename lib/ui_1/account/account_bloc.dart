import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/account_entity/account_model.dart';
import 'package:sel_org/ui_1/account/account_event.dart';
import 'package:sel_org/ui_1/account/address/address_screen.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_screen.dart';
import 'package:sel_org/ui_1/account/general_info/general_screen.dart';
import 'package:sel_org/ui_1/account/notification/notification_screen.dart';
import 'package:sel_org/ui_1/account/orders/orders_screen.dart';
import 'package:sel_org/ui_1/account/profile/profile_screen.dart';
import 'package:sel_org/ui_1/account/refunds/refund_screen.dart';

class AccountBloc extends Bloc<AccountEvent, BaseState> {
  List<ListItem> accountItems = [
    ListItem(
        leftIcon: "assets/svg/order.svg",
        text: "Orders",
        route: OrderScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/faq.svg",
        text: "Customer support & FAQ",
        route: CustomerScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/address.svg",
        text: "Address",
        route: AddressScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/refunds.svg",
        text: "Refunds",
        route: RefundScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/profile.svg",
        text: "Profile",
        route: ProfileScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/suggest.svg",
        text: "Suggest Products",
        route: '/suggestions',
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/generalinfo.svg",
        text: "General Info",
        route: GeneralScreen.routeName,
        rightIcon: Icons.arrow_forward_ios),
    ListItem(
        leftIcon: "assets/svg/notification.svg",
        text: "Notification",
        route: NotificationScreen.routeName,
        rightIcon: Icons.arrow_forward_ios)
  ];
  AccountBloc() : super(InitialState()) {
    on<SuggestBottomEvent>(buildSuggestBottomSheet);
    on<ThankYouBottomEvent>(buildThankBottomSheet);
  }

  FutureOr<void> buildSuggestBottomSheet(
      SuggestBottomEvent event, Emitter<BaseState> emit) {
    emit(SuccessState(successResponse: event.text));
  }

  FutureOr<void> buildThankBottomSheet(
      ThankYouBottomEvent event, Emitter<BaseState> emit) {
    emit(SuccessState(successResponse: event.result));
  }
}
