import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/utils/confetti.dart';

class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Payment Successful',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Confetti(),
          Column(
            children: [
              Center(
                child: SvgPicture.string(svgicons.Successful),
              ),
              const SizedBox(
                height: 10,
              ),
              const Confetti(),
              const Confetti(),
              const Text(
                "Payment Successful",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Confetti(),
              const Text("Thanks for your purchase"),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
