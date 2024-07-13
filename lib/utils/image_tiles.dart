import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/models/item_model.dart';
import 'package:malltiverse/utils/cartItems.dart';
import 'package:provider/provider.dart';

class ImageTiles extends StatelessWidget {
  const ImageTiles({
    super.key,
    required this.item,
    required this.price,
  });

  final Item item;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      child: Container(
        height: 150,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.photos.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(237, 237, 237, 67),
                    ),
                    child: Image.network(
                      imageUrl + item.photos[0].url!,
                      width: 185,
                      height: 185,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : const Center(
                    child: Text("No Image Available"),
                  ),
            Text(
              item.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
            Text(
              item.description ?? "",
              style: const TextStyle(fontSize: 12),
            ),
            SvgPicture.string(svgicons.stars),
            Text(
              "N $price",
              style: const TextStyle(color: Colors.red),
            ),
            OutlinedButton(
              onPressed: () {
                Provider.of<CartItems>(context, listen: false).addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${item.name} added to cart'),
                  duration: const Duration(seconds: 1),
                ));
              },
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: primary,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14))),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Color.fromRGBO(42, 42, 42, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*ListTile(
              leading: item.photos.isNotEmpty
                  ? Image.network(
                      imageUrl + item.photos[0].url!,
                      width: 70,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No Image Available')),
              title: Text(item.name ?? ''),
              subtitle: Text("\$$price"),
              trailing: const Icon(Icons.arrow_forward),*/