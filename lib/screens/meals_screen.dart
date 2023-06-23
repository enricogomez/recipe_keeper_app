import 'package:flutter/material.dart';
import 'package:recipe_keeper_app/models/meal.dart';
import 'package:recipe_keeper_app/screens/meal_details_screen.dart';
import 'package:recipe_keeper_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.meals,
    this.title,
    super.key,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal selectedMeal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: selectedMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      if (meals.isEmpty) {
        return Center(
          child: Text(
            'No meals found. \n Try selecting a different category.',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onPress: () {
              selectMeal(context, meals[index]);
            },
          ),
        );
      }
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: meals.isEmpty
            ? Center(
                child: Text(
                  'No meals found. \n Try selecting a different category.',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) => MealItem(
                  meal: meals[index],
                  onPress: () {
                    selectMeal(context, meals[index]);
                  },
                ),
              ),
      );
    }
  }
}
