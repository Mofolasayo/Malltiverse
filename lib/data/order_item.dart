import 'package:hive/hive.dart';

part 'order_item.g.dart';

@HiveType(typeId: 2)
class OrderItem {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final String image;
  OrderItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
