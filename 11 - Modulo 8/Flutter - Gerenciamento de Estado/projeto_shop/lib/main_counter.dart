import 'package:flutter/material.dart';
import 'package:shop/providers/counter_provider.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/screens/counter_screen.dart';
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

    return CounterProvider(
      child: MaterialApp(
        title: 'Shop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
            tertiary: Colors.black87,
          ),
          textTheme: theme.textTheme.copyWith(
            titleSmall: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
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
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.home: (_) => ProductsOverviewScreen(),
          AppRoutes.productDetail: (_) => const CounterScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) {
              return ProductsOverviewScreen();
            },
          );
        },
      ),
    );
  }
}
