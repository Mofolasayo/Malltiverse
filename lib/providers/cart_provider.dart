import 'package:flutter/material.dart';
import 'package:malltiverse/models/item_model.dart';

class CartProvider extends ChangeNotifier {
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

  bool isItemInCart(Item item) {
    return _items.containsKey(item);
  }

  double getFinalPrice() {
    double finalPrice = 0;
    _items.forEach((item, quantity) {
      if (item.currentPrice.isNotEmpty && item.currentPrice[0].ngn.isNotEmpty) {
        double price = item.currentPrice[0].ngn[0];
        finalPrice += price * quantity;
      }
    });
    /*double price = 0;
    double totalPrice = 0;
    if (item.currentPrice.isNotEmpty && item.currentPrice[0].ngn.isNotEmpty) {
      price = item.currentPrice[0].ngn[0];
      totalPrice = price * (_items[item] ?? 0);
      finalPrice += totalPrice;
    }*/
    return finalPrice;
  }
}
