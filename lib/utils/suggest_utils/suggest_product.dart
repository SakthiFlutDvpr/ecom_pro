import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/utils/reusable_widgets/selorg_elevated_button.dart';
import 'package:sel_org/utils/suggest_utils/thankyou_suggest.dart';

class SuggestproductSmallScreen extends StatelessWidget {
  const SuggestproductSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height < 750 ? height * 0.45 : height * 0.37,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Suggest Products",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors().twoblack)),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                    "Didn’t you find what you are looking for? Please suggest the products",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors().twoblack)),
                SizedBox(
                  height: 15.h,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.symmetric(vertical: 75.h),
                    filled: true,
                    fillColor: const Color(0xffEFF1E7),
                    hintText: "Write Something here...",
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10).r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10).r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10).r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: SelorgElevatedButton(
                            onTap: () {
                              context.pop();
                              showModalBottomSheet(
                                  isScrollControlled: false,
                                  context: context,
                                  builder: (context) {
                                    return const ThankyouSuggestionSmallScreen();
                                  });
                            },
                            text: "Send",
                            size: 12.sp,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SuggestProductLargeScreen extends StatelessWidget {
  const SuggestProductLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width >= 650 && width <= 1100 ? width * 0.40 : width * 0.30,
          margin: width >= 650 && width <= 1100
              ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h)
              : EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Suggest Products",
                  style: TextStyle(
                      fontFamily: "Poppins-SemiBold",
                      fontSize: width >= 650 && width <= 1100 ? 9.sp : 5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors().twoblack)),
              SizedBox(
                height: 15.h,
              ),
              Text(
                  "Didn’t you find what you are looking for? Please suggest the products",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width >= 650 && width <= 1100 ? 7.sp : 3.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff555555))),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(
                    fontSize: width >= 650 && width <= 1100 ? 7.sp : 6.sp),
                maxLines: 3,
                decoration: InputDecoration(
                  // contentPadding: width >= 650 && width <= 1100
                  //     ? EdgeInsets.symmetric(vertical: 40.h, horizontal: 8.w)
                  //     : EdgeInsets.symmetric(vertical: 80.h, horizontal: 4.w),
                  filled: true,
                  fillColor: const Color(0xffEFF1E7),
                  hintText: "Write Something here...",
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.all(const Radius.circular(10).r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.all(const Radius.circular(10).r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                    borderRadius: BorderRadius.all(const Radius.circular(10).r),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  height: width >= 650 && width <= 1100 ? 35.h : 55.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: SelorgElevatedButton(
                          onTap: () {
                            context.pop();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    child: ThankyouSuggestionLargeScreen(),
                                  );
                                });
                          },
                          text: "Send",
                          size: width >= 650 && width <= 1100 ? 7.sp : 4.sp,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
