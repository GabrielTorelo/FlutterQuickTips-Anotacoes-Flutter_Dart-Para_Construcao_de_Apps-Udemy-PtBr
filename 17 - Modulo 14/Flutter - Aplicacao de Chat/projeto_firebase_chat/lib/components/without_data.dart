import 'package:flutter/material.dart';

class WithoutData extends StatelessWidget {
  const WithoutData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No data available',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
