import 'package:flutter/material.dart';
import 'package:recipe_keeper_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    required this.onPress,
    super.key,
  });

  final Category category;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
