import 'package:hive_flutter/hive_flutter.dart';
import 'package:malltiverse/data/order_item.dart';

class OrderService {
  static late Box _box;
  static void addOrder(OrderItem order) {
    _box.add(order);
  }

  static Future<void> openBox() async {
    _box = await Hive.openBox<OrderItem>('orderHistory');
  }

  static List<OrderItem> getOrderHistory() {
    return _box.values.cast<OrderItem>().toList();
  }

  static void clearOrderHistory() {
    _box.clear();
  }
}
