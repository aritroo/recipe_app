import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });
  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.8),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
