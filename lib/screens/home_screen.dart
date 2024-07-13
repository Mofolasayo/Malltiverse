import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/models/product_model.dart';
import 'package:malltiverse/utils/category_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.futureProduct,
  });

  final Future<Product> futureProduct;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: Constants.deviceWidth(context) * 0.9,
                    height: 232,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/headphones.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Sound,\nPremium Savings',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      'Limited offer, hop on and get yours now',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Tech Gadgets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryItems(
              futureProduct: futureProduct,
              category: 'tech',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Men\'s Fashion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryItems(
              futureProduct: futureProduct,
              category: 'men',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Women\'s Fashion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryItems(
              futureProduct: futureProduct,
              category: 'women',
            )
          ],
        ),
      ),
    );
  }
}
