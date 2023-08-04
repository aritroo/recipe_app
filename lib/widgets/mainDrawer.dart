import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectItem,
  });
  final void Function(String identifier) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 25.sp,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
            onTap: () => onSelectItem('meals'),
          ),
          SizedBox(
            height: 1.h,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
            onTap: () => onSelectItem('filters'),
          ),
        ],
      ),
    );
  }
}
