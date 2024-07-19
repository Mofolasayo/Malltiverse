import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/screens/checkout_screen.dart';
import 'package:malltiverse/utils/cartItems.dart';
import 'package:malltiverse/utils/separator.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final cart = Provider.of<CartItems>(context);

    return cart.items.isEmpty
        ? const Center(child: Text('No item in Cart'))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: Constants.deviceHeight(context) * 0.35),
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
                                      Text('Total: N $totalPrice',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(237, 237, 237, 1),
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
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'Discount Code',
                                style: TextStyle(fontSize: 14),
                              ),
                              Row(
                                children: [
                                  // TextFormField(),
                                  Flexible(
                                    child: Form(
                                      child: TextFormField(
                                        controller: controller,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(8),
                                          labelText: 'Discount',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primary),
                                    child: const Text("Apply"),
                                  )
                                ],
                              ),
                              const Row(
                                children: [
                                  Text("Sub-Total"),
                                  Spacer(),
                                  Text("N 58,500")
                                ],
                              ),
                              const Row(
                                children: [
                                  Text("Delivery Fee"),
                                  Spacer(),
                                  Text("N 1,500")
                                ],
                              ),
                              const Row(
                                children: [
                                  Text("Discount Amount"),
                                  Spacer(),
                                  Text("N 3,500")
                                ],
                              ),
                              const MySeparator(),
                              const Row(
                                children: [
                                  Text("Total Amount"),
                                  Spacer(),
                                  Text("N 62,500")
                                ],
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CheckoutScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primary),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 17.0),
                                    child: Text(
                                      "Checkout",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
