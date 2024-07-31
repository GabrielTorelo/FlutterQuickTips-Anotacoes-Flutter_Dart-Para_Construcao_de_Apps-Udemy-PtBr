import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: loadedProducts.length,
        itemBuilder: (context, index) => ProductItem(
          product: loadedProducts[index],
        ),
      ),
    );
  }
}
