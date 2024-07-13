import 'package:flutter/material.dart';
import 'package:malltiverse/models/item_model.dart';

class CartItems extends ChangeNotifier {
  final Map<Item, int> _items = {};

  List<Item> get items => _items.keys.toList();

  int getItemQuantity(Item item) => _items[item] ?? 0;

  void addItem(Item item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    } else {
      _items[item] = 1;
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void incrementItemQuantity(Item item) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + 1;
    }
    notifyListeners();
  }

  void decrementItemQuantity(Item item) {
    if (_items.containsKey(item) && _items[item]! > 1) {
      _items[item] = _items[item]! - 1;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double getTotalPrice(Item item) {
    if (item.currentPrice.isNotEmpty && item.currentPrice[0].ngn.isNotEmpty) {
      double price = item.currentPrice[0].ngn[0];
      return price * (_items[item] ?? 0);
    }
    return 0.0;
  }
}

// class CartItems extends ChangeNotifier {
//   final List<Item> _items = [];

//   List<Item> get items => _items;

//   void addItem(Item item) {
//     _items.add(item);
//     notifyListeners();
//   }

//   void removeItem(Item item) {
//     _items.remove(item);
//     notifyListeners();
//   }

//   void clearCart() {
//     _items.clear();
//     notifyListeners();
//   }
// }
