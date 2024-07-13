import 'package:malltiverse/models/item_model.dart';

class Product {
  Product({
    required this.items,
  });

  final List<Item> items;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
      };
}
