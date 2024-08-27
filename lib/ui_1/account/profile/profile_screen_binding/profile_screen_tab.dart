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

class ProfileScreenTab extends CoreWidgets {
  const ProfileScreenTab({super.key});

  @override
  CoreWidgetsState<ProfileScreenTab> createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends CoreWidgetsState<ProfileScreenTab> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
        color: AppColors().twoblack);
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
                        vertical: 50.h, horizontal: width * 0.05),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                              controller:
                                  context.read<ProfileBloc>().nameController),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Mobile Number*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                            controller:
                                context.read<ProfileBloc>().mobileController,
                            fillColor: const Color(0xFFEFF1E7),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("Email Address*", style: titleStyle),
                          SizedBox(
                            height: 10.h,
                          ),
                          SelorgTextField(
                              controller:
                                  context.read<ProfileBloc>().emailController),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("We promise not spam you",
                              style: TextStyle(
                                  fontSize: 7.sp, color: AppColors().sixgrey)),
                          SizedBox(
                            height: 50.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: SelorgElevatedButton(
                                onTap: () {},
                                text: "Add Address To Proceed",
                                size: 12.sp,
                              )),
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
