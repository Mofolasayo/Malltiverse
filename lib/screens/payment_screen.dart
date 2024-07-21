import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/data/order_item.dart';
import 'package:malltiverse/data/order_service.dart';
import 'package:malltiverse/models/item_model.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:malltiverse/screens/successful.dart';
import 'package:malltiverse/widgets/textform.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expiryController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final cart = Provider.of<CartProvider>(context);
    final List<Item> items = cart.items;

    bool isCardNumberValid(String value) {
      return value.isNotEmpty && value.length >= 5;
    }

    bool isExpiryValid(String value) {
      return value.isNotEmpty && value.length >= 2; // Assuming MM/YY format
    }

    bool isCvvValid(String value) {
      return value.isNotEmpty && value.length == 3;
    }

    return Scaffold(
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
                    Textform(
                      formKey: formKey,
                      controller: cardNumberController,
                      label: '0000 0000 0000 0000',
                      type: TextInputType.number,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Expiry',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: Constants.deviceWidth(context) * 0.37,
                            ),
                            const Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Constants.deviceWidth(context) * 0.4,
                              child: Textform(
                                formKey: formKey,
                                controller: expiryController,
                                label: 'MM/YY',
                                type: TextInputType.number,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: Constants.deviceWidth(context) * 0.4,
                              child: Textform(
                                formKey: formKey,
                                controller: cvvController,
                                label: '123',
                                type: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
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
                  // Manual validation
                  final cardNumber = cardNumberController.text;
                  final expiry = expiryController.text;
                  final cvv = cvvController.text;

                  if (!isCardNumberValid(cardNumber)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Invalid card number: card number less than 5 digits')),
                    );
                    return;
                  }

                  if (!isExpiryValid(expiry)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid expiry date')),
                    );
                    return;
                  }

                  if (!isCvvValid(cvv)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid CVV')),
                    );
                    return;
                  }

                  for (var item in items) {
                    final int quantity = cart.getItemQuantity(item);
                    final order = OrderItem(
                      id: item.id!,
                      name: item.name!,
                      description: item.description!,
                      price: item.currentPrice[0].ngn[0],
                      quantity: quantity,
                      image: item.photos.isNotEmpty ? item.photos[0].url! : '',
                    );
                    OrderService.addOrder(order);
                  }

                  cart.clearCart();

                 
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Successful(),
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                  child: Text(
                    "Make Payment",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
