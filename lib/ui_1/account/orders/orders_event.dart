import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'orders_entity/order_model.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderInitialEvent extends OrderEvent {
  final BuildContext context;

  const OrderInitialEvent(this.context);

  @override
  List<Object> get props => [context];
}

class ShowRatingBottomSheetEvent extends OrderEvent {}

class ViewOrderDeliveredEvent extends OrderEvent {
  final Orderlist order;

  const ViewOrderDeliveredEvent(this.order);

  @override
  List<Object> get props => [order];
}

class ViewOrderCancelledEvent extends OrderEvent {
  final Orderlist order;

  const ViewOrderCancelledEvent(this.order);

  @override
  List<Object> get props => [order];
}
