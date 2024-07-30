import 'package:flutter/material.dart';
import 'package:shop/routes/app_routes.dart';
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

    return MaterialApp(
      title: 'Shop',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.cyan,
          tertiary: Colors.lightBlueAccent,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {AppRoutes.home: (_) => ProductsOverviewScreen()},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return ProductsOverviewScreen();
          },
        );
      },
    );
  }
}
