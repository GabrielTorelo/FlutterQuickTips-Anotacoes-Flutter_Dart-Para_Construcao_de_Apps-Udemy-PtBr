class CartItem {
  final String id;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, Object> toJsonWithoutData({
    required List<CartItemFields> fieldsToIgnore,
  }) {
    final Map<String, Object> data = {
      'id': id,
      'price': price,
      'quantity': quantity,
    };

    for (CartItemFields field in fieldsToIgnore) {
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

enum CartItemFields {
  id('id'),
  productId('productId'),
  title('title'),
  price('price'),
  quantity('quantity');

  final String value;
  const CartItemFields(this.value);

  String call() => value.toString();
}
