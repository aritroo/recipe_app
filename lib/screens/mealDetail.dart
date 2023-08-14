import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/favoritesProvider.dart';
import 'package:recipe_app/widgets/mealDetailItem.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MealDetailScreen extends ConsumerWidget {
  MealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesMeals = ref.watch(favoritesMealsProvider);
    final isFavorite = favoritesMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritesMealsProvider.notifier)
                  .onToggleFavorites(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Meal added as Favorite meal.'
                        : 'Meal Removed from favorites .',
                  ),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30.h,
              width: double.infinity,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 1.h,
              ),
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  style: BorderStyle.solid,
                ),
              ),
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => MealDetailItem(
                  ingrident: meal.ingredients[index],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            for (final step in meal.steps)
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(step),
              ),
          ],
        ),
      ),
    );
  }
}
