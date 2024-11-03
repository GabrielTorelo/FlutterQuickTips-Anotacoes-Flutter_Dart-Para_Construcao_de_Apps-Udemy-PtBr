import 'package:meals/models/ingredient.dart';
import 'package:meals/models/meal_enums.dart';

class Meal {
  final String id;
  final List<String> idsCategories;
  final String title;
  final String imageUrl;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.idsCategories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.medium:
        return 'Medium';
      case Complexity.difficult:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return 'Cheap';
      case Cost.fair:
        return 'Fair';
      case Cost.expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}
