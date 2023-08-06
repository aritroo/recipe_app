import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/screens/mealScreen.dart';
import 'package:recipe_app/widgets/caregoryItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onSelectFavorite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onSelectFavorite;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (ctx) => MealScreen(),
    //   ),
    // );
    final filteredMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          meals: filteredMeals,
          title: category.title,
          onSelectFavorite: onSelectFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        // We are using list inside a list so spread "..." operator is used
        // ...availableCategories
        //     .map((category) => CategoryItem(category: category))
        //     .toList()
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          ),
      ],
    );
  }
}
