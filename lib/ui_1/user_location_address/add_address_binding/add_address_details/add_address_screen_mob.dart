import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

import '../../../dashboard/homepage/homepage_screen.dart';

class AddAddressDetailsMob extends CoreWidgets {
  const AddAddressDetailsMob({super.key});

  @override
  CoreWidgetsState<AddAddressDetailsMob> createState() =>
      _AddAddressDetailsMobState();
}

class _AddAddressDetailsMobState
    extends CoreWidgetsState<AddAddressDetailsMob> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final hintStyle = TextStyle(
        fontFamily: "Poppins", fontSize: 12, color: AppColors().sixgrey);
    final labelTextStyle = TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: AppColors().sixgrey);
    Size size = MediaQuery.of(context).size;
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
              Divider(
                color: Colors.grey.shade300,
                thickness: 1.5,
                endIndent: 15,
                indent: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                height: size.height * 0.35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.grey),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                title: Text(
                  context
                      .read<AddAddressBloc>()
                      .userPickedAddress
                      .split(',')[0]
                      .toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis),
                ),
                subtitle: Text(
                  context.read<AddAddressBloc>().userPickedAddress.toString(),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13.sp,
                      color: const Color(0xff202020),
                      overflow: TextOverflow.fade),
                ),
                trailing: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      side: const BorderSide(color: Color(0xff034703)),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(24.r)))),
                  child: Text(
                    "Change",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "House No. & Floor ",
                      style: labelTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().addressLine1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Building & Block No.",
                      style: labelTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().addressLine2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Landmark & Area name(Optional)",
                      style: labelTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SelorgTextField(
                      controller: context.read<AddAddressBloc>().landmark,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Add Address label",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        addressLabel("Home"),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        addressLabel("Work"),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        addressLabel("Other"),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
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
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        AppDrawable().tick,
                                        height: 150.h,
                                        width: 150.w,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'Your address has been saved',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          text: "Add Address To Proceed",
                          size: 12.sp,
                        )),
                  ],
                )),
              )
            ],
          ));
    }, listener: (context, state) {
      if (state is SuccessState) {
        if (state.successResponse == "addressSaved") {
          showSnackBar(
              value: "Address saved successfully", type: SnackBarType.success);
          GoRouter.of(context).push(HomepageScreen.routeName);
        }
      }
    });
  }

  Widget addressLabel(String text) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {
            context
                .read<AddAddressBloc>()
                .add(SelectedAddressLabel(label: text));
          },
          style: OutlinedButton.styleFrom(
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
                  fontSize: 12.sp,
                  color: AppColors().sixgrey))),
    );
  }
}
