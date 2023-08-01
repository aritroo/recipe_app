import 'package:flutter/material.dart';

class MealDetailItem extends StatelessWidget {
  const MealDetailItem({
    super.key,
    required this.ingrident,
  });
  final String ingrident;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        ingrident,
      ),
    );
  }
}
