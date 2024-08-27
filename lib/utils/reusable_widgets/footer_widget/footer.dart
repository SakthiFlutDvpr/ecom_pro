import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';

class Footer extends CoreWidgets {
  const Footer({super.key});

  @override
  CoreWidgetsState<Footer> createState() => _FooterState();
}

class _FooterState extends CoreWidgetsState<Footer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 18.h, bottom: 0.h, right: 50.r, left: 50.r),
                    child: Row(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.h, bottom: 0.h, right: 50.r, left: 50.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Fruits & Vegetables",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Groceries",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Fresh Fruits",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Fresh Veggies",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Leafy Herbs & Seasonings",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Dry Fruits & Nuts",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        /////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Dal",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Millets",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Rice & Cereals",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Grains & Pulses",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Seeds",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Whole spices & Seasoning",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ///////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Oil",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Breads & Cereals",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Sugar & Jaggery",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Attas & Flours",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Masalas & Powders",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Ghee",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Honey & Spreads",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Salts",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Beverages",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Noodles & Vermicelli",
                                  style: TextStyle(
                                    color: const Color(0xff202020),
                                    fontSize: 4.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: AppColors().primaryDarkGreen,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 50.h, bottom: 50.h, right: 50.r, left: 50.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 40.w,
                            height: 125.h,
                            child: Image.asset(
                              AppDrawable().selorgLogo,
                              fit: BoxFit.contain,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 10.w,
                                  height: 30.h,
                                  child: Image.asset(
                                    "assets/png/insta.png",
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                  width: 10.w,
                                  height: 30.h,
                                  child: Image.asset(
                                    "assets/png/x.png",
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                  width: 10.w,
                                  height: 30.h,
                                  child: Image.asset(
                                    "assets/png/facebook.svg.png",
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                  width: 10.w,
                                  height: 30.h,
                                  child: Image.asset(
                                    "assets/png/linkedin.svg.png",
                                    fit: BoxFit.contain,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Careers",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Customer Support",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Terms of Use",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Delivery Areas",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "Download App",
                            style: TextStyle(
                                color: const Color(0xffF6F6F6),
                                fontWeight: FontWeight.w500,
                                fontSize: 4.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                              width: 40.w,
                              height: 50.h,
                              child: SvgPicture.asset(
                                AppDrawable().playstore,
                                fit: BoxFit.contain,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SizedBox(
                              width: 40.w,
                              height: 50.h,
                              child: SvgPicture.asset(
                                AppDrawable().appStore,
                                fit: BoxFit.contain,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
