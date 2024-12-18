import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> availableMeals;

  const CategoriesMealsScreen(
    this.availableMeals, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = availableMeals.where((meal) {
      return meal.idsCategories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: categoryMeals.isNotEmpty
          ? ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (ctx, index) {
                return MealItem(meal: categoryMeals[index]);
              },
            )
          : Center(
              child: Text(
                'No meals found!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
