import 'package:flutter/material.dart';
import 'package:shop/providers/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    super.key,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider?.state.value.toString() ?? '0'),
            IconButton(
              onPressed: () {
                setState(() {
                  provider?.state.increment();
                  print(provider?.state.value);
                });
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  provider?.state.decrement();
                  print(provider?.state.value);
                });
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
