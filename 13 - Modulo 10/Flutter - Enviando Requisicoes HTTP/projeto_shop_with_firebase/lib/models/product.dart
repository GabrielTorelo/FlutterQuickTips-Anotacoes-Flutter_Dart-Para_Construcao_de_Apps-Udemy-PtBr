import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'],
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, Object> toJsonWithoutData({
    required List<ProductFields> fieldsToIgnore,
  }) {
    final Map<String, Object> data = {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };

    for (ProductFields field in fieldsToIgnore) {
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

enum ProductFields {
  id('id'),
  title('title'),
  description('description'),
  price('price'),
  imageUrl('imageUrl'),
  isFavorite('isFavorite');

  final String value;
  const ProductFields(this.value);

  String call() => value.toString();
}

enum FilterOptions {
  favorites,
  all,
}

// enum SortOptions {
//   title,
//   price,
// }
