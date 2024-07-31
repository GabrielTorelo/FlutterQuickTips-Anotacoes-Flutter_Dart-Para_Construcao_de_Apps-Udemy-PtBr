import 'package:flutter/material.dart';
import 'package:shop/MOCK/MOCK_DATA.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _products = MOCK_PRODUCTS_DATA;

  List<Product> get products => [..._products];

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }
}
