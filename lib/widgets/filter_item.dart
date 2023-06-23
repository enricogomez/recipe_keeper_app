import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    required this.title,
    required this.isChecked,
    required this.onSwitch,
    super.key,
  });

  final String title;
  final bool isChecked;
  final Function(bool isChecked) onSwitch;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isChecked,
      onChanged: onSwitch,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        'Only include $title meals.',
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
