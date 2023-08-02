import 'package:flutter/material.dart';
import 'package:recipe_app/screens/categoryScreen.dart';
import 'package:recipe_app/screens/mealScreen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int activeScreenIndex = 0;

  void _setScreen(int index) {
    setState(() {
      activeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen();
    var activeScreenTitle = 'Categories';
    if (activeScreenIndex == 1) {
      activeScreen = MealScreen(
        meals: [],
      );
      activeScreenTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setScreen,
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
