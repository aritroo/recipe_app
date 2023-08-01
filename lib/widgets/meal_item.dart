import 'package:flutter/material.dart';
import 'package:recipe_app/screens/mealDetail.dart';
import 'package:recipe_app/widgets/mealTrait.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/models/meal.dart';

class MealItem extends StatelessWidget {
  MealItem({
    super.key,
    required this.meals,
  });
  final Meal meals;

  String get complexityText {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affordablityText {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  void _getMeals(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          title: meals.title,
          url: meals.imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => _getMeals(context),
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meals.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  left: 50.w,
                  bottom: 3.h,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 1.h,
                    ),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meals.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MealTrait(
                    icon: Icons.schedule,
                    label: '${meals.duration} min',
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  MealTrait(
                    icon: Icons.work,
                    label: complexityText,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  MealTrait(
                    icon: Icons.attach_money,
                    label: affordablityText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}