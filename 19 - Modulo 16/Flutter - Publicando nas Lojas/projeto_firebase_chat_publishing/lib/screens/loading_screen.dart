import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  Stream<String> _loadingStream() async* {
    int dotCount = 0;
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      dotCount = (dotCount + 1) % 4;

      yield "Loading ${"." * dotCount}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            ),
            StreamBuilder<String>(
              stream: _loadingStream(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? 'Loading',
                  style: Theme.of(context).textTheme.labelMedium,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
