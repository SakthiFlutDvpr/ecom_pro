import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/refunds/refund_bloc.dart';
import 'package:sel_org/ui_1/account/refunds/refund_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class RefundScreenTab extends CoreWidgets {
  const RefundScreenTab({super.key});

  @override
  CoreWidgetsState<RefundScreenTab> createState() => _RefundScreenTabState();
}

class _RefundScreenTabState extends CoreWidgetsState<RefundScreenTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<RefundBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<RefundBloc>().add(RefundInitialContent(context));
        }
        return FlutterScaffold(
            isLoading: state is LoadingState,
            isAppBar: true,
            toolBarTitleString: 'Refunds',
            greenBackground: false,
            isScrollPhysics: true,
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? state.successResponse
                    ? Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                            vertical: 50.h, horizontal: width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Active",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff222222))),
                            SizedBox(
                              height: 15.h,
                            ),
                            refundActive(),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text("Completed",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff222222))),
                            SizedBox(
                              height: 15.h,
                            ),
                            refundCompleted(),
                          ],
                        ),
                      )
                    : Container(
                        width: width,
                        height: height,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No Refunds",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 10.sp,
                                    color: const Color(0xff222222),
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text("You have  no active or past refunds.")
                            ],
                          ),
                        ),
                      )
                : Container(
                    color: Colors.black,
                  ));
      },
    );
  }

  Widget refundCompleted() {
    return Card(
      elevation: 5,
      color: const Color(0xFFFFFFFF),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text("Order ID. 8GED4BBHQ80037 - ₹37",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: const Color(0xff222222))),
                ),
                Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                      color: const Color(0xff6DD14A),
                      borderRadius: BorderRadius.all(Radius.circular(4.r))),
                  child: Text("Completed",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text("02/11/23 at 10:20pm",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 7.sp,
                      color: AppColors().sevengrey,
                      overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
      ),
    );
  }

  Widget refundActive() {
    return Card(
      elevation: 5,
      color: const Color(0xFFFFFFFF),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text("Order ID. 8GED4BBHQ80037 - ₹37",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: const Color(0xff222222))),
                ),
                Container(
                  width: 50.w,
                  padding: EdgeInsets.all(4.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffda18187),
                      borderRadius: BorderRadius.all(Radius.circular(4.r))),
                  child: Text("In Progress",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Text("02/11/23 at 10:20pm",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 7.sp,
                      color: AppColors().sevengrey,
                      overflow: TextOverflow.ellipsis)),
            ),
            SizedBox(
              height: 8.h,
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: SizedBox(
                height: 20.h,
                child: Image.asset(
                  "assets/png/clock_icon.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              title: Text("Processing your refund",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors().fourgrey,
                      overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
      ),
    );
  }
}
