import 'package:flutter/material.dart';
import 'package:shop/services/firebase_service.dart';

class Product with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService(
    requestType: FirebaseRequest.realtimeDB,
  );
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

  void _toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus({
    required String token,
    required String userId,
  }) async {
    _firebase.token = token;
    _toggleFavoriteStatus();

    if (isFavorite) {
      final Map<String, dynamic> response = await _firebase.methodPUT(
        path: 'userFavorites',
        id: '$userId/$id',
        data: toJsonWithoutData(
          fieldsToIgnore: [
            ProductFields.id,
            ProductFields.title,
            ProductFields.description,
            ProductFields.price,
            ProductFields.imageUrl,
          ],
        ),
      );

      if (response.containsKey('error')) _toggleFavoriteStatus();
    } else {
      final Map<String, dynamic> response = await _firebase.methodDELETE(
        path: 'userFavorites',
        id: '$userId/$id',
      );

      if (response.containsKey('error')) _toggleFavoriteStatus();
    }
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
