import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../notification_bloc.dart';
import '../notification_event.dart';

class NotificationScreenDesk extends CoreWidgets {
  const NotificationScreenDesk({super.key});
  @override
  State<NotificationScreenDesk> createState() => _NotificationScreenDeskState();
}

class _NotificationScreenDeskState extends State<NotificationScreenDesk> {
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
      child: BlocBuilder<NotificationBloc, BaseState>(
        builder: (context, state) {
          bool isSelected = true;
          if (state is SuccessState) {
            isSelected = context.read<NotificationBloc>().isSelected;
          }
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 50.h, horizontal: width * 0.05),
                width: double.infinity,
                color: Colors.white,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 5.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WhatsApp Messages',
                            style: TextStyle(
                              fontSize: 6.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Get updates from us on WhatsApp',
                            style: TextStyle(
                              fontSize: 5.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
        },
      ),
    );
  }
}
