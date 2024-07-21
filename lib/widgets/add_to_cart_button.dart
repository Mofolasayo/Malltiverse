import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/models/item_model.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Provider.of<CartProvider>(context, listen: false).addItem(item);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color.fromRGBO(42, 42, 42, 1),
          content: Text('${item.name} added to cart'),
          duration: const Duration(seconds: 1),
        ));
      },
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: primary,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
      child: const Text(
        'Add to Cart',
        style: TextStyle(color: Color.fromRGBO(42, 42, 42, 1)),
      ),
    );
  }
}
