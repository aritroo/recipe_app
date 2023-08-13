import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/models/meal.dart';

class FavoritesProvider extends StateNotifier<List<Meal>> {
  FavoritesProvider() : super([]);

  bool onToggleFavorites(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesProvider, List<Meal>>(
  (ref) => FavoritesProvider(),
);
