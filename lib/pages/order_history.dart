import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/data/order_item.dart';
import 'package:malltiverse/data/order_service.dart';
import 'package:malltiverse/screens/order_details.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Order History'),
        ),
        body: ValueListenableBuilder(
            valueListenable: Hive.box<OrderItem>('orderHistory').listenable(),
            builder: (context, Box box, _) {
              if (box.values.isEmpty) {
                return const Center(
                    child: Text(
                  'No orders yet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: box.values.length,
                        itemBuilder: (context, index) {
                          final order = box.getAt(index) as OrderItem;
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, left: 10, right: 10),
                            child: Card(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetails(order: order)));
                                },
                                child: ListTile(
                                  leading: order.image.isNotEmpty
                                      ? Image.network(
                                          imageUrl + order.image,
                                          width: 70,
                                          height: 90,
                                          fit: BoxFit.fitHeight,
                                        )
                                      : const Center(
                                          child: Text('No Image Available')),
                                  title: Text(order.name),
                                  subtitle: Text(
                                      'N ${order.price} x ${order.quantity}'),
                                  //Text('Price: ${order.price} x ${order.quantity}'),
                                  trailing: Text(
                                    'Total: ${order.price * order.quantity}',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        OrderService.clearOrderHistory();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: primary),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15),
                        child: Text(
                          "Clear Order History",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }));
  }
}
