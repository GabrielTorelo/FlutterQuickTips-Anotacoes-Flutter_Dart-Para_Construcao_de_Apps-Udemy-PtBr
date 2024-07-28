import 'package:flutter/material.dart';
import 'package:meals/MOCK/MOCK_DATA.dart';
import 'package:meals/components/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeals'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: MOCK_CATEGORIES_DATA
              .map(
                (category) => CategoryItem(category),
              )
              .toList(),
        ),
      ),
    );
  }
}
