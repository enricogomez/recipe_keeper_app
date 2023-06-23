import 'package:flutter/material.dart';
import 'package:recipe_keeper_app/data/dummy_data.dart';
import 'package:recipe_keeper_app/models/category.dart';
import 'package:recipe_keeper_app/models/meal.dart';
import 'package:recipe_keeper_app/screens/meals_screen.dart';
import 'package:recipe_keeper_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.meals,
  });

  final List<Meal> meals;

  void selectCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: meals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onPress: () {
              selectCategory(context, category);
            },
          )
      ],
    );
  }
}
