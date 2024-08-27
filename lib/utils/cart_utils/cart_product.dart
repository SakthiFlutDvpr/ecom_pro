import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/png/banana.png",
            height: 65.h,
            fit: BoxFit.contain,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Organic Apple",
                  style: TextStyle(
                      color: const Color(0xff444444),
                      fontSize: 15.sp,
                      overflow: TextOverflow.fade,
                      fontWeight: FontWeight.bold)),
              Text("1 kg",
                  style: TextStyle(
                    color: const Color(0xff666666),
                    fontSize: 13.sp,
                  )),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff034703),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xff034703),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.remove, color: Colors.white, size: 20.sp),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "1", // Use the respective quantity
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("₹37",
                  style: TextStyle(
                      color: const Color(0xff444444),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold)),
              Text("₹37",
                  style: TextStyle(
                      color: const Color(0xffED476B),
                      fontSize: 13.sp,
                      decoration: TextDecoration.lineThrough)),
            ],
          ),
        ],
      ),
    );
  }
}
