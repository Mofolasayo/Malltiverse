import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/screens/successful.dart';
import 'package:malltiverse/utils/textform.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Constants.deviceHeight(context) * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/creditCard.png'),
                    const Text(
                      'Card Number',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    //TextFormField,
                    const Textform(label: '0000 0000 0000 0000'),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Expiry',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 180, child: Textform(label: 'Expury')),
                            Spacer(),
                            SizedBox(
                                width: 180, child: Textform(label: 'label')),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Successful()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: primary),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 10),
                    child: Text(
                      "Make Payment",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
