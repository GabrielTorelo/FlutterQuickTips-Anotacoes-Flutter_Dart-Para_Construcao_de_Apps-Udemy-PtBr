import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/alert_error.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders().catchError(
      (_) {
        showDialog(
          context: context,
          builder: (_) => const AlertError(),
        );
      },
    ).whenComplete(() => setState(() => _isLoading = false));
  }

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final OrderList order = Provider.of<OrderList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => _refreshOrders(context),
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
    );
  }
}
