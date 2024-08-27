import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/general_info/general_event.dart';

class GeneralBloc extends Bloc<GeneralEvent, BaseState> {
  GeneralBloc() : super(InitialState()) {
    on<GeneralIntitialContent>(LoadingGeneralContent);
  }

  // ignore: non_constant_identifier_names
  Future<FutureOr<void>> LoadingGeneralContent(
      GeneralIntitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    //await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: true));
  }
}
