import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_bloc.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';
import 'package:sel_org/utils/reusable_widgets/text_form_field.dart';

class AddAddressDetailsTab extends CoreWidgets {
  const AddAddressDetailsTab({super.key});

  @override
  CoreWidgetsState<AddAddressDetailsTab> createState() =>
      _AddAddressDetailsTabState();
}

class _AddAddressDetailsTabState
    extends CoreWidgetsState<AddAddressDetailsTab> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final hintStyle = TextStyle(
        fontFamily: "Poppins", fontSize: 6.sp, color: AppColors().sixgrey);
    final labelTextStyle = TextStyle(
        fontSize: 7.sp,
        fontWeight: FontWeight.bold,
        color: AppColors().fourgrey);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AddAddressBloc, BaseState>(builder: (context, state) {
      if (state is InitialState) {
        context.read<AddAddressBloc>().add(AddAddressContent(context: context));
      }
      return FlutterScaffold(
          resizeToAvoidBottomInset: true,
          isScrollPhysics: true,
          isAppBar: true,
          greenBackground: false,
          backgroundVectorCurve: false,
          toolBarTitleString: "Add Address Details",
          toolBarIconEnum: IconEnum.back,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 25.h),
                height: height * 0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                title: Text(
                  context
                      .read<AddAddressBloc>()
                      .userPickedAddress
                      .split(',')[0]
                      .toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 7.sp,
                      height: 1.75,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                  context.read<AddAddressBloc>().userPickedAddress.toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 6.sp,
                      height: 1.75,
                      color: const Color(0xff202020),
                      overflow: TextOverflow.fade),
                ),
                trailing: SizedBox(
                  width: 40.w,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        side: const BorderSide(color: Color(0xff034703)),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r)))),
                    child: Text(
                      "Change",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "House No. & Floor ",
                      style: labelTextStyle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().addressLine1,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Building & Block No.",
                      style: labelTextStyle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().addressLine2,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Landmark & Area name(Optional)",
                      style: labelTextStyle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().landmark,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Add Address label",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 5.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addressLabel("Home"),
                        SizedBox(
                          width: 8.w,
                        ),
                        addressLabel("Work"),
                        SizedBox(
                          width: 8.w,
                        ),
                        addressLabel("Other"),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 60.h,
                            width: width * 0.50,
                            margin: EdgeInsets.symmetric(vertical: 50.h),
                            child: SelorgElevatedButton(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Small curve radius
                                      ),
                                      content: SizedBox(
                                        width: width * 0.30,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AppDrawable().tick,
                                              height: 150.h,
                                              width: 150.w,
                                            ),
                                            SizedBox(height: 20.h),
                                            Text(
                                              'Your address has been saved',
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 5.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              text: "Add Address To Proceed",
                              size: 7.sp,
                            )),
                      ],
                    )
                  ],
                )),
              )
            ],
          ));
    }, listener: (context, state) {
      // if (state is SuccessState) {
      //   if (state.successResponse == "addressSaved") {
      //     showSnackBar(
      //         value: "Address saved successfully", type: SnackBarType.success);
      //     GoRouter.of(context).push(HomepageScreen.routeName);
      //   }
      // }
    });
  }

  Widget addressLabel(String text) {
    return OutlinedButton(
        onPressed: () {
          context.read<AddAddressBloc>().add(SelectedAddressLabel(label: text));
        },
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            backgroundColor:
                context.read<AddAddressBloc>().addressLabel.toLowerCase() ==
                        text.toLowerCase()
                    ? AppColors().productCardColor
                    : Colors.transparent,
            side: BorderSide(color: AppColors().sixgrey, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.r)))),
        child: Text(text,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 6.sp,
                color: AppColors().sixgrey)));
  }
}
