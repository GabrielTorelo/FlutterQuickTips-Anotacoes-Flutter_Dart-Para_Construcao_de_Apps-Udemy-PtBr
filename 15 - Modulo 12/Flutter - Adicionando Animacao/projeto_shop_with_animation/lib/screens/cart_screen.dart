import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/routes/app_routes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isAwaiting = false;

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final List<CartItem> items = cart.items.values.toList();
    final OrderList order = Provider.of<OrderList>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: items.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No items in the cart',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text('Back to Shop'),
                    ),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 25,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Text(
                            'Total',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Chip(
                          label: Text(
                            '\$ ${cart.totalAmount.toStringAsFixed(2)}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Spacer(),
                        IgnorePointer(
                          ignoring: isAwaiting,
                          child: TextButton(
                            onPressed: () async {
                              setState(() => isAwaiting = !isAwaiting);
                              await order.addOrder(cart).then((_) {
                                cart.clearList();
                              }).catchError((_) {
                                showDialog(
                                  context: context,
                                  builder: (_) => const AlertError(),
                                );
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('ORDER NOW'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (ctx, index) {
                      return CartItemWidget(
                        cartItem: items[index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
