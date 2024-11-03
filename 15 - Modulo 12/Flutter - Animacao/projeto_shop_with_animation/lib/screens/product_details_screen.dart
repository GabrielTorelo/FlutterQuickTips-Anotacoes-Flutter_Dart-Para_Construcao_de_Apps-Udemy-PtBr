import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/distinctive.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/routes/app_routes.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ScrollController _scrollController;
  bool _isPinned = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        setState(() {
          _isPinned = _scrollController.offset >= 300 - kToolbarHeight;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: _isPinned ? Colors.purple : Colors.white,
            expandedHeight: 300,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: _isPinned ? Colors.purple : Colors.white,
                  shape: const CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: _isPinned ? Colors.white : Colors.purple,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            actions: [
              Consumer<Cart>(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: _isPinned ? Colors.purple : Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      color: _isPinned ? Colors.white : Colors.purple,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.cart);
                      },
                    ),
                  ),
                ),
                builder: (ctx, cart, child) {
                  return cart.itemCount > 0
                      ? Distinctive(
                          value: cart.itemCount.toString(),
                          bgColor: _isPinned ? Colors.white : Colors.purple,
                          textColor: _isPinned ? Colors.purple : Colors.white,
                          child: child!,
                        )
                      : child!;
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Hero(
                placeholderBuilder: (context, _, child) {
                  return child;
                },
                tag: product.title,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: Theme.of(context).textTheme.titleSmall?.fontSize!,
                    end: Theme.of(context).textTheme.headlineSmall?.fontSize!,
                  ),
                  duration: const Duration(milliseconds: 100),
                  builder: (context, value, child) {
                    return Material(
                      color: Colors.transparent,
                      child: Text(
                        product.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: value),
                      ),
                    );
                  },
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, 0.8),
                        end: Alignment(0, 0),
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.6),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '\$ ${product.price}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Consumer<Cart>(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cart.addItem(
                          product.id,
                          product.price,
                          product.title,
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Product added to the cart!'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                cart.removeSingleItem(product.id);
                              },
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Adicionar ao Carrinho'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    builder: (ctx, cart, child) {
                      return cart.getProductQuantity(product.id) > 0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Quantidade: '),
                                  Distinctive(
                                    value: cart
                                        .getProductQuantity(product.id)
                                        .toString(),
                                    bgColor: Colors.white,
                                    textColor:
                                        Theme.of(context).colorScheme.secondary,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        cart.addItem(
                                          product.id,
                                          product.price,
                                          product.title,
                                        );
                                      },
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      cart.removeSingleItem(product.id);
                                    },
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ],
                              ),
                            )
                          : child!;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Avaliações dos Clientes',
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star_border, color: Colors.grey),
                              ],
                            ),
                          ),
                          Text(
                            'Avaliação do Lojista',
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Especificações Técnicas',
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '• Cor: ...\n• Tamanho: ...\n• Material: ... \n• Peso: ... \n• Garantia: ...',
                            style:
                                Theme.of(context).primaryTextTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                !isLandScape
                    ? const SizedBox()
                    : Ink(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                        ),
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: Text(
                            '© ${DateTime.now().year} - Todos os direitos reservados',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isLandScape
          ? null
          : Ink(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              height: MediaQuery.of(context).size.height * 0.05,
              child: Center(
                child: Text(
                  '© ${DateTime.now().year} - Todos os direitos reservados',
                  style:
                      Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                ),
              ),
            ),
    );
  }
}
