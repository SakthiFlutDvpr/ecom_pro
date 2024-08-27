// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/account_bloc.dart';
import 'package:sel_org/ui_1/account/account_event.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_widgets/homepage_appbar_desk.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/suggest_utils/suggest_product.dart';

import '../../../resources/colors/app_colors.dart';

class AccountScreenDesk extends CoreWidgets {
  const AccountScreenDesk({super.key});

  @override
  State<AccountScreenDesk> createState() => _AccountScreenMobState();
}

class _AccountScreenMobState extends State<AccountScreenDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AccountBloc, BaseState>(listener: (context, state) {
      if (state is SuccessState) {
        if (state.successResponse == '/suggestions') {
          showDialog(
              context: context,
              builder: (context) {
                return const Dialog(
                  backgroundColor: Color(0xffFFFFFF),
                  insetPadding: EdgeInsets.zero,
                  child: SuggestProductLargeScreen(),
                );
              });
        }
      }
    }, builder: (context, state) {
      return FlutterScaffold(
          isLoading: state is LoadingState,
          isAppBar: true,
          isScrollPhysics: true,
          greenBackground: false,
          toolBarTitleString: "Settings",
          backgroundVectorCurve: false,
          backgroundVectorWave: false,
          toolBarIconEnum: IconEnum.back,
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 50.h, horizontal: width * 0.10),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        leading: SvgPicture.asset(
                          context
                              .read<AccountBloc>()
                              .accountItems[index]
                              .leftIcon,
                          height: 28.h,
                          fit: BoxFit.fitHeight,
                        ),
                        title: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                              context
                                  .read<AccountBloc>()
                                  .accountItems[index]
                                  .text,
                              style: TextStyle(
                                  fontSize: 5.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors().sixgrey,
                                  fontFamily: "Poppins",
                                  overflow: TextOverflow.ellipsis)),
                        ),
                        trailing: Icon(
                          context
                              .read<AccountBloc>()
                              .accountItems[index]
                              .rightIcon,
                          size: 5.sp,
                          color: AppColors().sixgrey,
                        ),
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () {
                          if (context
                                  .read<AccountBloc>()
                                  .accountItems[index]
                                  .route ==
                              '/suggestions') {
                            context.read<AccountBloc>().add(SuggestBottomEvent(
                                text: context
                                    .read<AccountBloc>()
                                    .accountItems[index]
                                    .route));
                          } else {
                            GoRouter.of(context).push(context
                                .read<AccountBloc>()
                                .accountItems[index]
                                .route);
                          }
                        },
                      );
                    },
                    itemCount: context.read<AccountBloc>().accountItems.length,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 65.h,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(35).r,
                              ),
                            ),
                            side: BorderSide(
                                width: 1.0,
                                color: AppColors().logoutButtonColor)),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 5.sp,
                              color: AppColors().logoutButtonColor,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        )),
                  )
                ],
              )));
    });
  }
}
