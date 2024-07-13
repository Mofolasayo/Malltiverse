import 'package:malltiverse/models/category_model.dart';
import 'package:malltiverse/models/current_price.dart';
import 'package:malltiverse/models/photo_model.dart';

class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.categories,
    required this.photos,
    required this.currentPrice,
  });

  final String? name;
  final String? id;
  final String? description;
  final List<Category> categories;
  final List<Photo> photos;
  final List<CurrentPrice> currentPrice;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"],
      id: json["id"],
      description: json["description"],
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      currentPrice: json["current_price"] == null
          ? []
          : List<CurrentPrice>.from(
              json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "description": description,
        "categories": categories.map((x) => x.toJson()).toList(),
        "photos": photos.map((x) => x.toJson()).toList(),
        "current_price": currentPrice.map((x) => x.toJson()).toList(),
      };
}
