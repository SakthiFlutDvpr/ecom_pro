import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/account_bloc.dart';
import 'package:sel_org/ui_1/account/account_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/suggest_utils/suggest_product.dart';

class AccountScreenMob extends CoreWidgets {
  const AccountScreenMob({super.key});

  @override
  CoreWidgetsState<AccountScreenMob> createState() => _AccountScreenMobState();
}

class _AccountScreenMobState extends CoreWidgetsState<AccountScreenMob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AccountBloc, BaseState>(listener: (context, state) {
      if (state is SuccessState) {
        if (state.successResponse == '/suggestions') {
          showModalBottomSheet(
              isScrollControlled: false,
              context: context,
              builder: (context) {
                return const SuggestproductSmallScreen();
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
                  vertical: 25.h, horizontal: width * 0.04),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SvgPicture.asset(
                          context
                              .read<AccountBloc>()
                              .accountItems[index]
                              .leftIcon,
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                            context
                                .read<AccountBloc>()
                                .accountItems[index]
                                .text,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors().sixgrey,
                                fontFamily: "Poppins",
                                overflow: TextOverflow.ellipsis)),
                        trailing: Icon(
                          context
                              .read<AccountBloc>()
                              .accountItems[index]
                              .rightIcon,
                          size: 16.sp,
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
                  Divider(
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 45.h,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(25).r,
                              ),
                            ),
                            side: BorderSide(
                                width: 1.0,
                                color: AppColors().logoutButtonColor)),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
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
