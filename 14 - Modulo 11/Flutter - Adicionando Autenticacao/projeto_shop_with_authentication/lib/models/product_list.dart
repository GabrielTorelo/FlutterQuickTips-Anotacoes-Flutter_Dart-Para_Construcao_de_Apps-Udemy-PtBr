import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/firebase_service.dart';

class ProductList with ChangeNotifier {
  final FirebaseService _firebase = FirebaseService(
    requestType: FirebaseRequest.realtimeDB,
  );
  final String _token;
  final List<Product> _products = [];

  ProductList({
    required String token,
    required List<Product> products,
  }) : _token = token {
    _firebase.token = _token;
    _products.addAll(products);
  }

  List<Product> get products => [..._products];

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  int get itemsCount {
    return _products.length;
  }

  Future<void> loadProducts() async {
    final Map<String, dynamic> response = await _firebase.methodGET(
      path: 'products',
    );

    if (response.containsKey('error')) return Future.error(response['error']);

    _products.clear();

    response.forEach((productId, productData) {
      productData['id'] = productId;
      productData['isFavorite'] = productData['isFavorite'] ?? false;
      _products.add(Product.fromJson(productData));
    });

    notifyListeners();
  }

  Future<void> saveProduct(Map<String, dynamic> data) {
    bool hasId = data.containsKey('id');

    final product = Product(
      id: hasId ? data['id'] : const Uuid().v4(),
      title: data['title'],
      description: data['description'],
      price: double.parse(data['price']),
      imageUrl: data['imageUrl'],
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(Product product) async {
    final Map<String, dynamic> response = await _firebase.methodPUT(
      path: 'products',
      id: product.id,
      data: product.toJsonWithoutData(
        fieldsToIgnore: [
          ProductFields.id,
          ProductFields.isFavorite,
        ],
      ),
    );

    if (response.containsKey('error')) return Future.error(response['error']);

    _products.add(product);
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    final int productIndex =
        _products.indexWhere((prod) => prod.id == product.id);

    if (productIndex >= 0) {
      final Map<String, dynamic> response = await _firebase.methodPATCH(
        path: 'products',
        id: product.id,
        data: product.toJsonWithoutData(
          fieldsToIgnore: [
            ProductFields.id,
            ProductFields.isFavorite,
          ],
        ),
      );

      if (response.containsKey('error')) return Future.error(response['error']);

      _products[productIndex] = product;
      notifyListeners();
    }
  }

  Future<void> removeProduct(Product product) async {
    final int productIndex =
        _products.indexWhere((prod) => prod.id == product.id);

    if (productIndex >= 0) {
      final Map<String, dynamic> response = await _firebase.methodDELETE(
        path: 'products',
        id: product.id,
      );

      if (response.containsKey('error') || response['status'] >= 400) {
        return Future.error(response['error']);
      }

      _products.remove(product);
      notifyListeners();
    }
  }
}
