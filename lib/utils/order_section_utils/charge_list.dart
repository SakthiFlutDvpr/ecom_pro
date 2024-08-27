import 'package:flutter/material.dart';

class ChargeListMobile extends StatelessWidget {
  const ChargeListMobile(
      {super.key, required this.title, required this.mrp, required this.price});

  final String title;
  final String mrp;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium!),
        Row(
          children: [
            Text(mrp,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(decoration: TextDecoration.lineThrough)),
            const SizedBox(
              width: 5,
            ),
            Text(price, style: Theme.of(context).textTheme.headlineMedium!),
          ],
        )
      ],
    );
  }
}

// charge list for desktop ....................................................................

class ChargeListDeskTop extends StatelessWidget {
  const ChargeListDeskTop(
      {super.key, required this.title, required this.mrp, required this.price});

  final String title;
  final String mrp;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          children: [
            Text(
              mrp,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              price,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        )
      ],
    );
  }
}
