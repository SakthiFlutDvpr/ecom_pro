import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/address/address_bloc.dart';
import 'package:sel_org/ui_1/account/address/address_event.dart';
import 'package:sel_org/ui_1/user_location_address/add_address_binding/add_address_details/add_address_sreen.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';

class AddressScreenDesk extends CoreWidgets {
  const AddressScreenDesk({super.key});

  @override
  CoreWidgetsState<AddressScreenDesk> createState() =>
      _AddressScreenDeskState();
}

class _AddressScreenDeskState extends CoreWidgetsState<AddressScreenDesk> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AddressBloc, BaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InitialState) {
          context.read<AddressBloc>().add(AddressInitialContent(context));
        }
        return FlutterScaffold(
            isLoading: state is LoadingState,
            isScrollPhysics: false,
            toolBarTitleString: 'Address',
            greenBackground: false,
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            isAppBar: true,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState &&
                    (state.successResponse as List).isNotEmpty
                ? Container(
                    width: width,
                    height: height,
                    padding: EdgeInsets.symmetric(
                        vertical: 50.h, horizontal: width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: [
                                addressTile(),
                                const Divider(),
                                addressTile(),
                                const Divider(),
                                addressTile()
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: 60.h,
                            width: width * 0.40,
                            margin: EdgeInsets.only(bottom: 75.h),
                            child: SelorgElevatedButton(
                              onTap: () {},
                              text: "Add New Address",
                              size: 4.sp,
                            ))
                      ],
                    ),
                  )
                : Container(
                    width: width,
                    height: height,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              "assets/png/address_loc.png",
                              height: 250.h,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              "No Address Added",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                              height: 60.h,
                              width: width * 0.40,
                              margin: EdgeInsets.symmetric(vertical: 50.h),
                              child: SelorgElevatedButton(
                                onTap: () {},
                                text: "Add New Address",
                                size: 4.sp,
                              ))
                        ],
                      ),
                    ),
                  ));
      },
    );
  }

  Widget addressTile() {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 0.1.sw),
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(
        Icons.location_on_outlined,
        size: 9.sp,
      ),
      title: Text(
        "Other",
        style: TextStyle(
            fontFamily: "Poppins-SemiBold",
            fontSize: 5.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            overflow: TextOverflow.ellipsis),
      ),
      subtitle: Text(
        "13, 8/22,Gandhi Rd, Nehru Nagar, Chennai, Ta...",
        style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 4.sp,
            color: AppColors().sixgrey,
            overflow: TextOverflow.fade),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AddAddressScreen.routeName);
            },
            icon: SvgPicture.asset(
              "assets/svg/edit_icon.svg",
              height: 20.h,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/delete_icon.svg",
                height: 25.h,
              )),
        ],
      ),
    );
  }
}
