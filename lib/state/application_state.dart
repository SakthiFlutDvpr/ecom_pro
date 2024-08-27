import 'package:equatable/equatable.dart';
import 'package:sel_org/ui_1/account/orders/orders_entity/order_model.dart';

import 'base_equatable.dart';

abstract class BaseState extends BaseEquatable {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class DismissLoadingState extends BaseState {}

class ValidationErrorState extends BaseState {}

class UnderConstructionState extends BaseState {}

///state for profile screen

class FormSubmitting extends BaseState {}

class FormSubmissionSuccess extends BaseState {}

class FormSubmissionFailure extends BaseState {
  final String error;

  FormSubmissionFailure(this.error);

  @override
  List<Object> get props => [error];
}

///new
class NotificationSuccess extends BaseState {
  final bool isSelected;

  NotificationSuccess(this.isSelected);
}

class EditUserDetailState extends BaseState {
  final bool isFieldEnabled;
  EditUserDetailState(this.isFieldEnabled);
}

class SuccessState extends BaseState {
  final dynamic successResponse;

  SuccessState({this.successResponse});

  @override
  List<Object> get props => [successResponse];
}

class ConnectionStatusState extends BaseState {
  final dynamic connectionStatusMessage;

  ConnectionStatusState({required this.connectionStatusMessage});

  @override
  List<Object> get props => [connectionStatusMessage];
}

class FailureState extends BaseState {
  final dynamic errorMessage;

  FailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

// product dependent state //////////////////////

class ProductUpdateState extends BaseState {
  ProductUpdateState();
}

class ProductDownState extends BaseState {
  ProductDownState();
}

//settings account state

class ScreenNavigationState extends BaseState {
  final int currentIndex;

  ScreenNavigationState(this.currentIndex);
}

//Timer
class TimerUpdateState extends BaseState {
  final int timerCount;

  TimerUpdateState(this.timerCount);
}

class TimerEndedState extends BaseState {}

//btmsheet
class ShowBottomSheetState extends BaseState {}
//RatingState

abstract class RatingState {}

class RatingInitialState extends RatingState {
  final double rating;

  RatingInitialState(this.rating);
}

class RatingUpdatedState extends RatingState {
  final double rating;

  RatingUpdatedState(this.rating);
}

//DeliveredState
abstract class DeliveredState extends Equatable {
  const DeliveredState();

  @override
  List<Object> get props => [];
}

class DeliveredInitial extends DeliveredState {}

class DeliveredLoading extends DeliveredState {}

class DeliveredLoaded extends DeliveredState {
  final Orderlist order;

  const DeliveredLoaded(this.order);

  @override
  List<Object> get props => [order];
}

class DeliveredError extends DeliveredState {
  final String message;

  const DeliveredError(this.message);

  @override
  List<Object> get props => [message];
}
//CancelledState

abstract class OrderCancelledState extends Equatable {
  const OrderCancelledState();

  @override
  List<Object> get props => [];
}

class OrderCancelledLoaded extends OrderCancelledState {
  final Orderlist order;

  const OrderCancelledLoaded(this.order);

  @override
  List<Object> get props => [order];
}

class ErrorState extends BaseState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
