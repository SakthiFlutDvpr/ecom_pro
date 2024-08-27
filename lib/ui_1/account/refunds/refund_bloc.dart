import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/refunds/refund_event.dart';

class RefundBloc extends Bloc<RefundEvent, BaseState> {
  RefundBloc() : super(InitialState()) {
    on<RefundInitialContent>(loadingRefundContent);
  }

  Future<void> loadingRefundContent(
      RefundInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: true));
  }
}
