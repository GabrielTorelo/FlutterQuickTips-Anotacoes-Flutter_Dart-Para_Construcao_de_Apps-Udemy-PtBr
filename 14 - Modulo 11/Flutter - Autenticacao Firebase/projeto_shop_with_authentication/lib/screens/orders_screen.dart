import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  Future<void> _loadOrders(BuildContext context) async {
    return await Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().catchError(
      (error) {
        error == 'null' || error == null
            ? null
            : showDialog(
                context: context,
                builder: (_) => const AlertError(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: FutureBuilder(
        future: _loadOrders(context),
        builder: (ctx, snapshot) {
          return switch (snapshot.connectionState) {
            ConnectionState.waiting => const Center(
                child: CircularProgressIndicator(),
              ),
            ConnectionState.done => Consumer<OrderList>(
                builder: (ctx, order, _) => RefreshIndicator(
                  onRefresh: () => _loadOrders(context),
                  child: order.items.isEmpty
                      ? SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Container(
                            height: MediaQuery.of(context).size.height -
                                (AppBar().preferredSize.height +
                                    MediaQuery.of(context).padding.top),
                            alignment: Alignment.center,
                            child: Text(
                              'No orders yet!',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: order.itemsCount,
                          itemBuilder: (ctx, index) => OrderWidget(
                            order: order.items[index],
                          ),
                        ),
                ),
              ),
            _ => const Placeholder(),
          };
        },
      ),
    );
  }
}
