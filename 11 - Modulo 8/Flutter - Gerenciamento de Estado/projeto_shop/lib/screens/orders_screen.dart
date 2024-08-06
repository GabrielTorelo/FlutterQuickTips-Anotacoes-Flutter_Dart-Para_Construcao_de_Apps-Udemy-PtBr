import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList order = Provider.of<OrderList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: order.items.isEmpty
          ? Center(
              child: Text(
                'No orders yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: order.itemsCount,
              itemBuilder: (ctx, index) => OrderWidget(
                order: order.items[index],
              ),
            ),
    );
  }
}
