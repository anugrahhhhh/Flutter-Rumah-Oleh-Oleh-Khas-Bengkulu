import 'food.dart';

class OrderItem {
  final Food food;
  int quantity;

  OrderItem({required this.food, this.quantity = 1});

  double get totalPrice => food.price * quantity;
}

class Order {
  final String id;
  final List<OrderItem> items;
  final DateTime orderTime;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.orderTime,
    this.status = 'Pending',
  });

  double get totalOrderPrice {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  static List<Order> sampleOrders = [];
}
