import 'package:flutter/material.dart';
import 'package:malltiverse/models/item_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Item> _favorite = [];

  List<Item> get items => _favorite;

  bool isFavorite(Item item) => _favorite.contains(item);

  void addLike(Item item) {
    if (!_favorite.contains(item)) {
      _favorite.add(item);
      notifyListeners();
    }
  }

  void removeLike(Item item) {
    _favorite.remove(item);
    notifyListeners();
  }
}
