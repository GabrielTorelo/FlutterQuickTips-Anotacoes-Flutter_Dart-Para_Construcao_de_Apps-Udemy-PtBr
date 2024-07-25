import 'package:meals/models/category.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

List<Category> MOCK_CATEGORIES_DATA = [
  Category(
    id: const Uuid().v4(),
    title: 'Italiano',
    color: Colors.purple,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Rápido & Fácil',
    color: Colors.red,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Alemã',
    color: Colors.amber,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Leve & Saudável',
    color: Colors.amber,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Exótica',
    color: Colors.green,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Café da Manhã',
    color: Colors.lightBlue,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Asiática',
    color: Colors.lightGreen,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Francesa',
    color: Colors.pink,
  ),
  Category(
    id: const Uuid().v4(),
    title: 'Verão',
    color: Colors.teal,
  ),
];
