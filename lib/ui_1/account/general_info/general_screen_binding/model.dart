import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TappableContainer extends StatelessWidget {
  final String svgIcon;
  final String text;
  final VoidCallback onTap;
  const TappableContainer({
    super.key,
    required this.svgIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 16.0),
            Text(text,
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
