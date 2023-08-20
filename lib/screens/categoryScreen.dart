import 'package:flutter/material.dart';
import 'package:recipe_app/data/dummy.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/screens/mealScreen.dart';
import 'package:recipe_app/widgets/caregoryItem.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (ctx) => MealScreen(),
    //   ),
    // );
    final filteredMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          meals: filteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        child: child,
        position: Tween(
          begin: Offset(0, 0.3),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }
}
