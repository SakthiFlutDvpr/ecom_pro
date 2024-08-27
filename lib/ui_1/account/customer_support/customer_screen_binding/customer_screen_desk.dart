import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_bloc.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_entity/customer_informations.dart';
import 'package:sel_org/ui_1/account/customer_support/customer_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class CustomerScreenDesk extends StatefulWidget {
  const CustomerScreenDesk({super.key});

  @override
  State<CustomerScreenDesk> createState() => _CustomerScreenDeskState();
}

class _CustomerScreenDeskState extends State<CustomerScreenDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //  double height = MediaQuery.of(context).size.height;
    final titleStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 6.sp,
        fontWeight: FontWeight.bold,
        color: AppColors().fourgrey);
    final paraStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 4.sp,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.fade,
        height: 1.75,
        color: AppColors().fourgrey);

    return BlocConsumer<CustomerBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<CustomerBloc>().add(CustomerInitialContent(context));
        }
        return FlutterScaffold(
            isLoading: state is LoadingState,
            isAppBar: true,
            isScrollPhysics: true,
            toolBarTitleString: 'Customer support & FAQs',
            greenBackground: false,
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.10, vertical: 50.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(CustomerStrings().titleOne, style: titleStyle),
                        Text(
                          CustomerStrings().paraOne,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleTwo, style: titleStyle),
                        Text(
                          CustomerStrings().paraTwo,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleThree, style: titleStyle),
                        Text(
                          CustomerStrings().paraThree,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleFour, style: titleStyle),
                        Text(
                          CustomerStrings().paraFour,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleFive, style: titleStyle),
                        Text(
                          CustomerStrings().paraFive,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleSix, style: titleStyle),
                        Text(
                          CustomerStrings().paraSix,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleSeven, style: titleStyle),
                        Text(
                          CustomerStrings().paraSeven,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleEight, style: titleStyle),
                        Text(
                          CustomerStrings().paraEight,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleNine, style: titleStyle),
                        Text(
                          CustomerStrings().paraNine,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleTen, style: titleStyle),
                        Text(
                          CustomerStrings().paraTen,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleEleven, style: titleStyle),
                        Text(
                          CustomerStrings().paraEleven,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(CustomerStrings().titleTwelve, style: titleStyle),
                        Text(
                          CustomerStrings().paraTwelve,
                          style: paraStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.black,
                  ));
      },
    );
  }
}
