import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:shop/services/firebase_service.dart';
import 'package:uuid/uuid.dart';

class OrderList with ChangeNotifier {
  final FirebaseService _firebase = const FirebaseService();
  final List<Order> _orders = [];

  List<Order> get items => [..._orders];

  int get itemsCount => _orders.length;

  Future<void> loadOrders() async {
    final Map<String, dynamic> response =
        await _firebase.methodGET(path: 'orders');

    if (response.containsKey('error')) return Future.error(response['error']);

    _orders.clear();

    response.forEach((orderId, orderData) {
      orderData['id'] = orderId;
      orderData['isFavorite'] = orderData['isFavorite'] ?? false;
      _orders.add(Order.fromJson(orderData));
    });

    notifyListeners();
  }

  Future<void> addOrder(Cart cart) async {
    final Order order = Order(
      id: const Uuid().v4(),
      amount: cart.totalAmount,
      products: cart.items.values.toList(),
      dateTime: DateTime.now(),
    );

    final Map<String, dynamic> response = await _firebase.methodPUT(
      path: 'orders',
      id: order.id,
      data: order.toJsonWithoutData(
        fieldsToIgnore: [
          OrderFields.id,
        ],
      ),
    );

    if (response.containsKey('error')) return Future.error(response['error']);

    _orders.insert(0, order);
    notifyListeners();
  }
}
