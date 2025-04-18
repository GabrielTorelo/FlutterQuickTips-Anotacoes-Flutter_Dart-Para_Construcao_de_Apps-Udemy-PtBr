import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/components/product_item.dart';

class ProductGrid extends StatelessWidget {
  final FilterOptions selectedOption;

  const ProductGrid({
    super.key,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    final ProductList provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        selectedOption == FilterOptions.favorites
            ? provider.favoriteProducts
            : provider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: const ProductItem(),
      ),
    );
  }
}
