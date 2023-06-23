import 'package:recipe_keeper_app/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';

final mealsProvider = Provider((ref) => dummyMeals);
