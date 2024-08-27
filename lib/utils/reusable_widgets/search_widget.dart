import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/ui_1/dashboard/product_search/search_screen.dart';

class SelorgSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final Icon? suffixIcon;
  final double? size;
  final double? verticalPadding;
  final double? horizontalPadding;
  final Color? fillColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Icon? prefixIcon;

  const SelorgSearchField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.size,
      this.hintStyle =
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
      this.controller,
      this.verticalPadding,
      this.horizontalPadding,
      this.fillColor,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.prefixIcon});
  @override
  State<SelorgSearchField> createState() => _SelorgSearchFieldState();
}

class _SelorgSearchFieldState extends State<SelorgSearchField> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return TextFormField(
      onTap: () {
        GoRouter.of(context).push(SearchScreen.routeName);
      },
      style: TextStyle(
          fontFamily: "Poppins",
          fontSize: widget.size ?? 14,
          fontWeight: FontWeight.w600,
          color: Colors.black),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding ?? 0,
            horizontal: widget.horizontalPadding ?? 4.w),
        prefixIcon: widget.prefixIcon,
        hintStyle: widget.hintStyle ??
            TextStyle(
                fontSize: widget.size,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
        hintText: widget.hintText,
        fillColor: widget.fillColor ?? Colors.grey.shade100,
        filled: true,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: widget.borderWidth ?? 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.grey,
              width: widget.borderWidth ?? 1,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r)),
      ),
    );
  }
}
