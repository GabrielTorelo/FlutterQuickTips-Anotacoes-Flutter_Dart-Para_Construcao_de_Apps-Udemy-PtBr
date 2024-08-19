import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';
import 'package:shop/services/firebase_service.dart';
import 'package:uuid/uuid.dart';

class OrderList with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService(
    requestType: FirebaseRequest.realtimeDB,
  );
  final String _token;
  final String _userId;
  List<Order> _orders = [];

  OrderList({
    String token = '',
    String userId = '',
    List<Order> orders = const [],
  })  : _token = token,
        _userId = userId {
    _firebase.token = _token;
    _orders.addAll(orders);
  }

  List<Order> get items => [..._orders];

  int get itemsCount => _orders.length;

  Future<void> loadOrders() async {
    final List<Order> loadedOrders = [];
    final Map<String, dynamic> response = await _firebase.methodGET(
      path: 'orders/$_userId',
    );

    if (response.containsKey('error')) return Future.error(response['error']);

    response.forEach((orderId, orderData) {
      orderData['id'] = orderId;
      loadedOrders.add(Order.fromJson(orderData));
    });

    _orders = loadedOrders.reversed.toList();

    notifyListeners();
  }

  Future<void> addOrder(Cart cart) async {
    final Order order = Order(
      id: const Uuid().v6(),
      amount: cart.totalAmount,
      products: cart.items.values.toList(),
      dateTime: DateTime.now(),
    );

    final Map<String, dynamic> response = await _firebase.methodPUT(
      path: 'orders',
      id: '$_userId/${order.id}',
      data: order.toJsonWithoutData(
        orderFieldsToIgnore: [
          OrderFields.id,
        ],
        cartItemFieldsToIgnore: [
          CartItemFields.id,
          CartItemFields.title,
          CartItemFields.productId,
        ],
      ),
    );

    if (response.containsKey('error')) return Future.error(response['error']);

    _orders.insert(0, order);
    notifyListeners();
  }
}
