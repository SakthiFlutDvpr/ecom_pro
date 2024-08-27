import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/notification/notification_event.dart';

class NotificationBloc extends Bloc<SelectionEvent, BaseState> {
  bool isSelected = false;
  NotificationBloc() : super(NotificationSuccess(false)) {
    on<SelectionChanged>(_onSelectionChanged);
  }

  void _onSelectionChanged(
      SelectionChanged event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    isSelected = event.isSelected;

    //await Future.delayed(const Duration(milliseconds: 400), () {});
    emit(NotificationSuccess(isSelected));
  }
}
