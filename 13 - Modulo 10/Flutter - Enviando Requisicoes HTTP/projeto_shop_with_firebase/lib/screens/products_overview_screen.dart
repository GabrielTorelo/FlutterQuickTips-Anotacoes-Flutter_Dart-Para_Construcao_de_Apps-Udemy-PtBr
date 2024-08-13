import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/distinctive.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/routes/app_routes.dart';

class ProductsOverviewScreen extends StatefulWidget {
  final FilterOptions selectedOption = FilterOptions.all;

  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  late FilterOptions selectedOption;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;

    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().catchError(
      (_) {
        showDialog(
          context: context,
          builder: (_) => const AlertError(),
        );
      },
    ).whenComplete(() => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
            ),
            builder: (ctx, cart, child) {
              return cart.itemCount > 0
                  ? Distinctive(
                      value: cart.itemCount.toString(),
                      child: child!,
                    )
                  : child!;
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              selectedOption == FilterOptions.favorites
                  ? const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('Show All'),
                    )
                  : const PopupMenuItem(
                      value: FilterOptions.favorites,
                      child: Text('Only Favorites'),
                    ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                selectedOption = selectedValue;
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(
              selectedOption: selectedOption,
            ),
      drawer: const AppDrawer(),
    );
  }
}
