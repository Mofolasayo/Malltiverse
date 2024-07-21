import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/screens/payment_screen.dart';
import 'package:malltiverse/widgets/radio_button.dart';
import 'package:malltiverse/widgets/textform.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: Constants.deviceHeight(context) * 0.55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select how to receive your package(s)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Pick up",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const RadioButton(),
                      const Text(
                        'Delivery',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Textform(
                        label: 'Delivery',
                        type: TextInputType.name,
                        controller: controller,
                        formKey: formKey,
                      ),
                      const Text(
                        "Contact",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Textform(
                        label: 'Phone no 1',
                        type: TextInputType.number,
                        controller: controller1,
                        formKey: formKey,
                      ),
                      Textform(
                        label: 'Phone no 2',
                        type: TextInputType.number,
                        controller: controller2,
                        formKey: formKey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please fill out the required fields')),
                      );
                    }
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
                    child: Text(
                      "Go to Payment",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
