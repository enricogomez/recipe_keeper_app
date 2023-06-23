import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_keeper_app/providers/filters_provider.dart';
import 'package:recipe_keeper_app/widgets/filter_item.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Glutten-free',
            isChecked: activeFilters[Filter.gluttenFree]!,
            onSwitch: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.gluttenFree, isChecked);
            },
          ),
          FilterItem(
            title: 'Lactose Free',
            isChecked: activeFilters[Filter.lactoseFree]!,
            onSwitch: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FilterItem(
            title: 'Vegetarian',
            isChecked: activeFilters[Filter.vegetarian]!,
            onSwitch: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
              title: 'Vegan',
              isChecked: activeFilters[Filter.vegan]!,
              onSwitch: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              }),
        ],
      ),
    );
  }
}
