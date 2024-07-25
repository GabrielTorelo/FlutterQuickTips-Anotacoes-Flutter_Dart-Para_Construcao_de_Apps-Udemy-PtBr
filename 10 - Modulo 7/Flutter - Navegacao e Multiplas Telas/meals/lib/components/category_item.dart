import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(category.title),
    );
  }
}
