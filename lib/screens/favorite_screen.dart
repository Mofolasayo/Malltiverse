import 'package:flutter/material.dart';
import 'package:malltiverse/constants/constants.dart';
import 'package:malltiverse/providers/favorite_provider.dart';
import 'package:malltiverse/widgets/add_to_cart_button.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final likes = context.watch<FavoriteProvider>().items;
    return likes.isNotEmpty
        ? ListView.builder(
            itemCount: likes.length,
            itemBuilder: (context, index) {
              final item = likes[index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                      leading: item.photos.isNotEmpty
                          ? Image.network(
                              imageUrl + item.photos[0].url!,
                              width: 70,
                              height: 90,
                              fit: BoxFit.fitHeight,
                            )
                          : const Center(child: Text('No Image Available')),
                      title: Text(item.name ?? ""),
                      subtitle: Text(item.description ?? ""),
                      trailing: AddToCartButton(item: item)),
                ),
              );
            })
        : const Center(
            child: Text(
              'No Favorites yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          );
  }
}
