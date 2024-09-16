import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_firebase_chat/helpers/colored_logs.dart';
import 'package:projeto_firebase_chat/routes/app_routes.dart';
import 'package:projeto_firebase_chat/routes/custom_routes.dart';
import 'package:projeto_firebase_chat/screens/auth_or_home_screen.dart';
import 'package:projeto_firebase_chat/screens/loading_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Firebase Chat',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionsBuilder(),
            TargetPlatform.iOS: CustomPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.authOrHome: (_) => const AuthOrHomeScreen(),
        AppRoutes.loading: (_) => const LoadingScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const AuthOrHomeScreen();
          },
        );
      },
    );
  }
}

final ColoredLogs logs = ColoredLogs();
