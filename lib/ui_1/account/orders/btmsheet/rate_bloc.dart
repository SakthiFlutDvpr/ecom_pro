import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/ui_1/account/orders/btmsheet/rate_event.dart';

import '../../../../state/application_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingInitialState(0.0)) {
    on<UpdateRatingEvent>((event, emit) {
      emit(RatingUpdatedState(event.rating));
    });
  }
}
