import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/screens/auth_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth provider = Provider.of<Auth>(context);

    return FutureBuilder(
      future: provider.tryAutoLogin(),
      builder: (ctx, snapshot) {
        return switch (snapshot.connectionState) {
          ConnectionState.waiting => Scaffold(
              appBar: AppBar(
                title: const Text('Shop'),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ConnectionState.done => provider.isAuth
              ? const ProductsOverviewScreen()
              : const AuthScreen(),
          _ => const Placeholder(),
        };
      },
    );
  }
}
