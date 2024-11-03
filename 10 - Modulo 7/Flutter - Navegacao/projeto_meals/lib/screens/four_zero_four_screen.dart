import 'package:flutter/material.dart';

class FourZeroFourScreen extends StatelessWidget {
  const FourZeroFourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - Screen not found'),
      ),
      body: Ink(
        color: Colors.pink,
        child: Center(
          child: Text(
            '404 - Screen not found',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
