import 'package:flutter/material.dart';

class ReOrderButtonMobile extends StatelessWidget {
  const ReOrderButtonMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red.shade100, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
          child: Container(
            width: 125,
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFFE54444),
                ),
                SizedBox(
                  width: 08.0,
                ),
                Text(
                  "Reorder",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE54444),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

// reorder button for desktop ....................................................

class ReOrderButtonDeskTop extends StatelessWidget {
  const ReOrderButtonDeskTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red.shade100, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: Container(
            width: 150,
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFFE54444),
                ),
                Text(
                  "Reorder",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFE54444),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
