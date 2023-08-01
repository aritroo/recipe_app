import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MealTrait extends StatelessWidget {
  MealTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
