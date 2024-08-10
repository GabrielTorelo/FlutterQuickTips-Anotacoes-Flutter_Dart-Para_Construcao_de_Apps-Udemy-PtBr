import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
                        Navigator.of(context).pop();
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
                        TextButton(
                          onPressed: () {
                            order.addOrder(cart);
                            cart.clearList();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('ORDER NOW'),
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
