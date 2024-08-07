import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        title: Text(product.title),
        subtitle: Text(product.price.toString()),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
                color: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
        ));
  }
}
