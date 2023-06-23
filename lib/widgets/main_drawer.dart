import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});

  final Function(String screen) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.green),
          child: Row(
            children: [
              const Icon(Icons.fastfood, size: 48),
              const SizedBox(width: 10),
              Text(
                'Cooking Up!',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          onTap: () {
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          onTap: () {
            onSelectScreen('filters');
          },
        )
      ]),
    );
  }
}
