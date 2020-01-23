import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal/meal_item.dart';

class MealList extends StatelessWidget {
  MealList(this.meals);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext _, int index) {
        return MealItem(meals[index]);
      },
      itemCount: meals.length,
    );
  }
}
