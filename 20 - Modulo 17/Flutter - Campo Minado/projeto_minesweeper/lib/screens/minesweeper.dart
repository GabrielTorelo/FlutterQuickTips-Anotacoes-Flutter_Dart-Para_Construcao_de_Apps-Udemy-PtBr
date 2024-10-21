import 'package:flutter/material.dart';

class Minesweeper extends StatelessWidget {
  const Minesweeper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minesweeper'),
      ),
      body: const Center(
        child: Text('Minesweeper'),
      ),
    );
  }
}
