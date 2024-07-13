import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/screens/payment_screen.dart';
import 'package:malltiverse/utils/radio_button.dart';
import 'package:malltiverse/utils/textform.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Constants.deviceHeight(context) * 0.55,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select how to receive your package(s)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Pick up",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  RadioButton(),
                  Text('Delivery'),

                  Textform(label: 'Delivery'),
                  Text("Contact"),
                  //textformfield number
                  Textform(label: 'Phone no 1'),

                  Textform(label: 'Phone no 2'),
                ],
              ),
            ),

            //textformfield number
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PaymentScreen()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10),
                child: Text(
                  "Go to Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
