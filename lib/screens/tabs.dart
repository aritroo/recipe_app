import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal.dart';
import 'package:recipe_app/screens/categoryScreen.dart';
import 'package:recipe_app/screens/filters.dart';
import 'package:recipe_app/screens/mealScreen.dart';
import 'package:recipe_app/widgets/mainDrawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeScreenIndex = 0;
  final List<Meal> _favoritesMeal = [];

  void _toggleFavoriteStatus(Meal meal) {
    final isContains = _favoritesMeal.contains(meal);
    ScaffoldMessenger.of(context).clearSnackBars();

    if (isContains) {
      setState(() {
        _favoritesMeal.remove(meal);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed Meal'),
        ),
      );
    } else {
      setState(() {
        _favoritesMeal.add(meal);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added Meal'),
        ),
      );
    }
  }

  void _selectScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void _setScreen(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen(
      onSelectFavorite: _toggleFavoriteStatus,
    );
    var activeScreenTitle = 'Categories';
    if (activeScreenIndex == 1) {
      activeScreen = MealScreen(
        meals: _favoritesMeal,
        onSelectFavorite: _toggleFavoriteStatus,
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
