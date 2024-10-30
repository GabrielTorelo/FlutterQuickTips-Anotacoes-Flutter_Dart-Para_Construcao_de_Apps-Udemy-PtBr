import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
