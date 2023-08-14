import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app/providers/filtersProvider.dart';

class FilterScreen extends ConsumerWidget {
  FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your-Filters',
        ),
      ),
      // drawer: MainDrawer(
      //   onSelectItem: (identifier) {
      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (ctx) => TabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: availableFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.glutenFree,
                    isChecked,
                  );
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: EdgeInsets.only(
              top: 2.h,
              left: 6.w,
              right: 4.w,
            ),
          ),
          SwitchListTile(
            value: availableFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.lactoseFree,
                    isChecked,
                  );
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: EdgeInsets.only(
              top: 2.h,
              left: 6.w,
              right: 4.w,
            ),
          ),
          SwitchListTile(
            value: availableFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.vegetarian,
                    isChecked,
                  );
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Veg meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: EdgeInsets.only(
              top: 2.h,
              left: 6.w,
              right: 4.w,
            ),
          ),
          SwitchListTile(
            value: availableFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(
                    Filter.vegan,
                    isChecked,
                  );
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: EdgeInsets.only(
              top: 2.h,
              left: 6.w,
              right: 4.w,
            ),
          ),
        ],
      ),
    );
  }
}
