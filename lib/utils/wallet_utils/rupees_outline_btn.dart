import 'package:flutter/material.dart';

class RupeesOutlinedButton extends StatelessWidget {
  const RupeesOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //  padding:const EdgeInsets.symmetric(horizontal: 16),
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(
          "₹2500",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
