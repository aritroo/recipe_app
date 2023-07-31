import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy.dart';
import 'package:recipe_app/screens/mealScreen.dart';
import 'package:recipe_app/widgets/caregoryItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (ctx) => MealScreen(),
    //   ),
    // );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          meals: dummyMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView(
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
              onSelectCategory: () => _selectCategory(context),
            ),
        ],
      ),
    );
  }
}
