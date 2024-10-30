import 'package:flutter/material.dart';
import 'package:projeto_pomodoro/screens/pomodoro_screen.dart';
// import 'package:projeto_pomodoro/screens/counter_screen.dart';

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
          headlineLarge: const TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
          headlineMedium: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineSmall: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          titleLarge: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
          titleMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const PomodoroScreen(),
      // home: CounterScreen(),
    );
  }
}
