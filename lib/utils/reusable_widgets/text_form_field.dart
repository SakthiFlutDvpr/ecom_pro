import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sel_org/resources/colors/app_colors.dart';

class SelorgTextField extends StatefulWidget {
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
  final String? Function(String?)? validate;
  final void Function(String?)? onSaved;

  const SelorgTextField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.size,
      this.hintStyle,
      this.controller,
      this.verticalPadding,
      this.horizontalPadding,
      this.fillColor,
      this.borderRadius,
      this.borderColor,
      this.borderWidth,
      this.prefixIcon,
      this.validate,
      this.onSaved});
  @override
  State<SelorgTextField> createState() => _SelorgTextFieldState();
}

class _SelorgTextFieldState extends State<SelorgTextField> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return TextFormField(
      validator: widget.validate,
      onSaved: widget.onSaved,
      style: TextStyle(
          fontFamily: "Poppins",
          fontSize: widget.size ?? 14,
          fontWeight: FontWeight.w600,
          color: AppColors().fourgrey),
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalPadding ?? 0,
            horizontal: widget.horizontalPadding ?? 4.w),
        prefixIcon: widget.prefixIcon,
        hintStyle: widget.hintStyle ??
            TextStyle(
                fontSize: widget.size ?? 14,
                fontWeight: FontWeight.w600,
                color: AppColors().sixgrey),
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
