import 'package:flutter/material.dart';
import 'package:meals/MOCK/MOCK_DATA.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/routes/app_routes.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/four_zero_four_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = MOCK_MEALS_DATA;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = MOCK_MEALS_DATA.where((meal) {
        final isGlutenFree = settings.isGlutenFree && !meal.isGlutenFree;
        final isLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        final isVegan = settings.isVegan && !meal.isVegan;
        final isVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !isGlutenFree && !isLactoseFree && !isVegan && !isVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          tertiary: Colors.lightBlueAccent,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 18,
            color: Colors.black,
          ),
          labelLarge: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Colors.pink,
          ),
          labelMedium: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelSmall: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 15,
            color: Colors.grey[700],
          ),
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Releway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.pink,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.amber,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.pink,
        ),
      ),
      routes: {
        AppRoutes.home: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (_) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (_) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (_) => SettingsScreen(_filterMeals, settings),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const FourZeroFourScreen();
          },
        );
      },
    );
  }
}
