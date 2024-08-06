import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_details_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
            tertiary: Colors.black87,
          ),
          textTheme: theme.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleMedium: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            titleSmall: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            labelLarge: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              color: Colors.black,
            ),
            labelSmall: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.purple,
            centerTitle: true,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (_) => const ProductsOverviewScreen(),
          AppRoutes.productDetail: (_) => const ProductDetailsScreen(),
          AppRoutes.cart: (_) => const CartScreen(),
          AppRoutes.orders: (_) => const OrdersScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) {
              return const ProductsOverviewScreen();
            },
          );
        },
      ),
    );
  }
}
