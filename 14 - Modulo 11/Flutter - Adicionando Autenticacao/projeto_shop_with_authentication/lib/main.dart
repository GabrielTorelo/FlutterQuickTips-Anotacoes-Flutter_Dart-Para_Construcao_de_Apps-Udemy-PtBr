import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/screens/auth_or_home_screen.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/orders_screen.dart';
import 'package:shop/screens/product_details_screen.dart';
import 'package:shop/screens/product_form_screen.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (_, auth, previousProducts) => ProductList(
            token: auth.token ?? '',
            userId: auth.userId ?? '',
            products: previousProducts?.products ?? [],
          ),
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (_, auth, previousOrders) => OrderList(
            token: auth.token ?? '',
            userId: auth.userId ?? '',
            orders: previousOrders?.items ?? [],
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
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
            headlineLarge: const TextStyle(
              fontFamily: 'Anton',
              fontSize: 45,
              color: Colors.white,
            ),
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
            labelMedium: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
          AppRoutes.authOrHome: (_) => const AuthOrHomeScreen(),
          AppRoutes.productDetail: (_) => const ProductDetailsScreen(),
          AppRoutes.cart: (_) => const CartScreen(),
          AppRoutes.orders: (_) => const OrdersScreen(),
          AppRoutes.products: (_) => const ProductsScreen(),
          AppRoutes.productForm: (_) => const ProductFormScreen(),
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
