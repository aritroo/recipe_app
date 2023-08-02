import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MealDetailItem extends StatelessWidget {
  const MealDetailItem({
    super.key,
    required this.ingrident,
  });
  final String ingrident;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 134, 0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 2.w,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        child: Text(
          ingrident,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
