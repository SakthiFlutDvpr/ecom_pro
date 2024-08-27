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

class ProfileScreenMob extends CoreWidgets {
  const ProfileScreenMob({super.key});

  @override
  CoreWidgetsState<ProfileScreenMob> createState() =>
      _ProfileScreenMobileState();
}

class _ProfileScreenMobileState extends CoreWidgetsState<ProfileScreenMob> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors().twoblack);
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    ProfileBloc bloc = context.read<ProfileBloc>();
    return BlocConsumer<ProfileBloc, BaseState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          bloc.add(ProfileInitialContent(context));
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
                        vertical: 20.h, horizontal: width * 0.04),
                    child: Form(
                      key: bloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller: bloc.nameController,
                            size: 12.sp,
                            hintText: "Sakthivel S",
                            horizontalPadding: 8.w,
                            validate: (value) {
                              if (value.toString().isEmpty) {
                                return "Field is Empty";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Mobile Number*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller: bloc.mobileController,
                            size: 12.sp,
                            hintText: "8667408687",
                            horizontalPadding: 8.w,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Email Address*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            fillColor: const Color(0xffFAFAFA),
                            controller: bloc.emailController,
                            size: 12.sp,
                            hintText: "syyy6339@gmail.com",
                            horizontalPadding: 8.w,
                            validate: (value) {
                              if (value.toString().isEmpty) {
                                return "Field is Empty";
                              }

                              return null;
                            },
                            onSaved: (value) {},
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("We promise not spam you",
                              style: TextStyle(
                                  fontSize: 11.sp, color: AppColors().sixgrey)),
                          SizedBox(
                            height: 35.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SelorgElevatedButton(
                                  onTap: () {
                                    if (bloc.formKey.currentState!.validate()) {
                                      bloc.formKey.currentState!.save();
                                    }
                                  },
                                  text: "Submit",
                                  size: 12.sp,
                                ),
                              ),
                            ],
                          ),
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
