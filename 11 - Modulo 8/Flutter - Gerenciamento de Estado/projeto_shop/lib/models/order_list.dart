import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:uuid/uuid.dart';

class OrderList with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  int get itemsCount => _orders.length;

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      Order(
        id: const Uuid().v4(),
        amount: cart.totalAmount,
        products: cart.items.values.toList(),
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
