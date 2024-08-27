import 'package:flutter/material.dart';

class FreeDeliveryBottom extends StatelessWidget {
  const FreeDeliveryBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double height = MediaQuery.of(context).size.height;
      double bottomHeight = height * 0.40;
      if (height < 800) {
        bottomHeight = height * 0.60;
      }
      return Container(
        height: bottomHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 1,
                width: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Free Delivery",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 169, 248, 155),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: const Text(
                    "No Code Required",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF258B14)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Order worth \$159 and get free delivery",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF666666)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey.shade400,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/png/percent_icon.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Add items worth ₹54 to get free \ndelivery",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF666666)),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Terms & Conditions",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  color: const Color(0xFF666666),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Valid on order above ₹99",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF666666)),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  color: const Color(0xFF666666),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Other terms and condition may apply",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF666666)),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
