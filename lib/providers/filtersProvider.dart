import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/mealsProvider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
        (ref) => FiltersProvider());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final avilableFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (avilableFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (avilableFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (avilableFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (avilableFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
