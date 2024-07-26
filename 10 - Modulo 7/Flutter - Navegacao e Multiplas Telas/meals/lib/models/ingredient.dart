import 'package:uuid/uuid.dart';

class Ingredient {
  final String id = const Uuid().v4();
  final String quantity;
  final String name;

  Ingredient({
    required this.quantity,
    required this.name,
  });
}
