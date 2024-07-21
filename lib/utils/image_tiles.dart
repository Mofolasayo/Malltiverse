import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/constants/svgIcons.dart';
import 'package:malltiverse/models/item_model.dart';
import 'package:malltiverse/providers/cart_provider.dart';
import 'package:malltiverse/providers/favorite_provider.dart';
import 'package:malltiverse/widgets/add_to_cart_button.dart';
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
    final cart = Provider.of<CartProvider>(context);
    final like = Provider.of<FavoriteProvider>(context);

    final quantity = cart.getItemQuantity(item);
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
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          imageUrl + item.photos[0].url!,
                          width: 185,
                          height: 185,
                          fit: BoxFit.scaleDown,
                        ),
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: IconButton(
                            onPressed: () {
                              if (like.isFavorite(item)) {
                                Provider.of<FavoriteProvider>(context,
                                        listen: false)
                                    .removeLike(item);
                              } else {
                                Provider.of<FavoriteProvider>(context,
                                        listen: false)
                                    .addLike(item);
                              }
                            },
                            icon: Icon(
                              color: primary,
                              like.isFavorite(item)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                            ),
                          ),
                        ),
                      ],
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
              "₦ $price",
              style: const TextStyle(color: Colors.red),
            ),
            cart.isItemInCart(item)
                ? Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.string(
                          svgicons.decrement,
                        ),
                        onPressed: () {
                          cart.decrementItemQuantity(item);
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: SvgPicture.string(svgicons.increment),
                        onPressed: () {
                          cart.incrementItemQuantity(item);
                        },
                      ),
                    ],
                  )
                : AddToCartButton(item: item)
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