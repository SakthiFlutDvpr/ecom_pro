import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/profile/profile_bloc.dart';
import 'package:sel_org/ui_1/account/profile/profile_event.dart';

import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';

import 'package:sel_org/utils/reusable_widgets/text_form_field.dart';

class ProfileScreenDesk extends CoreWidgets {
  const ProfileScreenDesk({super.key});

  @override
  CoreWidgetsState<ProfileScreenDesk> createState() =>
      _ProfileScreenDeskState();
}

class _ProfileScreenDeskState extends CoreWidgetsState<ProfileScreenDesk> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontFamily: "Poppins-SemiBold",
        fontSize: 4.5.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff434141));
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<ProfileBloc>().add(ProfileInitialContent(context));
        }
        return FlutterScaffold(
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            isLoading: state is LoadingState,
            isScrollPhysics: true,
            toolBarTitleString: 'Profile',
            greenBackground: false,
            isAppBar: true,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        vertical: 50.h, horizontal: width * 0.10),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller:
                                context.read<ProfileBloc>().nameController,
                            hintText: state.successResponse["name"].toString(),
                            hintStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 5.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text("Mobile Number*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller:
                                context.read<ProfileBloc>().mobileController,
                            hintText:
                                state.successResponse["phoneNumber"].toString(),
                            hintStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 5.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Text("Email Address*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller:
                                context.read<ProfileBloc>().emailController,
                            hintText: state.successResponse["email"].toString(),
                            hintStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 5.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text("We promise not spam you",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 4.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors().sixgrey)),
                          SizedBox(
                            height: 75.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width * 0.20,
                              height: 75.h,
                              child: SelorgElevatedButton(
                                onTap: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(ProfileUpdateEvent());
                                },
                                text: "Submit",
                                size: 4.sp,
                              ),
                            ),
                          )
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
}
