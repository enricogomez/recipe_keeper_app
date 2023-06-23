import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_keeper_app/providers/favorites_provider.dart';
import 'package:recipe_keeper_app/providers/filters_provider.dart';
import 'package:recipe_keeper_app/screens/categories_screen.dart';
import 'package:recipe_keeper_app/screens/filters_screen.dart';
import 'package:recipe_keeper_app/screens/meals_screen.dart';
import 'package:recipe_keeper_app/widgets/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedPageIndex = 0;
  String title = 'Select a category';

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void selectScreen(String screen) async {
    Navigator.pop(context);
    if (screen == 'filters') {
      Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(selectedPageIndex == 1 ? 'Favorites' : 'Pick your category'),
      ),
      drawer: MainDrawer(onSelectScreen: selectScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      body: selectedPageIndex == 1
          ? MealsScreen(
              meals: ref.watch(favoriteMealsProvider),
            )
          : CategoriesScreen(
              meals: ref.watch(filteredMealsProvider),
            ),
    );
  }
}
