import 'package:flutter/material.dart';

class OrderProgressCard extends StatelessWidget {
  const OrderProgressCard(
      {super.key,
      required this.orderId,
      required this.dateTime,
      required this.isCancelled});
  final String orderId;
  final String dateTime;
  final bool isCancelled;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderId,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              dateTime,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isCancelled
                  ? const Color(0xFF7B8681)
                  : const Color(0xFF00A85A),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: Text(
            isCancelled ? "Cancelled" : "Delivery",
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
