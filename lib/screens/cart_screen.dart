import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:malltiverse/widgets/cart_summary.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    //final TextEditingController controller = TextEditingController();
    final cart = Provider.of<CartProvider>(context);
    const int deliveryFee = 1500;
    const int discountAmont = 3500;
    return cart.items.isEmpty
        ? const Center(
            child: Text(
            'No item in Cart',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: Constants.deviceHeight(context) * 0.38),
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        final quantity = cart.getItemQuantity(item);
                        final totalPrice = cart.getTotalPrice(item);

                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 10.0,
                          ),
                          child: Card(
                            color: const Color.fromARGB(250, 255, 255, 255),
                            child: ListTile(
                              leading: item.photos.isNotEmpty
                                  ? Image.network(
                                      imageUrl + item.photos[0].url!,
                                      width: 60,
                                      height: 78,
                                      fit: BoxFit.fitHeight,
                                    )
                                  : const Icon(Icons.image_not_supported),
                              title: Row(
                                children: [
                                  Text(
                                    item.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon:
                                        SvgPicture.string(svgicons.deleteIcon),
                                    onPressed: () {
                                      cart.removeItem(item);
                                    },
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.description ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.string(
                                            svgicons.decrement),
                                        onPressed: () {
                                          cart.decrementItemQuantity(item);
                                        },
                                      ),
                                      Text('$quantity'),
                                      IconButton(
                                        icon: SvgPicture.string(
                                            svgicons.increment),
                                        onPressed: () {
                                          cart.incrementItemQuantity(item);
                                        },
                                      ),
                                      const Spacer(),
                                      Text('Total: ₦ $totalPrice',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),

                                    ],
                                  ),
                                  
                                ],
                              ),

                            ),
                          ),
                        );
                      },
                    ),
                  ),
                 
                 
                  CartSummary(
                    cart: cart,
                    deliveryFee: deliveryFee,
                    discountAmount: discountAmont,
                  ),
                ],
              ),
            ),
          );
  }
}

