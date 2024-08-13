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
      products: (json['products'] as List<dynamic>)
          .map((product) => CartItem.fromJson(product))
          .toList(),
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, Object> toJsonWithoutData({
    required List<OrderFields> fieldsToIgnore,
  }) {
    final Map<String, Object> data = {
      'id': id,
      'amount': amount,
      'products': products.map((product) => product.toJson()).toList(),
      'dateTime': dateTime.toIso8601String(),
    };

    for (OrderFields field in fieldsToIgnore) {
      data.remove(field());
    }

    return data;
  }

  Map<String, Object> toJson() {
    return {
      ...toJsonWithoutData(fieldsToIgnore: []),
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
