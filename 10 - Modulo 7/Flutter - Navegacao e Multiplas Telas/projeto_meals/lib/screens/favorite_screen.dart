import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(
    this.favoriteMeals, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('You have no favorites yet',
                style: Theme.of(context).textTheme.titleMedium),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                meal: favoriteMeals[index],
              );
            },
          );
  }
}
