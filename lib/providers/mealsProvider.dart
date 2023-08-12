import 'package:riverpod/riverpod.dart';
import 'package:recipe_app/data/dummy.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
