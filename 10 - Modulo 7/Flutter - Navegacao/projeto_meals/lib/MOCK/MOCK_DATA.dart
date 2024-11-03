import 'package:meals/models/category.dart';
import 'package:meals/models/ingredient.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/meal_enums.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

List<Category> MOCK_CATEGORIES_DATA = [
  Category(
    id: idCategories["italiano"]!,
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: idCategories["rapido"]!,
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: idCategories["hamburgers"]!,
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: idCategories["alema"]!,
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: idCategories["leve"]!,
    title: 'Light & Healthy',
    color: Colors.amber,
  ),
  Category(
    id: idCategories["exotica"]!,
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: idCategories["cafe"]!,
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: idCategories["asiatica"]!,
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: idCategories["francesa"]!,
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: idCategories["verao"]!,
    title: 'Summer',
    color: Colors.teal,
  ),
];

List<Meal> MOCK_MEALS_DATA = [
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["italiano"]!, idCategories["rapido"]!],
    title: 'Spaghetti with Tomato Sauce',
    cost: Cost.cheap,
    complexity: Complexity.simple,
    imageUrl: MealsImage.spaghetti(),
    duration: 20,
    ingredients: [
      Ingredient(
        quantity: '4',
        measure: IngredientMeasure.item,
        name: 'Tomatoes',
      ),
      Ingredient(
          quantity: '1',
          measure: IngredientMeasure.tablespoon,
          name: 'Olive Oil'),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Onion',
      ),
      Ingredient(
        quantity: '250',
        measure: IngredientMeasure.gram,
        name: 'Spaghetti',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Spices',
      ),
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["rapido"]!],
    title: 'Toast Hawaii',
    cost: Cost.cheap,
    complexity: Complexity.simple,
    imageUrl: MealsImage.toastHawaii(),
    duration: 10,
    ingredients: [
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.slice,
        name: 'White Bread',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.slice,
        name: 'Ham',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.slice,
        name: 'Pineapple',
      ),
      Ingredient(
        quantity: '1-2',
        measure: IngredientMeasure.slice,
        name: 'Cheese',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Butter',
      ),
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["rapido"]!, idCategories["hamburgers"]!],
    title: 'Classic Hamburger',
    cost: Cost.fair,
    complexity: Complexity.simple,
    imageUrl: MealsImage.classicHamburger(),
    duration: 45,
    ingredients: [
      Ingredient(
        quantity: '300',
        measure: IngredientMeasure.gram,
        name: 'Cattle Hack',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Tomato',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Cucumber',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Onion',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Ketchup',
      ),
      Ingredient(
        quantity: '2',
        measure: IngredientMeasure.item,
        name: 'Burger Buns',
      ),
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["alema"]!],
    title: 'Wiener Schnitzel',
    cost: Cost.expensive,
    complexity: Complexity.medium,
    imageUrl: MealsImage.wienerSchnitzel(),
    duration: 60,
    ingredients: [
      Ingredient(
        quantity: '8',
        measure: IngredientMeasure.item,
        name: 'Veal Cutlets',
      ),
      Ingredient(
        quantity: '4',
        measure: IngredientMeasure.item,
        name: 'Eggs',
      ),
      Ingredient(
        quantity: '200',
        measure: IngredientMeasure.gram,
        name: 'Bread Crumbs',
      ),
      Ingredient(
        quantity: '100',
        measure: IngredientMeasure.gram,
        name: 'Flour',
      ),
      Ingredient(
        quantity: '300',
        measure: IngredientMeasure.milliliter,
        name: 'Butter',
      ),
      Ingredient(
        quantity: '100',
        measure: IngredientMeasure.gram,
        name: 'Vegetable Oil',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Salt',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Lemon Slices',
      ),
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [
      idCategories["rapido"]!,
      idCategories["leve"]!,
      idCategories["verao"]!
    ],
    title: 'Salad with Smoked Salmon',
    cost: Cost.expensive,
    complexity: Complexity.simple,
    imageUrl: MealsImage.saladSalmon(),
    duration: 15,
    ingredients: [
      Ingredient(
        quantity: '50',
        measure: IngredientMeasure.gram,
        name: 'Arugula',
      ),
      Ingredient(
        quantity: '150',
        measure: IngredientMeasure.gram,
        name: 'Lamb\'s Lettuce',
      ),
      Ingredient(
        quantity: '50',
        measure: IngredientMeasure.gram,
        name: 'Parsley',
      ),
      Ingredient(
        quantity: '50',
        measure: IngredientMeasure.gram,
        name: 'Fennel',
      ),
      Ingredient(
        quantity: '200',
        measure: IngredientMeasure.gram,
        name: 'Smoked Salmon',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Mustard',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Balsamic Vinegar',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Olive Oil',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Salt and Pepper',
      ),
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["exotica"]!, idCategories["verao"]!],
    title: 'Delicious Orange Mousse',
    cost: Cost.cheap,
    complexity: Complexity.difficult,
    imageUrl: MealsImage.orangeMousse(),
    duration: 240,
    ingredients: [
      Ingredient(
        quantity: '4',
        measure: IngredientMeasure.sheet,
        name: 'Gelatine',
      ),
      Ingredient(
        quantity: '150',
        measure: IngredientMeasure.milliliter,
        name: 'Orange Juice',
      ),
      Ingredient(
        quantity: '80',
        measure: IngredientMeasure.gram,
        name: 'Sugar',
      ),
      Ingredient(
        quantity: '300',
        measure: IngredientMeasure.gram,
        name: 'Yoghurt',
      ),
      Ingredient(
        quantity: '200',
        measure: IngredientMeasure.gram,
        name: 'Cream',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Orange Peel',
      ),
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["cafe"]!],
    title: 'Pancakes',
    cost: Cost.cheap,
    complexity: Complexity.simple,
    imageUrl: MealsImage.pancakes(),
    duration: 20,
    ingredients: [
      Ingredient(
        quantity: '1 1/2',
        measure: IngredientMeasure.cup,
        name: 'all-purpose Flour',
      ),
      Ingredient(
        quantity: '3 1/2',
        measure: IngredientMeasure.teaspoon,
        name: 'Baking Powder',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.teaspoon,
        name: 'Salt',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.tablespoon,
        name: 'White Sugar',
      ),
      Ingredient(
        quantity: '1 1/4',
        measure: IngredientMeasure.cup,
        name: 'Milk',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Egg',
      ),
      Ingredient(
        quantity: '3',
        measure: IngredientMeasure.tablespoon,
        name: 'Butter, melted',
      ),
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["asiatica"]!],
    title: 'Creamy Indian Chicken Curry',
    cost: Cost.fair,
    complexity: Complexity.medium,
    imageUrl: MealsImage.indianChicken(),
    duration: 35,
    ingredients: [
      Ingredient(
        quantity: '4',
        measure: IngredientMeasure.item,
        name: 'Chicken Breasts',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Onion',
      ),
      Ingredient(
        quantity: '2',
        measure: IngredientMeasure.cloves,
        name: 'Garlic',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.piece,
        name: 'Ginger',
      ),
      Ingredient(
        quantity: '4',
        measure: IngredientMeasure.tablespoon,
        name: 'Almonds',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.teaspoon,
        name: 'Cayenne Pepper',
      ),
      Ingredient(
        quantity: '500',
        measure: IngredientMeasure.milliliter,
        name: 'Coconut Milk',
      ),
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [idCategories["francesa"]!],
    title: 'Chocolate Souffle',
    cost: Cost.cheap,
    complexity: Complexity.difficult,
    imageUrl: MealsImage.chocoSouffle(),
    duration: 45,
    ingredients: [
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.teaspoon,
        name: 'melted Butter',
      ),
      Ingredient(
        quantity: '2',
        measure: IngredientMeasure.tablespoon,
        name: 'white Sugar',
      ),
      Ingredient(
        quantity: '2',
        measure: IngredientMeasure.ounce,
        name: '70% dark Chocolate, broken into pieces',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.tablespoon,
        name: 'Butter',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.tablespoon,
        name: 'all-purpose Flour',
      ),
      Ingredient(
        quantity: '4 1/3',
        measure: IngredientMeasure.tablespoon,
        name: 'cold Milk',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.pinch,
        name: 'Salt',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.pinch,
        name: 'Cayenne Pepper',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.item,
        name: 'Egg Yolk',
      ),
      Ingredient(
        quantity: '2',
        measure: IngredientMeasure.item,
        name: 'Egg Whites',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.pinch,
        name: 'Cream of Tartar',
      ),
      Ingredient(
        quantity: '1',
        measure: IngredientMeasure.tablespoon,
        name: 'white Sugar',
      ),
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: const Uuid().v4(),
    idsCategories: [
      idCategories["rapido"]!,
      idCategories["leve"]!,
      idCategories["verao"]!
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    cost: Cost.expensive,
    complexity: Complexity.simple,
    imageUrl: MealsImage.asparagusSalad(),
    duration: 30,
    ingredients: [
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'White and Green Asparagus',
      ),
      Ingredient(
        quantity: '30',
        measure: IngredientMeasure.gram,
        name: 'Pine Nuts',
      ),
      Ingredient(
        quantity: '300',
        measure: IngredientMeasure.gram,
        name: 'Cherry Tomatoes',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Salad',
      ),
      Ingredient(
        quantity: 'Some',
        measure: IngredientMeasure.item,
        name: 'Salt, Pepper and Olive Oil',
      ),
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];

final Map<String, String> idCategories = {
  "italiano": const Uuid().v4(),
  "rapido": const Uuid().v4(),
  "hamburgers": const Uuid().v4(),
  "alema": const Uuid().v4(),
  "leve": const Uuid().v4(),
  "exotica": const Uuid().v4(),
  "cafe": const Uuid().v4(),
  "asiatica": const Uuid().v4(),
  "francesa": const Uuid().v4(),
  "verao": const Uuid().v4(),
};

enum MealsImage {
  spaghetti(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg",
  ),
  toastHawaii(
    "https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg",
  ),
  classicHamburger(
    "https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg",
  ),
  wienerSchnitzel(
    "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg",
  ),
  saladSalmon(
    "https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg",
  ),
  orangeMousse(
    "https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg",
  ),
  pancakes(
    "https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg",
  ),
  indianChicken(
    "https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg",
  ),
  chocoSouffle(
    "https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg",
  ),
  asparagusSalad(
    "https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg",
  );

  final String imageUrl;
  const MealsImage(this.imageUrl);

  String call() => imageUrl;
}
