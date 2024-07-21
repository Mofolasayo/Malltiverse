import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/pages/home_page.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:malltiverse/widgets/separator.dart';

class CartSummary extends StatefulWidget {
  const CartSummary({
    super.key,
    required this.cart,
    required this.deliveryFee,
    required this.discountAmount,
  });

  final CartProvider cart;
  final int deliveryFee;
  final int discountAmount;

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  @override
  Widget build(BuildContext context) {
    bool discountApplied = false;
    final TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromRGBO(245, 245, 245, 0.67),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: Constants.deviceHeight(context) * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Shopping Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Discount Code',
                  style: TextStyle(fontSize: 14),
                ),
                Form(
                  key: formKey,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            labelText: 'Discount',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid discount code';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Discount Applied')),
                            );
                            setState(() {
                              discountApplied != discountApplied;
                            });

                            // Proceed if the form is valid
                          } else {
                            // Show an error if the form is not valid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fill out the required fields')),
                            );
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Apply"),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text("Sub-Total"),
                    const Spacer(),
                    Text('₦ ${widget.cart.getFinalPrice().toInt()}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Delivery Fee"),
                    const Spacer(),
                    Text("₦ ${widget.deliveryFee}")
                  ],
                ),
                Row(
                  children: [
                    const Text("Discount Amount"),
                    const Spacer(),
                    Text("₦ ${widget.discountAmount}")
                  ],
                ),
                const MySeparator(),
                Row(
                  children: [
                    const Text("Total Amount"),
                    const Spacer(),
                    Text(
                        "₦ ${widget.cart.getFinalPrice().toInt() + widget.deliveryFee + widget.discountAmount}")
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      HomePage.navigateToTab(context, 3);
                      // Navigate to the Checkout tab
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.0),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
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
