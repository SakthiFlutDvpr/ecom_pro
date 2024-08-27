import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/ui_1/account/orders/orders_event.dart';

import '../../../state/application_state.dart';
import 'orders_entity/order_model.dart';

class OrderBloc extends Bloc<OrderEvent, BaseState> {
  List<Orderlist> orders = [];

  OrderBloc() : super(InitialState()) {
    on<OrderInitialEvent>(_loadingOrderContent);
    on<ShowRatingBottomSheetEvent>(_handleShowRatingBottomSheet);
    on<ViewOrderDeliveredEvent>(_handleViewOrderDelivered);
    on<ViewOrderCancelledEvent>(_handleViewOrderCancelled);
  }

  Future<void> _loadingOrderContent(
      OrderInitialEvent event, Emitter<BaseState> emit) async {
    emit(LoadingState());

    debugPrint('Loading orders...');
    await Future.delayed(const Duration(seconds: 1));
    try {
      orders.addAll([
        Orderlist(
          status: 'Order Delivered',
          orderdetails: 'Rate Order ',
          date: 'Placed at 21st Jun 2024',
          time: '08:50 am',
          amount: '183.06',
          productname: 'aaa',
          imageUrls: ['assets/png/a.png', 'assets/png/badam.png'],
        ),
        Orderlist(
          status: 'Order Cancelled',
          orderdetails: 'Order Again',
          date: 'Placed at 21st Jun 2024',
          time: '09:15 am',
          amount: '150.50',
          productname: 'aaa',
          imageUrls: [
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png'
          ],
        ),
        Orderlist(
          status: 'Order Delivered',
          orderdetails: 'Rate Order ',
          date: 'Placed at 21st Jun 2024',
          time: '08:50 am',
          amount: '183.06',
          productname: 'aaa',
          imageUrls: ['assets/png/order_icon.png'],
        ),
        Orderlist(
          status: 'Order Delivered',
          orderdetails: 'Rate Order ',
          date: 'Placed at 21st Jun 2024',
          time: '08:50 am',
          amount: '183.06',
          productname: 'aaa',
          imageUrls: [
            'assets/png/order_icon.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/order_icon.png'
          ],
        ),
        Orderlist(
          status: 'Order Delivered',
          orderdetails: 'Rate Order ',
          date: 'Placed at 21st Jun 2024',
          time: '08:50 am',
          amount: '183.06',
          productname: 'aaa',
          imageUrls: ['assets/png/a.png'],
        ),
        Orderlist(
          status: 'Order Cancelled',
          orderdetails: 'Order Again',
          date: 'Placed at 21st Jun 2024',
          time: '09:15 am',
          amount: '150.50',
          productname: 'aaa',
          imageUrls: [
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png',
            'assets/png/apple.png',
            'assets/png/a.png',
            'assets/png/din.png'
          ],
        ),
      ]);

      emit(SuccessState(
        successResponse: orders,
      ));
    } catch (e) {
      emit(ErrorState(errorMessage: 'Failed to load orders: $e'));
    }
  }
}

void _handleShowRatingBottomSheet(
    ShowRatingBottomSheetEvent event, Emitter<BaseState> emit) {
  emit(ShowBottomSheetState());
}

void _handleViewOrderDelivered(
    ViewOrderDeliveredEvent event, Emitter<BaseState> emit) {
  debugPrint('View Order Delivered: ${event.order}');
}

void _handleViewOrderCancelled(
    ViewOrderCancelledEvent event, Emitter<BaseState> emit) {
  debugPrint('View Order Cancelled: ${event.order}');
}
