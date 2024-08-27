import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/manage_referrals/referral_bloc.dart';
import 'package:sel_org/ui_1/account/manage_referrals/referral_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class ReferralScreenMob extends StatefulWidget {
  const ReferralScreenMob({super.key});

  @override
  State<ReferralScreenMob> createState() => _ReferralScreenMobState();
}

class _ReferralScreenMobState extends State<ReferralScreenMob> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<ReferralBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<ReferralBloc>().add(ReferralInitialContent(context));
        }
        return FlutterScaffold(
          isLoading: state is LoadingState,
          isAppBar: true,
          toolBarTitleString: 'Referrals',
          isScrollPhysics: false,
          backgroundVectorCurve: false,
          backgroundVectorWave: false,
          toolBarIconEnum: IconEnum.back,
          child: state is SuccessState
              ? Container(
                  width: width,
                  height: height,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Center(
                    child: Text(
                      "Manage Referral Screen",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
              : Container(
                  color: Colors.black,
                ),
        );
      },
    );
  }
}
