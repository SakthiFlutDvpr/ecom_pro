import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/general_info/general_bloc.dart';
import 'package:sel_org/ui_1/account/general_info/general_event.dart';
import 'package:sel_org/ui_1/account/general_info/privacy_policy/privacy_entity/privacy_informations.dart';

import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class PrivacyPolicyScreenMob extends CoreWidgets {
  const PrivacyPolicyScreenMob({super.key});
  @override
  CoreWidgetsState<PrivacyPolicyScreenMob> createState() =>
      _PrivacyPolicyScreenMobState();
}

class _PrivacyPolicyScreenMobState
    extends CoreWidgetsState<PrivacyPolicyScreenMob> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        height: 1.75);
    final paraStyle =
        TextStyle(fontFamily: "Poppins", fontSize: 11.sp, height: 1.75);
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
            toolBarTitleString: 'Privacy Policy',
            greenBackground: false,
            isAppBar: true,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PrivacyStrings().titleOne,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraOne,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleTwo,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraTwo,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleThree,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraThree,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleFour,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraFour,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleFive,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraFive,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleSix,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraSix,
                          style: paraStyle,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          PrivacyStrings().titleSeven,
                          style: titleStyle,
                        ),
                        Text(
                          PrivacyStrings().paraSeven,
                          style: paraStyle,
                        ),
                      ],
                    ))
                : Container(
                    color: Colors.black,
                  ),
          );
        },
        listener: (context, state) {});
  }
}
