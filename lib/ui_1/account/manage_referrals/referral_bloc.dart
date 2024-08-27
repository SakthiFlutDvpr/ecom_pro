import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/manage_referrals/referral_event.dart';

class ReferralBloc extends Bloc<ReferralEvent, BaseState> {
  ReferralBloc() : super(InitialState()) {
    on<ReferralInitialContent>(loadingReferralContent);
  }

  Future<void> loadingReferralContent(
      ReferralInitialContent event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    // await Future.delayed(const Duration(seconds: 1));
    emit(SuccessState(successResponse: true));
  }
}
