import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/general_info/model.dart';

import 'package:sel_org/ui_1/account/general_info/privacy_policy/privacy_screen.dart';
import 'package:sel_org/ui_1/account/general_info/terms_conditions/terms_condtions_screen.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../../../../resources/drawable/app_drawable.dart';
import '../general_bloc.dart';
import '../general_event.dart';

class GeneralScreenDesk extends CoreWidgets {
  const GeneralScreenDesk({super.key});
  @override
  CoreWidgetsState<GeneralScreenDesk> createState() =>
      _GeneralScreenDeskState();
}

class _GeneralScreenDeskState extends CoreWidgetsState<GeneralScreenDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<GeneralBloc, BaseState>(
        builder: (context, state) {
          if (state is InitialState) {
            context.read<GeneralBloc>().add(GeneralIntitialContent(context));
          }

          return FlutterScaffold(
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            isScrollPhysics: true,
            toolBarTitleString: 'Policies',
            greenBackground: false,
            isAppBar: true,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        vertical: 50.h, horizontal: width * 0.10),
                    child: Column(
                      children: [
                        TappableContainer(
                          svgIcon: AppDrawable().termsLogo,
                          text: 'Terms & Conditions',
                          onTap: () {
                            GoRouter.of(context)
                                .push(TermsConditionScreen.routeName);
                          },
                        ),
                        SizedBox(height: 30.h),
                        TappableContainer(
                          svgIcon: AppDrawable().privacyLogo,
                          text: 'Privacy Policy',
                          onTap: () {
                            GoRouter.of(context)
                                .push(PrivacyPolicyScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.black,
                  ),
          );
        },
        listener: (context, state) {});
  }
}
