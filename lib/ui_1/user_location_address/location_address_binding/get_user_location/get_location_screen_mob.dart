import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/dashboard/homepage/homepage_screen.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_bloc.dart';
import 'package:sel_org/ui_1/user_location_address/location_address_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class GetUserLocationDetailsMob extends CoreWidgets {
  const GetUserLocationDetailsMob({super.key});

  @override
  CoreWidgetsState<GetUserLocationDetailsMob> createState() =>
      _GetUserLocationDetailsMobState();
}

class _GetUserLocationDetailsMobState
    extends CoreWidgetsState<GetUserLocationDetailsMob> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //  double height = MediaQuery.of(context).size.height;
    return BlocConsumer<GetLocationBloc, BaseState>(
      listener: (context, state) {
        if (state is FailureState) {
          if (state.errorMessage == "FailureState") {
            showSnackBar(
                value: "Please enable location services",
                type: SnackBarType.info);
          }
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          context
              .read<GetLocationBloc>()
              .add(GetUserLocation(context: context));
        }
        return FlutterScaffold(
            isAppBar: true,
            greenBackground: false,
            backgroundVectorCurve: false,
            toolBarTitleString: "Your Location",
            toolBarIconEnum: IconEnum.back,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                          hintText: "Search for address",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                            ),
                            child: Icon(
                              Icons.search_sharp,
                              color: AppColors().sixgrey,
                              size: 18.sp,
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors().sixgrey),
                          filled: true,
                          fillColor: Colors.white,
                          // Un-commented and used white to show the fill effect
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors().sixgrey),
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(50).r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors().sixgrey),
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(50).r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors().sixgrey),
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(50).r))),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return getLocation(context);
                          });
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.my_location,
                        size: width <= 650 ? 18.sp : 6.sp,
                        color: const Color(0xff00A400),
                      ),
                      title: Text("Current Location",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff00A400),
                              fontWeight: FontWeight.bold)),
                      subtitle: Text("Using GPS",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xff00A400),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget getLocation(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppDrawable().locationpin,
            height: 125.h,
            width: 90.w,
          ),
          SizedBox(height: 20.h),
          Text(
            'Please Enable Location permission',
            maxLines: 1,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20.h),
          Text(
            'for better delivery experience',
            style: TextStyle(
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(HomepageScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50).r),
              backgroundColor: AppColors().primaryDarkGreen,
              // padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
            ),
            child: Text(
              'Continue',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              // Handle the "Search your location" button press
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors()
                      .primaryDarkGreen, // Replace with your AppColors primaryDarkGreen
                ),
                borderRadius: BorderRadius.circular(50).r,
              ),
              backgroundColor: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.search, size: 18.sp),
                SizedBox(width: 4.w),
                Text(
                  'Search your location',
                  style: TextStyle(
                      color: AppColors().primaryDarkGreen,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
