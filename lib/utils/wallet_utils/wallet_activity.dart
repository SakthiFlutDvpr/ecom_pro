import 'package:flutter/material.dart';
import 'package:sel_org/resources/colors/app_colors.dart';

class WalletActivity extends StatelessWidget {
  const WalletActivity(
      {super.key,
      required this.pngUrl,
      required this.title,
      required this.startDate,
      required this.price,
      this.enddate});

  final String pngUrl;
  final String title;
  final String startDate;
  final String price;
  final String? enddate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      titleAlignment: ListTileTitleAlignment.center,
      leading: SizedBox(width: 25, height: 25, child: Image.asset(pngUrl)),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          startDate,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors().primaryDarkGreen,
              )),
          Text(
            enddate.toString(),
            style: TextStyle(
              fontSize: 12,
              color: AppColors().logoutButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
