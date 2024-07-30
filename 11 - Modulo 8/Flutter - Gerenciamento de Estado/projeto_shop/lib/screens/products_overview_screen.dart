import 'package:flutter/material.dart';
import 'package:shop/MOCK/MOCK_DATA.dart';
import 'package:shop/models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = MOCK_PRODUCTS_DATA;

  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: loadedProducts.length,
          itemBuilder: (context, index) => SizedBox(
            child: Text(loadedProducts[index].title),
          ),
        ),
      ),
    );
  }
}
