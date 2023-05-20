import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixth_app/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            value: activeFilter[Filter.glutenFree]!,
            onchanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .filterMeal(Filter.glutenFree, isChecked);
            },
            title: 'Gluten-free',
            subtitle: 'Will show only meal with gluten free',
          ),
          FilterItem(
            value: activeFilter[Filter.vegan]!,
            onchanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .filterMeal(Filter.vegan, isChecked);
            },
            title: 'Vegan',
            subtitle: 'Will show the vegan meal',
          ),
          FilterItem(
            value: activeFilter[Filter.vegetarian]!,
            onchanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .filterMeal(Filter.vegetarian, isChecked);
            },
            title: 'Vegetarian',
            subtitle: 'Will show the vegetarian meal',
          ),
          FilterItem(
            value: activeFilter[Filter.lactoseFree]!,
            onchanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .filterMeal(Filter.lactoseFree, isChecked);
            },
            title: 'Lactose-free',
            subtitle: 'Will show the LactoseFree meal',
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.value,
      required this.onchanged,
      required this.title,
      required this.subtitle});
  final bool value;
  final void Function(bool isChecked) onchanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onchanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontSize: 21,
            ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 22, right: 12),
    );
  }
}
