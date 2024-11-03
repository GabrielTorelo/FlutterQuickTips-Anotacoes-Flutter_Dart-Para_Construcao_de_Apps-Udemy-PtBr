import 'package:meals/models/meal_enums.dart';
import 'package:uuid/uuid.dart';

class Ingredient {
  final String id = const Uuid().v4();
  final String quantity;
  final IngredientMeasure measure;
  final String name;

  Ingredient({
    required this.quantity,
    required this.measure,
    required this.name,
  });
}
