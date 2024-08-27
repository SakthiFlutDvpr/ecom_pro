import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/notification/notification_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../notification_bloc.dart';

class NotificationScreenMob extends CoreWidgets {
  const NotificationScreenMob({super.key});
  @override
  CoreWidgetsState<NotificationScreenMob> createState() =>
      _NotificationScreenMobState();
}

class _NotificationScreenMobState
    extends CoreWidgetsState<NotificationScreenMob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FlutterScaffold(
        backgroundVectorWave: false,
        backgroundVectorCurve: false,
        isScrollPhysics: true,
        toolBarTitleString: 'Notifications',
        greenBackground: false,
        isAppBar: true,
        toolBarIconEnum: IconEnum.back,
        child:
            BlocBuilder<NotificationBloc, BaseState>(builder: (context, state) {
          bool isSelected = true;
          if (state is SuccessState) {
            isSelected = context.read<NotificationBloc>().isSelected;
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 25.h, horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('WhatsApp Messages',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors().twoblack,
                                )),
                            SizedBox(height: 5.h),
                            Text('Get updates from us on WhatsApp',
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  color: AppColors().sixgrey,
                                )),
                          ],
                        ),
                      ),
                      Switch(
                        value: isSelected,
                        onChanged: (onChangedValue) {
                          context
                              .read<NotificationBloc>()
                              .add(SelectionChanged(!isSelected));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
