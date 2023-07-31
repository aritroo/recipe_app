enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  final String id;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final String imageUrl;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
}
