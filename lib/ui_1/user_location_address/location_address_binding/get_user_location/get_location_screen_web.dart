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

class GetUserLocationDetailsDesk extends CoreWidgets {
  const GetUserLocationDetailsDesk({super.key});

  @override
  CoreWidgetsState<GetUserLocationDetailsDesk> createState() =>
      _GetUserLocationDetailsDeskState();
}

class _GetUserLocationDetailsDeskState
    extends CoreWidgetsState<GetUserLocationDetailsDesk> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
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
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: width * 0.05,
              ),
              child: Column(
                children: [
                  TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 25.h),
                        hintText: "Search for address",
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                          ),
                          child: Icon(
                            Icons.search_sharp,
                            color: AppColors().sixgrey,
                            size: 8.sp,
                          ),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 5.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors().sixgrey),
                        filled: true,
                        fillColor: Colors.white,
                        // Un-commented and used white to show the fill effect
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors().sixgrey),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(50).r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors().sixgrey),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(50).r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors().sixgrey),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(50).r))),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.zero,
                              child: getLocation(context),
                            );
                          });
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.my_location,
                        size: width <= 650 ? 18.sp : 8.sp,
                        color: const Color(0xff00A400),
                      ),
                      title: Text("Current Location",
                          style: TextStyle(
                              fontSize: 6.sp,
                              color: const Color(0xff00A400),
                              fontWeight: FontWeight.bold)),
                      subtitle: Text("Using GPS",
                          style: TextStyle(
                              fontSize: 4.sp,
                              color: const Color(0xff00A400),
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  flexibleContainer(),
                ],
              ),
            ));
      },
    );
  }

  Widget getLocation(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.10, vertical: 50.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppDrawable().locationpin,
            height: 200.h,
            width: 50.w,
          ),
          SizedBox(height: 20.h),
          Text(
            'Please Enable Location permission',
            maxLines: 1,
            style: TextStyle(
              fontSize: 7.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20.h),
          Text(
            'for better delivery experience',
            style: TextStyle(
              fontSize: 5.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
                width: MediaQuery.of(context).size.width * 0.35,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .pushReplacement(HomepageScreen.routeName);
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
                        fontSize: 5.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
                width: MediaQuery.of(context).size.width * 0.35,
                child: ElevatedButton(
                  onPressed: () {},
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
                      Icon(Icons.search, size: 8.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Search your location',
                        style: TextStyle(
                            color: AppColors().primaryDarkGreen,
                            fontSize: 5.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget flexibleContainer() {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.teal,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(0)),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double sideRadius = 15.0;
    double midPoint = 50;
    double cornerRadius = 10.0;

    path.moveTo(0, 0);
    path.lineTo(0, (midPoint - sideRadius));

    // //LEFT ARC
    path.quadraticBezierTo(15, 35, sideRadius, midPoint);
    path.quadraticBezierTo(sideRadius, 65, 0, midPoint + sideRadius);

    path.lineTo(0, size.height - cornerRadius);

    //BottomLeft
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);

    path.lineTo(size.width - cornerRadius, size.height);
    //BottomRight
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - cornerRadius);

    path.lineTo(size.width, (midPoint + sideRadius));

    //RIGHT ARC
    path.quadraticBezierTo((size.width - sideRadius), (midPoint + sideRadius),
        (size.width - sideRadius), (midPoint));
    path.quadraticBezierTo((size.width - sideRadius), (midPoint - sideRadius),
        size.width, midPoint - sideRadius);

    path.lineTo(size.width, cornerRadius);
    //TopRight
    path.quadraticBezierTo(size.width, 0, size.width - cornerRadius, 0);

    path.lineTo(cornerRadius, 0);

    //TopLeft
    path.quadraticBezierTo(0, 0, 0, cornerRadius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
