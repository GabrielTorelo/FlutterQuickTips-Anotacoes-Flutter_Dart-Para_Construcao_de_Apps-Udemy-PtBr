import 'package:flutter/material.dart';
import 'package:projeto_my_places/helpers/colored_logs.dart';
import 'package:projeto_my_places/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'package:projeto_my_places/routes/app_routes.dart';
import 'package:projeto_my_places/routes/custom_routes.dart';
import 'package:projeto_my_places/screens/place_form_screen.dart';
import 'package:projeto_my_places/screens/places_list_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'My Places',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
          textTheme: theme.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
            backgroundColor: Colors.indigo,
            centerTitle: true,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
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
          AppRoutes.placeForm: (_) => const PlaceFormScreen(),
          // AppRoutes.placeDetail: (_) => const PlaceDetailScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) {
              return const PlacesListScreen();
            },
          );
        },
      ),
    );
  }
}

final ColoredLogs logs = ColoredLogs();
