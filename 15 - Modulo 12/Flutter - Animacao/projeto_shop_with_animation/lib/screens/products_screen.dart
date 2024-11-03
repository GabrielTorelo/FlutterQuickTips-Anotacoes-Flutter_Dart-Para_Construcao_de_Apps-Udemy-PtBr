import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/routes/app_routes.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList prod = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.productForm);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: prod.itemsCount == 0
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      (AppBar().preferredSize.height +
                          MediaQuery.of(context).padding.top),
                  alignment: Alignment.center,
                  child: Text(
                    'No products found!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: prod.itemsCount,
                  itemBuilder: (context, index) => Card(
                    child: ProductItem(product: prod.products[index]),
                  ),
                ),
              ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
