import 'package:flutter/material.dart';
import 'package:projeto_minesweeper/screens/Minesweeper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Minesweeper',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black45,
        ),
        textTheme: theme.textTheme.copyWith(
          labelLarge: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Minesweeper(),
    );
  }
}
