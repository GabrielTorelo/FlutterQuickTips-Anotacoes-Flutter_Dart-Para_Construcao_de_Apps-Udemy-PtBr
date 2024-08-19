import 'package:shop/models/cart_item.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      amount: json['amount'],
      products: (json['products'] as Map<String, dynamic>)
          .entries
          .map(
            (product) => CartItem.fromJson({
              'id': product.key,
              ...product.value,
            }),
          )
          .toList(),
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, Object> toJsonWithoutData({
    required List<OrderFields> orderFieldsToIgnore,
    required List<CartItemFields> cartItemFieldsToIgnore,
  }) {
    final Map<String, Object> data = {
      'id': id,
      'amount': amount,
      'products': {
        for (var product in products)
          product.id: product.toJsonWithoutData(
            fieldsToIgnore: cartItemFieldsToIgnore,
          ),
      },
      'dateTime': dateTime.toIso8601String(),
    };

    for (OrderFields field in orderFieldsToIgnore) {
      data.remove(field());
    }

    return data;
  }

  Map<String, Object> toJson() {
    return {
      ...toJsonWithoutData(
        orderFieldsToIgnore: [],
        cartItemFieldsToIgnore: [],
      ),
    };
  }
}

enum OrderFields {
  id('id'),
  amount('amount'),
  products('products'),
  dateTime('dateTime');

  final String value;
  const OrderFields(this.value);

  String call() => value.toString();
}
