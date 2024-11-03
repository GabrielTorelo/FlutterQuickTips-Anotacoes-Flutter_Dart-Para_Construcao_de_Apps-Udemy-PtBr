import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_calculator/screens/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color.fromRGBO(48, 48, 48, 1),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(48, 48, 48, 1),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w100,
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(48, 48, 48, 1),
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
    );
  }
}
