import 'package:flutter/material.dart';

import '../../../../resources/drawable/app_drawable.dart';

class DeliveryPoster extends StatelessWidget {
  const DeliveryPoster({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color:
          Theme.of(context).buttonTheme.colorScheme!.primary.withOpacity(0.3),
      width: size.width,
      height: size.height * 0.05,
      child: Flex(
          mainAxisAlignment: size.width >= 1366
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          direction: Axis.horizontal,
          children: [
            Image.asset(
              AppDrawable().deliveryMan,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width >= 1366 ? 10.0 : 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Delivery in',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: const Color(0xff9F581F), fontSize: 12),
                    children: [
                      TextSpan(
                          text: "\nOnly in 10 minutes",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: const Color(0xff9F581F),
                                  fontSize: 12)),
                    ]),
              ),
            ),
            Image.asset(
              AppDrawable().handDelivery,
            ),
          ]),
    );
  }
}
