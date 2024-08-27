import 'package:flutter/material.dart';

class HowItWorksBottom extends StatelessWidget {
  const HowItWorksBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "How it works",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            contentStep(
                no: "1",
                text:
                    "Selorg  cash is a wallet service offered by the company to its customers, which can be used for purchase of products untills expiry.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "2",
                text:
                    "Selorg  cash invalid for 12 months from the date of issue unless specified a validity period. Selorg cash is not refundable.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "3",
                text:
                    "Selorg  cash can be usedin such cities where issuing company is operating and shall be subject to platform terms of use and application laws.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "4",
                text:
                    "You canpurchase Selorg Cash using any available payment methods. You can also redeem vouchers to add Selorg Cash into your wallet.",
                context: context),
            const SizedBox(
              height: 15,
            ),
            contentStep(
                no: "5",
                text:
                    "For any further question/queries,the customer may reach out to marveldesigner90@gmail.com",
                context: context),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget contentStep(
      {required String no,
      required String text,
      required BuildContext context}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xFF219621), shape: BoxShape.circle),
            child: Text(
              no,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                overflow: TextOverflow.visible, color: Colors.black),
          ))
        ],
      ),
    );
  }
}
