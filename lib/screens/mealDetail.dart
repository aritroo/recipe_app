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
  final count = 0;
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
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0.8,
                    end: 1,
                  ).animate(
                    animation,
                  ),
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
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
              child: Hero(
                tag: meal.id,
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                    meal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
            SizedBox(
              height: 1.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              height: 30.h,
              width: 70.w,
              padding: EdgeInsets.all(3),
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple.shade300,
                    child: Text('${index + 1}'),
                  ),
                  title: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(meal.steps[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
