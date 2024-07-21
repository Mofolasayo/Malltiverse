import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/data/order_item.dart';
import 'package:malltiverse/widgets/elevated_button.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});
  final OrderItem order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Constants.deviceHeight(context) * 0.35,
              width: Constants.deviceWidth(context) * 0.9,
              child: order.image.isNotEmpty
                  ? Image.network(
                      imageUrl + order.image,
                      width: 70,
                      height: 90,
                      fit: BoxFit.fitHeight,
                    )
                  : const Center(child: Text('No Image Available')),
            ),
            Text(
              order.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 150,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Text("Quantity: "),
                      const Spacer(),
                      Text("${order.quantity} pcs")
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Price: "),
                      const Spacer(),
                      Text("${order.price}")
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Total: "),
                      const Spacer(),
                      Text("₦ ${order.quantity * order.price}")
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Center(child: MyButton()),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
