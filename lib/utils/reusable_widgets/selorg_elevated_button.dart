import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/resources/colors/app_colors.dart';

class SelorgElevatedButton extends StatelessWidget {
  const SelorgElevatedButton({
    super.key,
    required this.onTap,
    this.isDisable,
    required this.text,
    this.style,
    this.bgColor,
    this.color,
    required this.size,
    this.borderRadius,
  });
  final Function onTap;
  final bool? isDisable;
  final String text;
  final TextStyle? style;
  final Color? bgColor;
  final Color? color;
  final double size;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: isDisable == true
          ? null
          : () {
              onTap();
            },
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
          if (state.contains(WidgetState.disabled)) {
            return const Color(0xffC0C3C5);
          }
          return bgColor ?? AppColors().primaryDarkGreen;
        }),
        shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
            (Set<WidgetState> state) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            borderRadius ?? 50.r,
          ));
        }),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style ??
            TextStyle(
                fontFamily: "Poppins",
                fontSize: size,
                fontWeight: FontWeight.w600,
                color: color ?? Colors.white),
      ),
    );
  }
}
