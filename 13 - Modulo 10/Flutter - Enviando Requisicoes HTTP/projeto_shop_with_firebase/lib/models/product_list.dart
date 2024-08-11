import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:shop/MOCK/MOCK_DATA.dart';
import 'package:shop/models/product.dart';
import 'package:shop/service/firebase_service.dart';

class ProductList with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService();
  final List<Product> _products = MOCK_PRODUCTS_DATA;

  List<Product> get products => [..._products];

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  int get itemsCount {
    return _products.length;
  }

  void saveProduct(Map<String, dynamic> data) {
    bool hasId = data.containsKey('id');

    final product = Product(
      id: hasId ? data['id'] : const Uuid().v4(),
      title: data['title'],
      description: data['description'],
      price: double.parse(data['price']),
      imageUrl: data['imageUrl'],
    );

    if (hasId) {
      updateProduct(product);
    } else {
      addProduct(product);
    }
  }

  void addProduct(Product product) {
    _firebase.methodPOST(
      path: 'products',
      data: {
        'title': product.title,
        'description': product.description,
        'price': product.price.toString(),
        'imageUrl': product.imageUrl,
        'isFavorite': product.isFavorite,
      },
    );

    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    final productIndex = _products.indexWhere((prod) => prod.id == product.id);

    if (productIndex >= 0) {
      _products[productIndex] = product;
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    bool hasProductId =
        _products.indexWhere((prod) => prod.id == product.id) >= 0;

    if (hasProductId) {
      _products.remove(product);
      notifyListeners();
    }
  }
}
