import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/favoritesProvider.dart';
import 'package:recipe_app/providers/mealsProvider.dart';
import 'package:recipe_app/screens/categoryScreen.dart';
import 'package:recipe_app/screens/filters.dart';
import 'package:recipe_app/screens/mealScreen.dart';
import 'package:recipe_app/widgets/mainDrawer.dart';
import 'package:recipe_app/providers/filtersProvider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int activeScreenIndex = 0;

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(),
        ),
      );
    }
  }

  void _setScreen(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final avilableFilters = ref.watch(filtersProvider);
    final availableMeals = meals.where((meal) {
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
    Widget activeScreen = CategoryScreen(
      availableMeals: availableMeals,
    );
    var activeScreenTitle = 'Categories';
    final favoritesMeal = ref.watch(favoritesMealsProvider);
    if (activeScreenIndex == 1) {
      activeScreen = MealScreen(
        meals: favoritesMeal,
      );
      activeScreenTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: MainDrawer(
        onSelectItem: _selectScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setScreen,
        currentIndex: activeScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
